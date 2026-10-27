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

## 2026-10-25 — Material spike (`material_ui` compatibility)

Run in a scratch app with every planned package; widget tests pumped a `material_ui` app with each package's widgets in three wrappings: none / `MaterialUiCompatibilityBridge` / bridge + an SDK `Material(type: transparency)`. **Verified by running tests** unless noted.

| Package (version) | Imports SDK `flutter/material.dart` | Result |
|---|---|---|
| fl_chart 1.3.0 | yes | Bar and donut charts work with **no** wrapping. |
| table_calendar 3.3.0 | yes | Grid works with no wrapping. Its **header** needs bridge **+ SDK `Material`** ancestor ("No Material widget found" otherwise). Plan: hide its header and draw our own. |
| printing 5.15.1 (`PdfPreview`) / pdf 3.13.1 | yes / no | `PdfPreview` throws "No MaterialLocalizations found" without the bridge; works with it. |
| alchemist 0.14.1 | yes | Its `AlchemistConfig.theme` takes the SDK `ThemeData`, so it only works if every scenario re-provides the `material_ui` theme, localizations and `Material` by hand. **Decision: use the in-house `matchesGoldenFile` helper (`test/helpers/golden.dart`) instead — no extra package.** Spike goldens passed in light/dark × 1.0/2.0. |
| flutter_slidable 4.0.3 | yes | Works with no wrapping. |
| patrol 4.10.0 | yes (1 file) | Resolves; integration tests not run (Phase 6). |
| share_plus 13.3.1, file_picker 13.2.0, archive 4.5.2, csv 8.0.0, crypto 3.0.7, local_auth 3.0.2, app_settings 9.0.1, workmanager 0.10.10, cryptography 2.9.0 | no | Resolve together with `material_ui`; no Material dependency. |

- **Wiring rule:** `MaterialUiCompatibilityBridge` is itself marked deprecated (temporary migration aid), and `--fatal-infos` would flag it. So it's **not** added yet. When the first SDK-Material package lands (table_calendar in Phase 3, fl_chart in Phase 4, printing in Phase 7), wrap the app once in `MaterialApp.router(builder: …)` with a `// ignore: deprecated_member_use` and a comment naming the packages. Remove it when they migrate.
- **Not verified:** native Android compile of printing / share_plus / file_picker / local_auth / workmanager (the spike's APK build was cut off by a network drop). Check each when it's added.

## 2026-10-27 — Notification spike and build verification

- **Notification spike passed on the Pixel_9 emulator (Android 16, API 36.1)** with the dev build: the Android 13+ prompt appears only when the user taps "Allow notifications" (never at launch, plan §8.6.5); `canScheduleExactNotifications()` is true with no prompt because of `USE_EXACT_ALARM` (D-40); `zonedSchedule` with `exactAllowWhileIdle` registered an `RTC_WAKEUP` alarm with `window=0` (`exactAllowReason=policy_permission`); the reminder fired on time with the app in the background, on the high-importance Routines channel. **Still to do on the owner's real phone** (OEM battery behaviour, plan §11.7).
- Follow-ups for Phase 6: add a monochrome notification icon (the default launcher icon is used now); the plugin also adds `VIBRATE` and a `DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION` (both harmless, no network).
- **Release APK verified:** 59 MB universal APK, signed with the release key, permissions = POST_NOTIFICATIONS, RECEIVE_BOOT_COMPLETED, USE_EXACT_ALARM, SCHEDULE_EXACT_ALARM (≤ API 32), VIBRATE; **no INTERNET**; 16 KB aligned. (`flutter build apk --split-per-abi` would give a ~20 MB arm64 APK if size ever matters.)
- **iOS build not verified:** Xcode 26 needs the iOS platform component downloaded first (several GB); deferred until a fast connection is available. iOS isn't released (D-02).
- Some plugins' build scripts still pull an old Android Gradle plugin (7.3.0) and Kotlin 1.7.10 jars at configuration time; harmless, cached after the first build.

## 2026-10-27 — Phase 1 (entries, labels, Today)

**Behaviour choices** (interpretations of the plan, all covered by tests)
- **Quick-add defaults (ENT-10):** if today's latest actual entry ended within the last 12 h, start there and end at now rounded down to 5 min. Otherwise start now (rounded) with **no end yet** — "starting now". On another day: same time of day, 1 h; actual for a past day, planned for a future day.
- **Duplicate (ENT-12):** copies label, note, category and duration onto the viewed day at the same wall-clock time; the kind follows the new start.
- **Overlap chip:** counts overlap *groups* (A–B–C chained = 1), not pairs. Overlaps are computed per day on clipped times, so an overnight entry only warns on the day it actually overlaps.
- **Gap tap (ENT-11):** a gap up to 2 h is used whole; a longer one becomes a 1-hour slot at the tapped quarter hour. In split lanes the tapped lane decides the kind. The gap area is hidden from screen readers (it duplicates the + button).
- **Open entries:** drawn to "now" today, otherwise with a 1 h tail; they take part in column layout (so they never draw on top of other blocks) but never in warnings or totals.
- **Day pager:** page index = days since 1970-01-01, so swipes and date jumps need no index mapping.
- **Moving the start past the end** keeps the duration; an end time earlier than the start means the next morning.
- **Labels:** auto colors in a well-separated order (teal, indigo, amber, rose, …); 47 curated icons with stable keys. Starter labels map to Rest / Work / Learning / Health / Personal categories.
- **Settings keys:** `themeMode`, `firstDayOfWeek`, `timelineMode`, `laneMode` (portable) and `onboardingCompleted` (device). Appearance & time (SET-01/02) shipped early because the settings store existed.

**Architecture**
- One `EntryFormBloc` serves quick add and the full editor (the plan listed two), so "Note, category" keeps the draft. `EntryActionsBloc` runs End/Delete/Undo for any page; `ToFinishBloc` only watches.
- Repositories throw small domain exceptions (`NameTakenException`, `LabelInUseException`); use cases turn them into `Failure.validation(reason: …)` for the UI to word.
- Drift DAOs live in each feature's `data/datasource/` and are built in that feature's injection file, so `core/` never imports features.

**Testing**
- Widget tests run the real app (`setupDependencies` with an in-memory database, fake notifications, Asia/Baghdad, a hand-driven ticker). Drift needs `DatabaseConnection(…, closeStreamsSynchronously: true)` there, or its stream-close timer fails the test.
- The test binding doesn't pass `alwaysUse24HourFormatTestValue` on to `MediaQuery` (Flutter 3.47), so widget tests see 12-hour times; the app follows `MediaQuery` (D-29).
- Goldens (`test/helpers/golden.dart`) run on macOS in CI, where they were generated; the Linux jobs exclude the `golden` tag.

**Deferred to later phases** (not in Phase 1 scope or optional)
- Task link in the entry editor (Phase 5); "You have an open Study entry — end it now?" hint (§6.9); swipe actions in List mode (§5.3, `flutter_slidable` is optional); haptics on save (§12.5).
