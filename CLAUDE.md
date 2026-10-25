# Planyar — notes for Claude

Planyar is a calm, offline, single-user personal time planner and journal built with Flutter. **Android first** (the owner installs a sideloaded release APK on their own phone); the iOS project is kept buildable but isn't released. All data stays on the device.

## Read first

- [docs/STATUS.md](docs/STATUS.md) — **current progress, open items, next steps.** Read at the start of every session; update at the end.
- [docs/PROJECT_PLAN.md](docs/PROJECT_PLAN.md) — the approved spec. Requirement IDs (`ENT-01`, `RTN-03`, …), decisions (`D-xx`, §15), architecture (§8), roadmap with definitions of done (§13).
- [docs/decisions.md](docs/decisions.md) — confirmed decisions log. Add a dated entry whenever a decision is made or changed.

## Non-negotiable rules

1. **Actual entries are never created, changed or deleted by automation** (routine generator, migrations). Only the user does that; a merge import may overwrite records with the same ID.
2. **Time types:** instants as UTC epoch ms; local dates as `YYYY-MM-DD`; wall-clock times as minutes since local midnight. All local-time math goes through the `DayMath` helper (`core/time`). Get "now" from `package:clock`.
3. **Routines** (plan §6.7): occurrences are planned entries, unique per `(routineId, occurrenceDate)`. One-day changes are stored as **exceptions**, never as direct edits of generated rows. Only unstarted, unlinked occurrences are ever regenerated.
4. **Domain code is pure Dart.** Nothing under `features/*/domain/` or the core engines may import Flutter, Drift or plugins.
5. **No new packages** beyond plan §8.13 without asking the owner. No networking, analytics or crash-reporting SDKs; the release build must not request the `INTERNET` permission.
6. **Never commit signing material** (`key.properties`, `*.jks`, `*.keystore`). The Android application ID `com.muhammadyaseen.planyar` must never change, or in-place updates (and the owner's data) are lost.
7. **Don't hand-edit generated files** (`*.g.dart`, `*.freezed.dart`, drift output, l10n output); run the generators.

## Architecture (plan §8)

This follows the team Flutter baseline from the installed `flutter-*` skills, **with an owner-approved deviation: no Dio, Retrofit, network interceptors or `ResponseEntity`** (there is no server). Data sources are Drift DAOs.

- **Clean architecture, feature-based** (owner's explicit request): `lib/src/{app,config,core,features}`; each feature has `data/`, `domain/`, `presentation/` and `<feature>_injection.dart`. Dependencies point inwards (presentation → domain ← data); `test/architecture/layer_boundaries_test.dart` enforces it. `features/dev_tools` is the reference example of a full feature (use cases → Bloc → page + widgets).
- State: `flutter_bloc` **Bloc (not Cubit)** with Freezed events/state, async fields as `DataState<T>`.
- DI: GetIt. Routing: GoRouter (`StatefulShellRoute` tabs: Today, Calendar, Tasks, Reports; Settings from the app bar).
- Database: Drift (SQLite) via `drift_flutter`; settings live in the DB (no `shared_preferences`).
- UI: `material_ui` / `cupertino_ui` packages (Material is leaving the Flutter SDK), M3 light + dark.
- Flavors: `dev` ("Planyar Dev", separate app ID and database) and `prod`. English ARB l10n.

## Owner decisions worth remembering

- Weeks start on **Friday** (default, user-changeable). English throughout. No database encryption.
- Sideloaded APK, so exact reminders use **`USE_EXACT_ALARM`** (plan §9.2, D-40).
- The owner said "use whatever you prefer": the plan's recommended defaults are agreed unless `docs/decisions.md` says otherwise.

## Environment

- Flutter **3.47.8** / Dart **3.13.7** (Homebrew-installed SDK at `/opt/homebrew/share/flutter`).
- Android SDK at `~/Library/Android/sdk` (platform 36, build-tools 36.1, platform-tools 37.0.1); JDK is Android Studio's bundled JBR. A second, identical `adb` 37.0.1 exists from Homebrew (`flutter doctor` warns; harmless while versions match).
- **The internet connection is slow (~0.8 MB/s).** Run long downloads and builds in the background and write their output to a log file the owner can follow with `tail -f`.
- GitHub: `origin` = https://github.com/mhamadYaseen/planyar, branch `main`. Git identity is configured globally; GitHub HTTPS credentials are in the macOS keychain; the `gh` CLI isn't installed. Always `git fetch` and check before rewriting history — never force-push without the owner's explicit OK.

## Commands

```bash
flutter pub get
dart run build_runner build        # this build_runner has no --delete-conflicting-outputs flag
flutter gen-l10n
tool/format.sh                     # formats hand-written code only; never format generated files
flutter analyze --fatal-infos
flutter test
TZ=America/Santiago flutter test test/core test/features   # one entry of the CI time-zone matrix
flutter build apk --debug --flavor dev                     # "Planyar Dev", separate app ID and database
flutter build apk --release --flavor prod                  # needs android/key.properties (docs/RELEASE.md)
tool/check_release_apk.sh build/app/outputs/flutter-apk/app-prod-release.apk
```

Schema changes: bump `schemaVersion`, run `dart run drift_dev make-migrations`, then `dart run drift_dev schema generate drift_schemas/app_database/ test/core/database/migrations/generated/`, write the migration step, and commit the snapshot and tests.

## Gotchas found in Phase 0

- **Imports:** use `package:material_ui/material_ui.dart`, never `package:flutter/material.dart`.
- **Localizations:** use `[AppLocalizations.delegate, ...GlobalMaterialLocalizations.delegates]` (the `material_ui` class). The generated `AppLocalizations.localizationsDelegates` list holds the SDK's Material localizations, which `material_ui` widgets can't see.
- **Time zones:** get local-time math from `TimeZoneService.dayMath` (tz database for the device's IANA zone). Never call `DateTime.now()`, `.toLocal()` or `DateTime(y, m, d)` in app code.
- **Bloc tests with a fixed clock:** a Bloc handles events in the zone it was created in, so wrap **creation** in `withClock`, not the `add` call.
- **Widget tests:** the default test surface (800 × 600) is wider than the 600 dp rail breakpoint; set a phone size to test the bottom bar.
- **SQLite CHECKs:** a `CHECK` that evaluates to NULL passes. Guard nullable columns with `IS NOT NULL` inside the check.

## Working style

- Work phase by phase (plan §13) and cite requirement IDs. Write tests first for the domain engines (DayMath, occurrence planner, task recurrence, reports, import validation, notification planner).
- After each task, run codegen, `flutter analyze` and `flutter test`; report anything that couldn't be run.
- The owner has approved Claude committing and pushing to GitHub. Make small, descriptive commits.
- Keep explanations short and plain; the owner communicates in brief English.
