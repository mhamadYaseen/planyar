# Planyar

A calm, offline personal time planner and journal, built with Flutter. Android first (installed as a sideloaded APK); the iOS project is kept buildable.

- Log what you did and what you planned — planned vs actual, side by side.
- Daily routines that fill in your plan automatically, with one-day changes.
- Lightweight long-term tasks with deadlines, repeats, and reminders.
- Weekly, monthly, and custom reports with charts, CSV, and PDF export.
- All data stays on the device, with full backup and restore.

## Status

Project scaffold only. Implementation follows the phased roadmap in the plan.

- [docs/PROJECT_PLAN.md](docs/PROJECT_PLAN.md) — requirements, design, architecture, roadmap
- [docs/decisions.md](docs/decisions.md) — confirmed decisions log

## Requirements

- Flutter 3.47.x (stable), Dart 3.13
- Android SDK 36, JDK 17 or newer

## Run and build

```bash
flutter pub get
flutter run                  # on a connected Android phone or emulator
flutter build apk --release  # APK in build/app/outputs/flutter-apk/
```

These commands change in Phase 0, when `dev` and `prod` flavors and release signing are added (see the plan, §9.2 and §13).
