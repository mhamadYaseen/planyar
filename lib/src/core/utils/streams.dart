import 'dart:async';

/// Emits [combine] of the latest values once both streams have emitted
/// (a tiny `combineLatest`, to avoid adding rxdart).
Stream<R> combineLatest2<A, B, R>(Stream<A> a, Stream<B> b, R Function(A a, B b) combine) {
  late StreamController<R> controller;
  StreamSubscription<A>? subA;
  StreamSubscription<B>? subB;
  A? lastA;
  B? lastB;
  var hasA = false;
  var hasB = false;

  void emit() {
    if (hasA && hasB) controller.add(combine(lastA as A, lastB as B));
  }

  controller = StreamController<R>(
    onListen: () {
      subA = a.listen((v) {
        lastA = v;
        hasA = true;
        emit();
      }, onError: controller.addError);
      subB = b.listen((v) {
        lastB = v;
        hasB = true;
        emit();
      }, onError: controller.addError);
    },
    onPause: () {
      subA?.pause();
      subB?.pause();
    },
    onResume: () {
      subA?.resume();
      subB?.resume();
    },
    onCancel: () async {
      await subA?.cancel();
      await subB?.cancel();
    },
  );
  return controller.stream;
}

/// A Bloc event transformer that waits until events stop for [duration] and
/// then handles only the last one (e.g. the 200 ms overlap check, §8.4.1).
Stream<E> Function(Stream<E> events, Stream<E> Function(E) mapper) debounceEvents<E>(Duration duration) =>
    (events, mapper) => events.transform(_Debounce<E>(duration)).asyncExpand(mapper);

final class _Debounce<E> extends StreamTransformerBase<E, E> {
  const _Debounce(this.duration);

  final Duration duration;

  @override
  Stream<E> bind(Stream<E> stream) {
    late StreamController<E> controller;
    Timer? timer;
    StreamSubscription<E>? sub;
    controller = StreamController<E>(
      onListen: () {
        sub = stream.listen(
          (event) {
            timer?.cancel();
            timer = Timer(duration, () => controller.add(event));
          },
          onError: controller.addError,
          onDone: () {
            timer?.cancel();
            controller.close();
          },
        );
      },
      onCancel: () async {
        timer?.cancel();
        await sub?.cancel();
      },
    );
    return controller.stream;
  }
}
