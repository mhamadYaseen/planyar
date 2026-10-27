import 'dart:async';

import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:planyar/src/core/utils/streams.dart';

void main() {
  test('combineLatest2 waits for both, then emits on every change', () async {
    final a = StreamController<int>();
    final b = StreamController<String>();
    final out = <String>[];
    final sub = combineLatest2(a.stream, b.stream, (int x, String y) => '$x$y').listen(out.add);
    a.add(1);
    await pumpEventQueue();
    expect(out, isEmpty);
    b.add('a');
    a.add(2);
    b.add('b');
    await pumpEventQueue();
    expect(out, ['1a', '2a', '2b']);
    await sub.cancel();
  });

  test('debounceEvents keeps only the last event of a burst', () {
    fakeAsync((async) {
      final events = StreamController<int>();
      final handled = <int>[];
      debounceEvents<int>(const Duration(milliseconds: 200))(events.stream, (e) => Stream.value(e)).listen(handled.add);
      events
        ..add(1)
        ..add(2);
      async.elapse(const Duration(milliseconds: 150));
      events.add(3);
      async.elapse(const Duration(milliseconds: 199));
      expect(handled, isEmpty);
      async.elapse(const Duration(milliseconds: 1));
      expect(handled, [3]);
    });
  });
}
