# Planyar — status and next steps

_Last updated: 2026-10-27, end of the Phase 1 session._

## Where things stand

- **Phase 0 (foundation): done** — see "Phase 0" below.
- **Phase 1 (entries, labels, Today): done in code** on branch `phase-1` (merged into `main` once CI is green). Left for you: the 60 fps check and a reminder test on your real phone (see "Your to-do").
- **Next: Phase 2 — full backup, export and import** (plan §13).

## Phase 1 — what's in the app

- **Today (S1):** swipe between days, ‹ date › with a date picker, Today button, week strip starting on your first day of week (Friday by default). Header: tracked / planned time, "⚠ 1 overlap" (scrolls to it) and "◷ 2 to finish" chips.
- **Timeline** with Plan | Actual lanes (or one combined lane), side-by-side overlap columns with ⚠, overnight entries clipped with "from …" / "continues until …" markers, open entries running to now, DST-aware hour labels ("01:00 (2nd)"), now-line, tap an empty gap to add (ENT-11). **List mode** as the fully accessible alternative; the choice is remembered.
- **Quick add (S2)** — 3 taps when defaults are right (+ → label → Save); smart defaults, Actual/Planned auto-switch, ±15, 30m/1h/2h, Now, "No end yet", live overlap warning, "Saved · Undo". **Full editor (S3)** with note, category override, duplicate, delete (with Undo).
- **Label picker (S4)** with recent chips, search, "Create '…'" and "Restore archived '…'". **Labels & categories (S5)**, **label editor (S6)** with live preview, 16 colors, 47 icons, archive; delete only when unused (with the reason). **Category editor (S7)** with delete-and-move.
- **To finish (S11):** End now, +30m/+1h/+2h, Set end…, delete with Undo.
- **Onboarding** steps 1–2 (welcome, starter labels and categories). **Appearance & time:** theme System/Light/Dark, first day of week.
- **Dev flavor tools:** notification test, "Add ~5,000 sample entries", frame-timing recorder.

## Verification (2026-10-27)

| Check | Result |
|---|---|
| `tool/check.sh` (format, `analyze --fatal-infos`, all tests) | ✅ 242 passed (1 skipped: TZ cross-check runs only with `TZ` set) |
| Journeys J1–J5 and J20 (Phase 1 DoD) | ✅ Widget tests on the real app: real DI, repositories, router, in-memory database |
| Timeline goldens (overnight, overlap, open entry, DST day; light/dark × 1.0/2.0) | ✅ Generated on this Mac; CI compares them on macOS. They caught and fixed overflow bugs in small blocks |
| Accessibility guidelines (tap targets, labels, contrast) on Today | ✅ Light and dark |
| Day query with 20,075 entries | ✅ ~0.15 ms (budget 20 ms) |
| Release build on the Pixel_9 emulator | ✅ Onboarding → quick add → save → Undo → To finish; 5,005 sample entries display correctly |
| 60 fps scrolling | ⏳ **Needs your phone.** The emulator renders in software (SwiftShader): even a plain 8-item list measures 65 ms/frame there, so its numbers say nothing about the app |
| iOS build | ⚠️ Still not verified (needs Xcode's iOS platform download; see Phase 0 notes) |

## Your to-do

1. **Back up `~/planyar-signing/`** (password manager + USB) if you haven't yet — see `~/planyar-signing/README.txt`.
2. **Try Phase 1 on your phone** (dev build, so your real data stays separate):
   ```bash
   flutter build apk --release --flavor dev
   adb install -r build/app/outputs/flutter-apk/app-dev-release.apk
   ```
   Then in "Planyar Dev": Settings → Developer tools → **Add ~5,000 sample entries**, then **Frame timing → Start recording**, scroll the timeline and swipe days for ~30 s, come back and **Stop**. Tell me the numbers ("over 16.7 ms" should be low, a few %). While there, also run the **notification test** from Phase 0 and tell me if it arrived on time.
3. Delete `/Users/muhammad/Desktop/projects/my-project` (duplicate scaffold) when convenient.

## Next: Phase 2 — backup, export and import (plan §13, §10.4–10.8)

- BAK-01…BAK-06: export all data to a ZIP (manifest.json + data.json, versioned DTOs), share / save via the OS; import with validation → preview → Replace or Merge → one transaction → result.
- Safety backups before every import and migration (last 5), Recovery screen (S28), erase all data (SET-06).
- Needs packages from plan §8.13 that aren't added yet: `share_plus`, `file_picker`, `path_provider`, `archive`, `crypto` (all planned; the Material spike found no problems with them).
- Definition of done: J15–J17, byte-identical round trip, ≥ 20 malformed-file cases leave the DB unchanged, 10k-entry backup imports in < 5 s.

## Phase 0 — foundation (done 2026-10-25/27)

- Open setup items handled: unused platforms removed (owner approved); first Android build works (the connection drops sometimes — Gradle now retries with longer timeouts).
- "Warm Focus" palette (owner request) with contrast-checked tokens (plan §12.2); clean, feature-based architecture enforced by `test/architecture/layer_boundaries_test.dart`.
- Flavors (dev/prod) on Android and iOS; release keystore in `~/planyar-signing/` (release builds fail without it — no debug-key fallback); `docs/RELEASE.md`.
- Drift schema v1 (all plan §7 tables, CHECK constraints), snapshot + migration test; `DayMath` and time types tested in 7 zones; CI with codegen check, format, analyze, tests, 7-zone TZ matrix, Android builds, release APK check (no INTERNET, 16 KB), and macOS goldens.
- Notification spike passed on the emulator; Material spike results in `docs/decisions.md`.
