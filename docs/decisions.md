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

## 2026-10-25 — Colors: "Warm Focus" (changes D-42)

The owner chose a warm yellow/amber palette instead of the slate-teal seed. Full token table in [PROJECT_PLAN.md §12.2](PROJECT_PLAN.md).

| ID | Decision |
|---|---|
| D-42 | **"Warm Focus"**: golden amber accent `#D99A22`, pale yellow highlight `#F3D77A`; light background ivory `#FAF7EF`, cards `#FFFFFF`; dark background charcoal `#211F1A`, cards `#2D2A23`; main text `#292720` / `#F3F0E8`; secondary text `#706B5F` / `#BDB7A9`. Gold is for buttons, selected dates and highlights, never large backgrounds. System / Light / Dark modes. |
| — | Text on gold is dark charcoal (6.1:1); white on gold fails contrast (2.4:1) and isn't used. In light mode, gold-coloured text and icons use a darker **gold ink `#8A5D00`** (5.4:1), because plain gold on ivory is only 2.3:1. In dark mode plain gold passes as text (6.7:1). |
| — | **Warnings move from amber to burnt orange** (`#A8470F` light / `#FFB083` dark), so they stay distinct from the gold accent. Warnings and errors always carry an icon and text. |
| — | The `ColorScheme` is built by hand from these tokens rather than `ColorScheme.fromSeed`, so the exact values ship. Label hues still use `fromSeed` tonal palettes. |

## 2026-10-25 — Platforms

- Removed the unused `linux/`, `macos/`, `web/` and `windows/` folders (owner approved). Only `android/` and `ios/` remain. `flutter create --platforms=<name> .` regenerates any of them.
