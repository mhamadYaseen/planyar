# Building and installing Planyar

Planyar is installed as a **sideloaded APK** on the owner's Android phone (D-02). There are two flavors:

| Flavor | App name | Application ID | Use |
|---|---|---|---|
| `prod` | Planyar | `com.muhammadyaseen.planyar` | Your real data. **The ID must never change.** |
| `dev` | Planyar Dev | `com.muhammadyaseen.planyar.dev` | Testing. Installs beside prod with its own database, so it never touches real data. Has **Settings → Developer tools**. |

## The release signing key

- Keystore: `~/planyar-signing/planyar-release.jks` (outside the repo). Password and fingerprint: `~/planyar-signing/README.txt`.
- The repo uses it through `android/key.properties`, which is git-ignored. **Never commit either file.**
- **Back up `~/planyar-signing/` in two places** (password manager + an offline USB copy). Android installs an update over the existing app only if it's signed with the same key. If the key is lost, the only way to update is to uninstall, which deletes all Planyar data.
- On a new computer: copy the folder back to `~/planyar-signing/`, then `cp ~/planyar-signing/key.properties android/key.properties`.
- Release builds stop with an error if `android/key.properties` is missing. That's on purpose: a debug-signed APK on the phone would block every later update.

## Build

```bash
flutter pub get
dart run build_runner build
flutter gen-l10n

# Everyday testing build (installs as "Planyar Dev")
flutter build apk --debug --flavor dev

# Release for daily use
flutter build apk --release --flavor prod
tool/check_release_apk.sh build/app/outputs/flutter-apk/app-prod-release.apk
```

`check_release_apk.sh` confirms the release APK has **no `INTERNET` permission** and that its native libraries are 16 KB aligned.

Before each release, bump `version:` in `pubspec.yaml` (e.g. `1.0.0+1` → `1.0.1+2`) and the same value in `lib/src/core/app_info.dart` (a test checks they match). The number after `+` (the Android `versionCode`) must go up every time, or the phone refuses the update.

## Run from VS Code or Android Studio

- A plain **Run** (or `flutter run`) builds **Planyar Dev**: `default-flavor: dev` in `pubspec.yaml`. In VS Code, Run ▸ also offers "Planyar Dev (release, for speed checks)" and "Planyar — real app (release)" (`.vscode/launch.json`).
- **The real app is release-only.** Debug and profile builds are signed with a different key; installing one fails, and `flutter run` then *uninstalls the real app, deleting its data*, to put it on. The Android build refuses `--flavor prod` in debug or profile mode, so this can't happen by accident.

## Install

**USB:** enable Developer options → USB debugging on the phone, connect it, then:

```bash
adb install -r build/app/outputs/flutter-apk/app-prod-release.apk   # -r keeps your data
adb install -r build/app/outputs/flutter-apk/app-dev-debug.apk
```

**Without a cable:** copy the APK to the phone (e.g. via Files or Drive), open it, and allow "Install unknown apps" for that app once.

**Before reinstalling or switching phones, export a full backup in the app first** (Settings → Backup & restore → Export all data).

## Your data

- **Export a backup now and then:** Settings → Backup & restore → Export all data, and save it off the phone (Drive, a computer). The safety backups the app makes by itself are deleted when you uninstall.
- **Before uninstalling or changing phones**, always export first. On the new phone: install, then **Restore from a backup** on the welcome screen.
- Android's own cloud backup also includes Planyar's data (D-24), so restoring a phone from a Google backup usually brings it back too. Don't rely on it alone.

## iOS

iOS stays buildable but isn't released (D-02). Schemes `dev` and `prod` exist:

```bash
flutter build ios --no-codesign --flavor dev
```
