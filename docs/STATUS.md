# Planyar — status and next steps

_Last updated: 2026-10-27, Phase 0 session._

## Done

### Setup session (2026-10-25)
- Project plan approved — [PROJECT_PLAN.md](PROJECT_PLAN.md); decisions in [decisions.md](decisions.md).
- Flutter 3.47.8 / Dart 3.13.7; IDs `com.muhammadyaseen.planyar`; GitHub `origin` = https://github.com/mhamadYaseen/planyar.

### Open items from the setup session — all handled
1. **Unused platforms removed** (owner approved): `linux/`, `macos/`, `web/`, `windows/` deleted; `.metadata` updated.
2. **First Android build:** see "Verification" below.
3. **Old `my-project` folder:** left for the owner to delete (not touched).

### Design change
- Palette switched to **"Warm Focus"** (owner request): gold `#D99A22`, pale yellow `#F3D77A`, ivory/charcoal backgrounds. Contrast-checked token table in plan §12.2; warnings moved from amber to burnt orange; D-42 updated.

### Phase 0 — foundation (plan §13)
- **Clean architecture, feature-based** (owner request): `lib/src/{app,config,core,features}`, each feature `data/ domain/ presentation/` + `<feature>_injection.dart`. `test/architecture/layer_boundaries_test.dart` enforces pure domain code and inward dependencies. `features/dev_tools` is the reference feature (use cases → Bloc with Freezed events/state → page + widgets).
- **App shell:** GoRouter `StatefulShellRoute` — Today / Calendar / Tasks / Reports tabs (bottom bar on phones, rail ≥ 600 dp), Settings from the gear. GetIt composition root in `core/di/injection.dart`. Startup opens the DB eagerly and shows a "couldn't open your data" screen on failure.
- **Theme:** hand-built light/dark `ColorScheme`s from the Warm Focus tokens, `PlanyarColors` extension (gold ink, warning, success), 16-hue label palette. Contrast tests for every pair, all label hues, both themes.
- **`material_ui`** everywhere; English ARB l10n (`lib/src/config/localization/l10n`). Material spike done — results and wiring rule in decisions.md.
- **Flavors:** Android `dev` (`…planyar.dev`, "Planyar Dev", DEV banner, Developer tools) and `prod`; iOS `dev`/`prod` schemes and build configurations.
- **Release signing:** keystore at `~/planyar-signing/` (outside the repo), linked by git-ignored `android/key.properties`. Release builds fail without it (no debug-key fallback). How-to: [RELEASE.md](RELEASE.md).
- **Database:** Drift `AppDatabase` schema v1 with every plan §7 table and CHECK constraints; v1 snapshot in `drift_schemas/`; migration test harness; constraint tests.
- **Time:** `Instant`, `LocalDate`, `WallTime`, `DayMath` (injectable zone rules, tz database in production) + `TimeZoneService`. Tests pass in 7 zones in-process and under `TZ=` for the same 7.
- **Notification spike (code):** `NotificationGateway` + `flutter_local_notifications` implementation, 4 Android channels, manifest permissions (`USE_EXACT_ALARM`, D-40), dev-only page with "Allow / Show now / Schedule in 1 minute / Cancel".
- **Lints and CI:** strict lints, `flutter analyze --fatal-infos`, 120-column `tool/format.sh`. GitHub Actions `.github/workflows/ci.yml`: generated-code check, format, analyze, tests, 7-zone TZ matrix, dev + prod builds, `tool/check_release_apk.sh` (no `INTERNET`, 16 KB alignment).

## Verification (2026-10-27)

| Check | Result |
|---|---|
| `flutter analyze --fatal-infos`, `tool/format.sh --check` | Clean |
| `flutter test` | **122 passed**, 1 skipped (the TZ cross-check runs only when `TZ` is set) |
| Time tests under `TZ=` × 7 zones | All pass |
| `flutter build apk --debug --flavor dev` | ✅ Built (first Gradle run needed retries: DNS drops on this connection; `android/gradle.properties` now has longer timeouts/retries) |
| `flutter build apk --release --flavor prod` | ✅ 59 MB, signed with the release key (certificate SHA-256 matches `~/planyar-signing`), **no `INTERNET` permission**, 16 KB aligned |
| Dev build on the Pixel_9 emulator (Android 16) | Launches; Warm Focus theme correct; DEV banner; permission prompt "Allow Planyar Dev to send you notifications?"; exact alarm granted via `USE_EXACT_ALARM`; **test reminder fired on time** (16:04:50, app in background) on the Routines channel. The dev build stays installed on that emulator. |
| iOS build | ⚠️ **Not verified.** Xcode 26 started downloading the iOS platform (several GB) and the build was stopped after ~3 h. Install it once on a fast connection (Xcode → Settings → Components → iOS), then run `flutter build ios --no-codesign --flavor dev`. |
| GitHub Actions CI | ✅ Green on `a7ea6bf`: codegen current, format, analyze, tests, 7-zone TZ matrix, dev + prod Android builds, release APK check. (The first run caught a test that only passed in this Mac's own zone — fixed.) |

## Owner to-do

1. **Back up `~/planyar-signing/`** now: password manager + an offline USB copy. Instructions are in `~/planyar-signing/README.txt`. Losing it means future updates need an uninstall (data loss).
2. **Notification spike on your phone:** install the dev APK (`adb install -r build/app/outputs/flutter-apk/app-dev-debug.apk`, or copy it to the phone), open **Settings → Developer tools**, tap **Allow notifications**, then **Schedule test in 1 minute**, lock the phone, and check it arrives on time. Tell me the result (and the phone model).
3. Delete `/Users/muhammad/Desktop/projects/my-project` (duplicate scaffold) when convenient.

## Next: Phase 1 — entries, labels and Today (plan §13)

- ENT-01…ENT-12, LBL-01…LBL-06, CAT-01…CAT-05, VIEW-01…VIEW-05, VIEW-07; To finish (S11); onboarding steps 1–2; overlap detection; overnight rendering; Undo.
- Start with the pure engines, tests first: `OverlapDetector`, `IntervalUnion`, `TimelineLayout` segments (List mode before the timeline).
- Settings repository on the `settings` table (theme mode SET-01, week start SET-02).
- Definition of done: plan §13, Phase 1.
