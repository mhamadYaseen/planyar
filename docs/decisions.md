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

## 2026-10-25 — Phase 0 foundation

**Architecture** — clean architecture, feature-based (owner reconfirmed). `lib/src/{app,config,core,features}`; each feature has `data/`, `domain/`, `presentation/` and `<feature>_injection.dart`. `test/architecture/layer_boundaries_test.dart` fails if domain code or pure core engines import Flutter, Drift or a plugin, or if domain imports data/presentation. `features/dev_tools` is the first complete feature and the template for Phase 1.

**Time**
- `Instant`, `LocalDate`, `WallTime` are small immutable classes (not extension types, so test failures print readable values).
- `DayMath` takes injectable `TimeZoneRules`. Production uses the **tz database for the device's IANA zone** (`TimeZoneService`, fed by `flutter_timezone`). That's the same data the notification scheduler uses, and it can follow a zone change without restarting the process. Falls back to the system clock zone if the ID is unknown.
- Wall times in a DST gap move to the first valid instant (02:30 → 03:00); repeated wall times resolve to the first occurrence. A day whose midnight doesn't exist starts at the transition (Santiago 2026-09-06 starts 01:00).
- Tests use reference instants computed independently with Python `zoneinfo`. They pass in-process for 7 zones and under `TZ=` for the same 7 (CI matrix). This meets the Phase 0 bar of "DayMath passes in ≥ 5 zones".

**Database (schema v1)**
- All tables from plan §7.3, with SQL `CHECK` constraints mirroring the rules (minute alignment, end > start, ≤ 7 days, routine fields only on routine occurrences, exception offsets −720…2880, `completed_at` iff completed, reminder fields per type). A SQLite `CHECK` that evaluates to NULL passes, so nullable columns are guarded with `IS NOT NULL`.
- Row classes are named `*Row` (`EntryRow`, …) so they never clash with domain entities. Enum-like columns stay snake_case TEXT; repositories map them to domain enums, so `core/` never depends on `features/`. `Instant`/`LocalDate` columns use type converters.
- `onUpgrade` throws until the first real migration exists; opening a database from a newer app version fails (tested) instead of silently downgrading.
- Startup opens the database eagerly; if that fails, a minimal "couldn't open your data" screen shows (the full Recovery screen S28 comes in Phase 2).

**UI / Material**
- All UI imports `package:material_ui/material_ui.dart`. Localizations: `[AppLocalizations.delegate, ...GlobalMaterialLocalizations.delegates]` from `material_ui`. The generated `AppLocalizations.localizationsDelegates` holds the SDK's Material localizations, which `material_ui` widgets can't see.
- Gold fills large controls (filled buttons, FAB, selected chips/dates); gold ink colours small marks (text buttons, checkboxes, radios, progress, focus, today marker). Checked by `test/app/theme/app_theme_test.dart`, including all 16 label hues in both themes.

**Flavors and signing**
- `dev`: `com.muhammadyaseen.planyar.dev`, "Planyar Dev", DEV banner, Developer tools in Settings. `prod`: `com.muhammadyaseen.planyar`, "Planyar". A build without a flavor is treated as dev (the safe side).
- iOS: `Debug/Release/Profile-dev|prod` build configurations with per-flavor bundle IDs and display names, shared `dev`/`prod` schemes; the default `Runner` scheme was removed.
- Release keystore created at `~/planyar-signing/` (PKCS12, RSA 4096, alias `planyar`, valid until 2054), linked by git-ignored `android/key.properties`. **Release builds fail without it — no debug-key fallback**, because a debug-signed APK on the phone would block all later updates. See `docs/RELEASE.md`.

**Tooling**
- Lints: `flutter_lints` plus strict casts/raw types and the stricter rules from plan §8.12 (not `very_good_analysis`); `flutter analyze --fatal-infos` in CI. Formatting at 120 columns via `tool/format.sh`, which skips generated files so "regenerate and diff" stays meaningful.
- This `build_runner` (2.16) has no `--delete-conflicting-outputs` flag.
- FlutterGen is deferred until the app has assets (icons/splash, Phase 7).
- Resolved versions: material_ui 1.8.0, cupertino_ui 1.1.4, flutter_bloc 9.1.1, get_it 9.3.0, go_router 18.1.1, freezed 4.0.1 / freezed_annotation 3.1.0, json_serializable 6.15.2, drift 2.35.3 / drift_dev 2.35.2 / drift_flutter 0.3.1 (sqlite3 3.5.2), uuid 4.6.0, clock 1.1.3, timezone 0.11.2, flutter_timezone 5.1.1, flutter_local_notifications 22.3.3, intl 0.20.3, build_runner 2.16.1, bloc_test 10.0.0, mocktail 1.0.5. `drift_flutter` pulls in the empty `sqlite3_flutter_libs 0.6.0+eol` / `sqlcipher_flutter_libs 0.7.0+eol` placeholder packages; they contain no code.
