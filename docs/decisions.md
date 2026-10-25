# Planyar — Decision log

Running log of confirmed product and technical decisions. The full list with rationale is in [PROJECT_PLAN.md §15](PROJECT_PLAN.md). Add a dated entry whenever a decision is made or changed.

## 2026-10-25 — Plan approved

All recommended defaults in PROJECT_PLAN.md §15 are accepted ("use whatever you prefer"). Specific answers from the owner:

| ID | Decision |
|---|---|
| D-01 | App name **Planyar**. Dart package `planyar`. Android application ID `com.muhammadyaseen.planyar` (must never change — in-place updates depend on it). |
| D-02 | Installed as a **sideloaded release APK** on the owner's Android phone. No Play Store / App Store release for now. iOS stays buildable but is not tested or released. |
| D-09 | First day of the week is **Friday** by default (user-changeable to any day). |
| D-23 | **No database encryption.** |
| D-28 | **English** throughout (UI, docs, code). RTL-ready layouts for possible later localization. |

Derived from the above:

| ID | Decision |
|---|---|
| D-03 | State management: **flutter_bloc** (Bloc with Freezed events/state) + GetIt + GoRouter, per the team Flutter baseline. |
| D-40 | Android exact reminders via **`USE_EXACT_ALARM`** (allowed because the app isn't distributed on Play). `SCHEDULE_EXACT_ALARM` with `maxSdkVersion="32"` for Android 12. Switch to the `SCHEDULE_EXACT_ALARM` request flow if the app is ever published on Play. |
| — | Release signing: one release keystore, created in Phase 0, stored **outside the repository** with backups. Losing it means updates require uninstalling (data loss) — see PROJECT_PLAN.md §9.2 and risk R14. |

## 2026-10-25 — Environment

- Flutter upgraded from 3.44.8 to **3.47.8** (Dart 3.13.7) for Dart 3.13 (needed by freezed 4). Android SDK licenses accepted.
- Project location: `/Users/muhammad/Desktop/projects/planyar` (created by the owner with `flutter create planyar`). Before the first install, the default `com.example.planyar` IDs were changed to **`com.muhammadyaseen.planyar`** for Android (namespace, applicationId, Kotlin package) and iOS (bundle IDs). App label set to **Planyar**.
- A local 3-line patch in the Flutter SDK checkout (`flutter_tools/.../native_assets/macos/native_assets_host.dart`, an otool null check affecting macOS desktop builds only) was saved as a git stash in `/opt/homebrew/share/flutter` before upgrading: `git -C /opt/homebrew/share/flutter stash list`.
