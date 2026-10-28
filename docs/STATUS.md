# Planyar — status and next steps

_Last updated: 2026-10-28, end of the Phase 2 session._

## Where things stand

- **Phase 0 (foundation): done.**
- **Phase 1 (entries, labels, Today): done**, merged into `main`. Left for you: the 60 fps check and a reminder test on your phone (see "Your to-do").
- **Phase 2 (backup, export, import): done**, merged into `main` (CI green on all 10 jobs, 2026-10-28). From here on you can use the app for real: your data can be backed up and restored.
- **Next: Phase 3 — routines and the month calendar** (plan §13).

## Phase 2 — what's in the app

- **Settings → Backup & restore (S22):**
  - "Last full export: 12 days ago".
  - **Export all data** opens the share sheet (Drive, email, Files, …).
  - **Save to device** opens the system "Save as" dialog.
  - **Import a backup…** opens the file picker.
  - The list of **safety backups**, each with Restore / Share.
  - The last 5 imports.
- **Backup file:** `planyar-backup-2026-10-28-1730.zip` holds `manifest.json` and `data.json` (plan §10.4). It's a plain ZIP, so you can open it on a computer. It isn't encrypted; the screen says so.
- **Import preview (S23):**
  - File info (made when, on which device and app version).
  - **Merge** or **Replace**, with counts per type: new / updated / unchanged / deleted / left out.
  - Warnings: "changed on this phone after the backup", "same name as a label here".
  - Records that can't be imported are listed with the reason. The import runs without them only after you tick "Import without them".
  - Replace asks once more.
- **Import result (S24):** what was written, and which safety backup holds your earlier data.
- **Safety backups (BAK-04):** made by the app before every import, before "Erase all data" and before every database upgrade. The last 5 are kept. They are deleted if you uninstall the app, so a backup on another device is still needed.
- **Recovery screen (S28):** if the database ever can't be opened, you get this screen instead of a crash. It offers Try again, Restore the latest safety backup, Import a backup, or Export the database file. Nothing is ever deleted.
- **About & privacy (S26):** version, privacy statement, licenses, and **Erase all data** (type ERASE; it offers an export first and keeps a safety backup).
- **New phone:** the welcome screen has **Restore from a backup**.
- **Android cloud backup** includes your data but not the safety copies.

## Verification (2026-10-28)

| Check | Result |
|---|---|
| `tool/check.sh` (format, `analyze --fatal-infos`, all tests) | ✅ 419 passed incl. goldens (1 skipped: TZ cross-check runs only with `TZ` set); America/Santiago run ✅ |
| Journeys J15–J17 + erase + new-phone restore (Phase 2 DoD) | ✅ App-level widget tests (real DI and database, fake share sheet/picker) |
| Round trip: export → Replace into an empty database → export | ✅ Byte-identical `data.json` (data made by the app's own code) |
| Malformed files leave the database unchanged | ✅ 30 cases (DoD ≥ 20), plus 1,500 randomly broken files that never fail at the database |
| 10,000-entry backup imports in < 5 s | ✅ 0.35 s on the Mac (preview + Replace); 20,000 in 0.66 s. Your phone will be slower, still far inside 5 s |
| Release build on the Pixel_9 emulator | ✅ Export → share sheet; Save to device → Downloads; import preview; Erase all data; Restore from a backup on the welcome screen (5,018 records back) |
| Independent review of the import engine | ✅ 1 high + 9 smaller real findings, all fixed with tests (see `docs/decisions.md`) |
| 60 fps scrolling (Phase 1) | ⏳ **Needs your phone** (the emulator renders in software) |
| iOS build | ⚠️ Still not verified (needs Xcode's iOS platform download) |

## Your to-do

1. **Back up `~/planyar-signing/`** (password manager + USB) if you haven't yet. See `~/planyar-signing/README.txt`.
2. **Try it on your phone** with the dev build, so your real data stays separate:
   ```bash
   flutter build apk --release --flavor dev
   adb install -r build/app/outputs/flutter-apk/app-dev-release.apk
   ```
   In "Planyar Dev":
   - Settings → Developer tools → **Add ~5,000 sample entries**.
   - **Frame timing → Start recording**, scroll and swipe days for ~30 s, then **Stop** and tell me the numbers.
   - Settings → Backup & restore → **Export all data** → save it to Drive or Files.
   - **Import** it back, and tell me how long the import took.
   - Also run the **notification test** from Developer tools.
3. **Start using the real app** (prod build, `docs/RELEASE.md`) when you like. Export a backup now and then, and always before changing phones. The automatic monthly reminder comes in Phase 6.
4. Delete `/Users/muhammad/Desktop/projects/my-project` (duplicate scaffold) when convenient.

## Next: Phase 3 — routines and month calendar (plan §13)

- RTN-01…RTN-07: routines, the occurrence generator and reconciler, one-day exceptions, "Log as actual" (ENT-09), time-zone change handling (§6.5).
- Month calendar (VIEW-06), basic tablet two-pane layout (VIEW-08), and onboarding step 3 (Sleep routine).
- After an import, regenerate routine occurrences (§10.6 stage 10; imported routines already have `generated_through` cleared).
- Needs `table_calendar` (optional in plan §8.13; a custom grid is the fallback) and the `MaterialUiCompatibilityBridge` wiring noted in `docs/decisions.md`.
- Definition of done: J6–J9 and J19 pass; the generator is idempotent across DST and zone-change fixtures; no actual entry is ever changed by the generator.

## Earlier phases

- **Phase 1 (2026-10-27):** Today with swipe and week strip, timeline/list, quick add, labels and categories, To finish, onboarding, appearance settings. 0.15 ms day query with 20,000 entries.
- **Phase 0 (2026-10-25/27):**
  - Warm Focus palette.
  - Clean feature-based architecture enforced by a test.
  - dev/prod flavors; release keystore in `~/planyar-signing/`.
  - Drift schema v1, `DayMath` tested in 7 zones.
  - CI (format, analyze, tests, TZ matrix, Android builds, release APK check, macOS goldens).
  - Notification spike passed on the emulator.
