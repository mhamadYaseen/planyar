# Planyar — Project Plan

> **App name:** Planyar ("plan" + *yar*, friend/companion) · Dart package `planyar` · Android ID `com.muhammadyaseen.planyar`
> **Status:** Approved for implementation (decisions confirmed 2026-10-25 — see §15 and `docs/decisions.md`)
> **Platforms:** Android first — installed as a sideloaded APK on your own phone. iOS stays buildable but isn't released for now. Phones first, tablets supported · **Data:** on-device only, offline-first

## How to read this plan

- **Requirement IDs** (e.g. `ENT-03`) are stable so you can cite them in implementation prompts ("implement ENT-01…ENT-06").
- **Decisions** marked **[D-xx]** are assumptions I made. Each one is listed in §15 with my recommended default. Nothing marked D-xx should be treated as final until you confirm it.
- **MVP / Later** tags mark scope. §16 has the full prioritised list.
- **Verified** package facts were checked against pub.dev / official docs on 2026-10-25 (see §8). Re-check versions when you start each phase.
- **Alignment with your Claude skills:** the architecture follows the team Flutter baseline in your installed skills (feature-first, Bloc + Freezed, GetIt, GoRouter, flavors, l10n), minus the networking parts, so later Claude sessions don't fight the plan (D-03).

### Contents

1. Product summary · 2. Goals & principles · 3. Functional requirements · 4. User journeys & acceptance criteria · 5. Screens & navigation · 6. Time, routines, overlaps & incomplete entries · 7. Data model · 8. Architecture & packages · 9. iOS & Android · 10. Privacy, backup & import · 11. Testing · 12. Accessibility & visual design · 13. Roadmap · 14. Risks · 15. Decisions for you · 16. MVP vs later

### Glossary (use these words consistently in code and prompts)

| Term | Meaning |
|---|---|
| **Entry** | One block of time with a label. Has a **kind**: *Planned* or *Actual*. |
| **Open entry** | An entry with a start but no end yet. Shown in **To finish**. |
| **Label** | Reusable name for an activity ("Study", "Sleep"), with color and optional icon. |
| **Category** | Optional group above labels ("Learning", "Health"). Also usable on tasks. |
| **Routine** | A repeating template ("Sleep, every day 23:00 → 07:00"). Not an entry itself. |
| **Occurrence** | A routine's instance on one date. Stored as a planned entry. |
| **Occurrence date** | The local date the occurrence *starts* on per the template. Sleep from Sat 23:00 to Sun 07:00 has occurrence date Saturday. |
| **Exception** | A date-specific change to one routine occurrence: *skip* or *modify*. |
| **Task** | A long-term task in the separate Tasks area (start date, optional deadline, status). |
| **Task series** | The repeat rule shared by the instances of a repeating task. |
| **Instant** | An exact moment (stored in UTC). Entry start/end are instants. |
| **Local date** | A calendar date with no time zone ("2026-10-25"). Task dates and occurrence dates are local dates. |
| **Wall-clock time** | A time of day with no date ("23:00"). Routine times are wall-clock times. |

---

## 1. Product summary and target user

**Planyar is a calm, offline personal time journal and planner.** It lets one person record what they did (usually after the fact), plan what they intend to do, set up daily routines that fill in the plan automatically, keep a lightweight list of long-term tasks, and review weekly, monthly or custom-range reports. All data stays on the phone and can be exported to a single backup file at any time.

**Target user:** one person, on one phone (or tablet), who:

- logs time retrospectively ("I studied 14:00–16:00") rather than running timers;
- sometimes starts an entry and fills in the end later;
- has recurring daily routines (sleep, work, exercise) and wants to compare plan vs reality;
- has a handful of longer-running tasks (projects, assignments, errands) with deadlines;
- wants honest, readable reports and reliable — but not noisy — reminders;
- wants to own their data: no account, no cloud, portable backups.

**The one-sentence test for every feature:** *Does this make it faster to record time, clearer to see it, or safer to keep it?*

---

## 2. Goals, non-goals, and product principles

### 2.1 Goals

1. **Fast retrospective logging.** A typical past activity can be logged in about 3 taps plus time adjustment (FAB → label → Save), helped by smart defaults.
2. **Plan vs actual at a glance.** Any day shows what was planned and what happened, side by side.
3. **Routines that fill the plan by themselves**, with one-day exceptions that never disturb other days or actual records.
4. **Lightweight long-term tasks** kept in their own area, optionally linked to logged time.
5. **Useful reports** (week, month, custom) with a small set of readable charts, CSV export, and PDF export.
6. **Reminders that help without nagging**, honest about what the OS allows.
7. **Zero data loss.** Full backup/restore, safety backups before risky operations, tested migrations.

### 2.2 Non-goals (explicitly out of scope for v1)

- Accounts, sync, cloud storage, multi-device, sharing, collaboration.
- Live start/stop timers as a primary flow (an *open entry* covers "started, finish later"; a timer may come later).
- Project-management features: subtasks, dependencies, Gantt charts, kanban, assignees, time budgets per project.
- Complex recurrence (weekday-only routines, "2nd Tuesday", RRULE). Routines are **daily only** in v1; the schema leaves room for weekdays.
- Travel / multi-time-zone features. The app is correct across a zone change but does not show entries in their original zone.
- Integrations (Google Calendar, Apple Health, Google Fit), web/desktop builds, watch apps, home-screen widgets.
- Gamification (streaks, badges, scores) and AI features.
- Analytics or crash-reporting SDKs that send data off the device.

### 2.3 Product principles

1. **Save first, refine later.** Never block a save for anything except impossible data (end before start). Overlaps and missing end times are warnings, not errors.
2. **Actual records are sacred.** No automation (routines, imports in merge mode aside from same-ID overwrites, migrations) ever creates, edits or deletes actual entries.
3. **Plan and actual are separate but connected.** They are different kinds of entry, shown in separate lanes, and can be linked ("Log as actual").
4. **One concept per screen.** Hourly time (Today, Calendar) and long-term tasks (Tasks) are separate areas. Tasks never appear as time blocks.
5. **Calm by default.** Warm neutral surfaces with a golden accent, label colors carry meaning, burnt orange is reserved for warnings, red only for destructive actions and overdue tasks. Few notifications, all optional.
6. **Predictable time.** Store instants in UTC, show them in the phone's current zone, define days as local midnight to midnight, and test DST and zone changes deliberately.
7. **Your data is portable.** Everything the user created is in the backup file. Nothing important lives only in OS settings.

---

## 3. Functional requirements

Priority: **MVP** = needed for v1.0. **Later** = planned enhancement (see §16).

### 3.1 Activity entries (ENT)

| ID | Requirement | Priority |
|---|---|---|
| ENT-01 | Create an entry with: **label** (required), **start date+time** (required), **end date+time** (optional), **kind** Planned/Actual (required, defaulted), **note** (optional, ≤ 2,000 chars), **category override** (optional, under "More"), **linked task** (optional, under "More"). | MVP |
| ENT-02 | Default kind: **Actual** if start ≤ now, **Planned** if start > now. The user can switch kind before saving and when editing manual entries. | MVP |
| ENT-03 | Times have **minute precision** (seconds are always 0). Any past or future date is allowed (range 2000-01-01 to 5 years ahead). | MVP |
| ENT-04 | Validation: end must be **after** start. Durations over **16 h** show a non-blocking "Long entry — is the end time right?" note. Hard maximum **7 days** per entry [D-33]. | MVP |
| ENT-05 | **Open entries**: an entry may be saved without an end. It appears in **To finish** and in its day view with a "Set end" action. End can be set later by editing, "End now", or quick duration chips (+30m, +1h, +2h from start). | MVP |
| ENT-06 | Edit any field; delete with a 5-second **Undo** snackbar. | MVP |
| ENT-07 | Entries may **cross midnight** (one or more). They appear on every day they touch, clipped at the day boundary with continuation markers (§6.3). | MVP |
| ENT-08 | **Overlap warnings** (non-blocking) in the editor, day view, and calendar (§6.6). | MVP |
| ENT-09 | **Log as actual**: a past or in-progress planned entry offers a one-tap action that creates a linked actual entry with the same label and times, which the user can then adjust. The planned entry is kept for comparison. | MVP |
| ENT-10 | **Smart defaults** for quick add: start = end of the latest actual entry that ended today within the last 12 h, else now rounded down to 5 min; end = now (rounded) when start is in the past; planned entries default to the label's last-used duration or 1 h. | MVP |
| ENT-11 | **Gap fill**: tapping an empty area in the timeline opens quick add pre-filled with that gap's start and end. | MVP |
| ENT-12 | **Duplicate** an entry (e.g. "same as yesterday"), opening the editor with the copy. | MVP (small) |
| ENT-13 | Drag to create / drag edges to resize on the timeline. | Later |
| ENT-14 | Optional live timer ("Start now" with running clock). | Later |

### 3.2 Labels (LBL) and categories (CAT)

| ID | Requirement | Priority |
|---|---|---|
| LBL-01 | Create labels from Labels & Categories, **or inline** from the label picker by typing a name that doesn't exist ("Create 'Reading'"). Inline creation auto-assigns the next unused palette color and selects the new label immediately. | MVP |
| LBL-02 | Label fields: **name** (1–40 chars, unique ignoring case and surrounding spaces), **color** (one of a curated 16-color palette tuned for both themes), **icon** (optional, from a curated set of ~60 Material Symbols), **category** (optional). | MVP |
| LBL-03 | **Rename** updates the name everywhere (entries, routines, reports, exports) because everything references the label by ID. Historical entries are not modified. | MVP |
| LBL-04 | A label **in use** (by any entry, routine, or routine exception) **cannot be deleted**. The delete action is disabled with an explanation ("Used by 42 entries and 1 routine") and offers **Archive** instead. Unused labels can be deleted. | MVP |
| LBL-05 | **Archive**: hidden from pickers and quick chips; still shown on historical entries and in reports; can be restored. Creating a label with an archived label's name offers "Restore archived 'Study'?". | MVP |
| LBL-06 | Picker order: most used in the last 14 days first (up to 8 quick chips), then alphabetical; type-to-filter. | MVP |
| LBL-07 | **Merge** one label into another (moves all references, then deletes the merged label). | Later |
| CAT-01 | Categories have a **name** and optional **color**. A label belongs to **zero or one** category. Tasks may also have zero or one category from the same list [D-18]. | MVP |
| CAT-02 | An entry's **effective category** = its own category override, else its label's category, else "Uncategorized". | MVP |
| CAT-03 | Changing a label's category regroups **all** its entries (past included) in reports, except entries with an explicit override [D-06]. | MVP |
| CAT-04 | Deleting a category that is in use asks where its labels, tasks and entry overrides should go (another category or Uncategorized), then applies the move and deletes it. | MVP |
| CAT-05 | Onboarding offers optional starter categories and labels (§5.4). | MVP |

**How labels relate to categories (the simple version):** a label is *what you did* ("Study"); a category is *which part of life it belongs to* ("Learning"). You pick the category once on the label, and every entry with that label is counted under that category. Overriding the category on a single entry is possible but tucked away, because it is rarely needed.

### 3.3 Recurring routines (RTN)

| ID | Requirement | Priority |
|---|---|---|
| RTN-01 | Create a routine: **label** (required), **name** (optional, defaults to the label name), **start time**, **end time** (if end ≤ start, it ends the next day — shown explicitly as "23:00 → 07:00 next day · 8 h"), **starts on** date (default today), optional **ends on** date, optional note, reminder settings. | MVP |
| RTN-02 | Routines repeat **every day** in v1. The schema stores a recurrence rule so weekday selection can be added later without migration pain. | MVP |
| RTN-03 | Routines **automatically create planned entries** (occurrences) without duplicates and without touching actual entries (§6.7). | MVP |
| RTN-04 | **Change for this day only**: change one occurrence's times, label or note, or **skip** that day. Stored as an exception; other days and the routine are unchanged. | MVP |
| RTN-05 | **Edit the routine**: changes apply to every occurrence that **has not started yet**. Past and in-progress occurrences keep their original values, so history stays honest [D-10]. | MVP |
| RTN-06 | **Pause / resume**, **end** (set "ends on"), and **delete** (§7.6 deletion rules). | MVP |
| RTN-07 | Warn when two routines overlap (e.g. Reading 22:00–23:30 overlaps Sleep 23:00–07:00), in the routine editor and list. Never blocks saving. | MVP |
| RTN-08 | Weekday selection (e.g. Work Mon–Fri). | Later |
| RTN-09 | "Log as actual" directly from a notification action without opening the app. | Later |

### 3.4 Day and calendar views (VIEW)

| ID | Requirement | Priority |
|---|---|---|
| VIEW-01 | **Today / Day view** with two modes: **Timeline** (default) and **List**. The chosen mode is remembered. | MVP |
| VIEW-02 | Date navigation: swipe left/right, prev/next arrows, a week strip, a **Today** button, and tapping the date title to open a date picker. | MVP |
| VIEW-03 | Timeline uses **two lanes — Plan | Actual** — by default; a toggle switches to a single combined lane [D-32]. | MVP |
| VIEW-04 | Overnight entries are clipped at the day boundary with "continues" / "from yesterday" markers (§6.3). | MVP |
| VIEW-05 | Day header summary: actual tracked time, planned time, plus chips for overlaps ("⚠ 1 overlap") and open entries ("2 to finish"). | MVP |
| VIEW-06 | **Month calendar** (hourly area): per-day indicators for tracked time, planned time, overlaps and open entries; tap a day to open it. | MVP |
| VIEW-07 | Current-time line on today's timeline; opening today scrolls to "now", other days scroll to the first entry. | MVP |
| VIEW-08 | Tablet/landscape: calendar and day view side by side. | MVP (basic) |
| VIEW-09 | Week view (7-column timeline). | Later |

### 3.5 Long-term tasks (TSK)

| ID | Requirement | Priority |
|---|---|---|
| TSK-01 | Create a task: **title** (required, ≤ 120 chars), **start date** (required, default today), **deadline** (optional date, optional time), **status** (default Not started), **notes**, **priority** Low/Normal/High (default Normal) [D-17], **category**, **estimated effort**, **repeat**, **reminders**. Only title and start date are visible by default; the rest are under "More options". | MVP |
| TSK-02 | Status: **Not started → In progress → Completed** (any transition allowed). Completing records `completedAt` (editable). | MVP |
| TSK-03 | **Retrospective tasks**: start date can be any past date (e.g. last month). If status is set to Completed while creating, a "Completed on" date appears (default: the deadline if it's in the past, else today) [D-39]. | MVP |
| TSK-04 | **Overdue** = not completed and the deadline has passed (§6.10). Overdue is shown, never auto-changed. | MVP |
| TSK-05 | Task list grouped as **Overdue · Active** (started, not done) **· Upcoming** (start in future) **· Completed** (collapsed; last 30 days, "Show all"). | MVP |
| TSK-06 | **Task calendar** (separate from the hourly calendar): month grid with start (●) and deadline (◆) markers, and an agenda for the selected day. | MVP |
| TSK-07 | Edit and delete. Deleting a task keeps linked entries (they just lose the link). | MVP |
| TSK-08 | **Repeating tasks**: daily / weekly / monthly / yearly with an interval ("every 2 weeks"); mode **On schedule** (default) or **After completion** (§6.10) [D-13]. | MVP |
| TSK-09 | **Reminders** (up to 3 per task): on the start date at a time; N days before the deadline at a time; on the deadline day at a time; at a custom date+time. | MVP |
| TSK-10 | **Link time**: entries can link to a task (from the entry editor, or "Log time" on the task, which opens quick add pre-linked). Task detail lists linked entries and their total. | MVP |
| TSK-11 | **Effort**: optional estimate; actual effort = total of linked actual entries **plus** an optional manual adjustment for unlogged work [D-16]. | MVP |
| TSK-12 | Filter the task list by status and category. | MVP |
| TSK-13 | Task search; subtasks are intentionally never planned. | Later (search only) |

### 3.6 Notifications (NTF)

| ID | Requirement | Priority |
|---|---|---|
| NTF-01 | **Routine reminders**, per routine: Off (default) / at start / 5, 10, 15, 30 or 60 min before. | MVP |
| NTF-02 | **Task reminders** per TSK-09. When a deadline is first set, one reminder "1 day before at 09:00" is pre-added and visible, so the user can remove it [D-15]. | MVP |
| NTF-03 | **Evening check-in** (default on if notifications are allowed, 21:00, configurable): fires only if there are open entries **or** nothing was logged today. Text reflects the situation ("2 entries to finish" / "Nothing logged today — add a quick entry?"). [D-20] | MVP |
| NTF-04 | **Weekly review** (default off): on the first day of the week at 09:00, opens last week's report. | MVP |
| NTF-05 | **Backup reminder** (default on): if no full export in 30 days, a monthly reminder. | MVP |
| NTF-06 | **Quiet hours** (default on, 22:30–07:00) [D-19]: non-urgent notifications falling inside are dropped (check-in) or moved to the end of quiet hours (task reminders, backup reminder). Routine and task reminders can individually "Allow during quiet hours". | MVP |
| NTF-07 | A master switch, per-type switches, and per-item settings. | MVP |
| NTF-08 | Permission flow: never asked at first launch. Asked when the user first turns a reminder on (or in onboarding's reminders step), after a short in-app explanation. Denied/blocked states show a clear fix ("Open settings"). | MVP |
| NTF-09 | Tapping a notification opens the right screen, including from a cold start. | MVP |
| NTF-10 | Notification settings shows "Reminders are scheduled through **8 Nov**", and on iOS a note to open the app at least weekly (§8.6). | MVP |
| NTF-11 | Long-open nudge ("Still studying? Started 9 h ago"). | Later |
| NTF-12 | Actions on notifications ("Log as planned", "Snooze 10 min") handled without opening the app. | Later |

### 3.7 Reports (RPT)

| ID | Requirement | Priority |
|---|---|---|
| RPT-01 | Period picker: This week, Last week, This month, Last month, Custom range; prev/next arrows step by the same period length. | MVP |
| RPT-02 | Summary cards: **Actual tracked** (time covered, overlaps not double-counted), **Planned**, **Untracked** (elapsed time in the range with no actual entry), **Plan vs actual difference**. | MVP |
| RPT-03 | **Time by category** (donut, ≤ 6 slices + Other, with a value list). | MVP |
| RPT-04 | **Time by label** (horizontal bars, top 10 + Other). | MVP |
| RPT-05 | **Planned vs actual by label** (paired bars). Shown only when the range has planned data; otherwise a hint ("Add a routine or planned entries to compare"). | MVP |
| RPT-06 | **Daily trend** (stacked columns by category). Daily buckets ≤ 31 days, weekly ≤ 6 months, monthly beyond. | MVP |
| RPT-07 | **Include tasks** toggle (default off) adds: tasks completed in the range, tasks overdue at range end, time logged per task, estimate vs actual for completed tasks. | MVP |
| RPT-08 | Data notes: "2 open entries not counted" (tap → To finish); "40 min of overlapping time is counted under more than one label". | MVP |
| RPT-09 | **CSV export** (§8.9) of selectable tables for the current period. | MVP |
| RPT-10 | **PDF export** with summary, charts and tables for the current period. | MVP (late phase) |
| RPT-11 | Every chart has a "View as table" alternative and a screen-reader summary. | MVP |
| RPT-12 | Filter report by category; per-routine adherence. | Later |

### 3.8 Full backup, export and import (BAK)

| ID | Requirement | Priority |
|---|---|---|
| BAK-01 | **Export all data** at any time to one backup file, then share/save via the OS share sheet ("Save to Files", Drive, email, etc.). | MVP |
| BAK-02 | Backup includes: entries, labels, categories, routines, routine exceptions, tasks, task series, task reminders, and portable settings (§10.4). | MVP |
| BAK-03 | **Import**: pick file → validate → preview counts → choose **Replace** or **Merge** → confirm → apply in one transaction → result summary. | MVP |
| BAK-04 | **Safety backup** created automatically before every import and before every database migration; last 5 kept on device and restorable from Settings. | MVP |
| BAK-05 | Show "Last full export: 12 days ago"; backup reminder per NTF-05. | MVP |
| BAK-06 | Older backup versions are upgraded on import; newer versions are rejected with "Update the app to import this backup". | MVP |
| BAK-07 | Password-encrypted backups; automatic export to a chosen folder. | Later |

### 3.9 Settings and onboarding (SET)

| ID | Requirement | Priority |
|---|---|---|
| SET-01 | Theme: System / Light / Dark. | MVP |
| SET-02 | First day of week (default **Friday**, changeable to any day) [D-09]. | MVP |
| SET-03 | 12/24-hour format follows the device setting. | MVP |
| SET-04 | Onboarding (≤ 4 short steps, all skippable): welcome → pick starter labels → optional Sleep routine → reminders. | MVP |
| SET-05 | About: version, licenses, privacy statement ("Your data never leaves this device unless you export it"). | MVP |
| SET-06 | **Erase all data**: offers an export first, requires typing "ERASE", creates a safety backup. | MVP |
| SET-07 | Optional app lock (Face ID / fingerprint). | Later |

---

## 4. Key user journeys and acceptance criteria

Each journey lists acceptance criteria (AC) in testable form. "Today" is assumed to be Sunday 25 Oct 2026; times are local.

### J1 — Log a past activity quickly (ENT-01, ENT-10)
*"I studied from when I got home until now."*
- **AC1** From Today, tapping **+** opens quick add with the label chips visible and no keyboard shown.
- **AC2** If the last actual entry today ended at 14:05, start defaults to 14:05 and end to now rounded down to 5 minutes.
- **AC3** Tapping a label chip and **Save** creates an Actual entry; total interaction is 3 taps when defaults are right.
- **AC4** The new entry appears in the Actual lane immediately, and the sheet closes with a brief "Saved" confirmation including **Undo**.

### J2 — Start now, finish later (ENT-05)
- **AC1** In quick add, choosing **No end yet** saves an open entry.
- **AC2** Today's header shows "1 to finish"; the entry shows a dashed tail and a **Set end** button.
- **AC3** In **To finish**, the entry offers **End now**, **+30m / +1h / +2h**, and **Set end…**; using one closes it and removes it from the list.
- **AC4** Reports exclude the open entry and say so (RPT-08).

### J3 — Create a label while adding an entry (LBL-01)
- **AC1** In the label picker, typing "Reading" with no match shows **Create "Reading"** as the first row.
- **AC2** Tapping it creates the label with an auto-assigned unused color, selects it, and returns to the entry with focus unchanged.
- **AC3** Typing "  study " when "Study" exists shows the existing label, not a create option.

### J4 — Log an overnight sleep (ENT-07, §6.3)
- **AC1** An actual entry Fri 23:10 → Sat 06:50 shows on Friday as 23:10 → midnight with a "continues ↓" marker and on Saturday as midnight → 06:50 with "from Fri 23:10".
- **AC2** Both segments open the same entry; editing one edits the entry.
- **AC3** In a report for Saturday only, the entry contributes 6 h 50 min; for Fri–Sat it contributes 7 h 40 min.
- **AC4** An entry ending exactly at 00:00 does not appear on the next day.

### J5 — Save an overlapping entry (ENT-08, §6.6)
- **AC1** Saving an actual entry 15:00–16:00 when "Work 14:00–17:00" (actual) exists shows a warning-colored (burnt orange) inline note "Overlaps with Work 14:00–17:00" before saving, and **Save** still works with one tap.
- **AC2** After saving, both blocks display side by side in the Actual lane with a ⚠ icon, and the day header shows "⚠ 1 overlap".
- **AC3** A planned entry overlapping an actual entry does **not** produce a warning.
- **AC4** Entries that only touch (one ends 15:00, the next starts 15:00) do not overlap.

### J6 — Create a sleep routine (RTN-01, RTN-03)
- **AC1** Creating "Sleep 23:00 → 07:00" starting today shows the summary "Every day · 23:00 → 07:00 next day · 8 h".
- **AC2** Planned Sleep entries appear for today and at least the next 14 days, each marked with a repeat icon.
- **AC3** Reopening the app, changing dates, or running the generator repeatedly never creates a second Sleep entry for the same date.
- **AC4** No actual entry is created or modified.

### J7 — Change the routine for today only (RTN-04)
- **AC1** Tapping today's Sleep occurrence → **Edit** asks "Change this day only / Change the routine". Choosing **This day only** and setting 00:30 → 08:00 updates only today's planned entry; it shows a "changed for this day" icon.
- **AC2** Tomorrow's occurrence is still 23:00 → 07:00. The routine template is unchanged.
- **AC3** Editing the routine's times afterwards does not undo today's exception.
- **AC4** **Reset to routine** on the occurrence removes the exception and restores the routine times.
- **AC5** **Skip this day** removes the occurrence; it does not come back on refresh.

### J8 — Log a planned entry as actual (ENT-09)
- **AC1** A past planned occurrence without a linked actual shows a **Log as actual** button.
- **AC2** Tapping it creates an Actual entry with the same label and times, linked to the plan; the planned block shows a ✓ "logged" state.
- **AC3** The new actual entry can be edited (e.g. woke at 07:40) without changing the planned entry.

### J9 — Edit a routine going forward (RTN-05)
- **AC1** At 15:00 today, changing Sleep to 22:30 → 06:30 updates tonight's and future unstarted occurrences.
- **AC2** Last night's occurrence (already started/past) keeps 23:00 → 07:00.
- **AC3** Occurrences with exceptions keep their exception values.

### J10 — Add a task from last month (TSK-03)
- **AC1** A task with start date 28 Sep, deadline 10 Oct, status Completed, completed on 9 Oct can be saved.
- **AC2** It appears under Completed and in the task calendar on those dates; it is never shown as overdue.
- **AC3** No reminders are scheduled for dates in the past.

### J11 — Complete a repeating task (TSK-08)
- **AC1** "Pay rent" monthly on the 1st, mode On schedule: completing the 1 Oct instance on 3 Oct creates the next instance with start 1 Nov.
- **AC2** Completing it on 20 Nov (very late) creates the next instance for 1 Dec, not 1 Nov again (missed periods are skipped).
- **AC3** Undoing completion within the session removes the untouched next instance.
- **AC4** Only one open instance of a series exists at any time.

### J12 — Link time to a task (TSK-10, TSK-11)
- **AC1** From task detail, **Log time** opens quick add with the task pre-linked.
- **AC2** Task detail shows "Logged 6 h 30 m of 10 h estimate" and the list of linked entries.
- **AC3** The task never appears in the hourly timeline; the linked entry shows a small task chip.

### J13 — Deadline reminder (NTF-02)
- **AC1** Setting a deadline adds a visible "1 day before at 09:00" reminder that can be removed.
- **AC2** The notification fires at the scheduled time (within OS tolerance, §9), and tapping it opens the task.
- **AC3** Completing the task cancels its pending reminders.

### J14 — Weekly report and CSV (RPT-01…RPT-09)
- **AC1** Reports opens on "This week" with summary cards and charts for the current week.
- **AC2** Totals equal the sum of entry durations clipped to the range (verified by tests with fixture data).
- **AC3** **Export → CSV** with "Summary by label" and "Entries" selected produces a file that opens correctly in Excel and Google Sheets (non-ASCII characters intact).

### J15 — Full export and restore on a new install (BAK-01, BAK-03)
- **AC1** Settings → Backup → **Export all data** produces one file and opens the share sheet.
- **AC2** On a fresh install, **Import** → that file → **Replace** restores every record; record counts match the manifest.
- **AC3** Routine occurrences for future dates are regenerated and reminders are rescheduled after import.

### J16 — Merge with conflicts (BAK-03, §10.6)
- **AC1** Preview shows counts: new, will overwrite, identical (skipped), invalid (skipped) — per entity type.
- **AC2** Records with the same ID are overwritten by the imported version.
- **AC3** An imported label named "study" with a different ID than the existing "Study" is matched by name (per D-25) and shown in the preview as "matched by name".
- **AC4** A safety backup exists before anything is written.

### J17 — Malformed import (§10.6)
- **AC1** A truncated, non-zip, or wrong-format file shows "This file isn't a Planyar backup or is damaged" and changes nothing.
- **AC2** A backup with 3 invalid entries out of 5,000 shows them in the preview with reasons; import proceeds without them only if the user confirms.
- **AC3** A backup from a newer app version is rejected with an "update the app" message.

### J18 — Notification permission denied (NTF-08)
- **AC1** Turning on a routine reminder shows an explanation, then the system prompt.
- **AC2** If denied, the toggle stays off, and Notification settings shows "Notifications are blocked — Open settings".
- **AC3** On Android, if exact alarms aren't allowed, reminders are still scheduled (may be a few minutes late) and settings explains how to allow precise timing.

### J19 — Device time zone changes (§6.5)
- **AC1** After the zone changes, the next app open shows a one-time banner "Time zone changed to X. Times are now shown in local time."
- **AC2** Actual entries keep their exact instants (no data changes).
- **AC3** Future unstarted routine occurrences are re-anchored to the new local wall-clock times; reminders are rescheduled.

### J20 — Rename and try to delete a label (LBL-03, LBL-04)
- **AC1** Renaming "Study" to "Deep work" shows the new name on all past entries, routines and reports instantly.
- **AC2** Delete is disabled for an in-use label with the reason shown; Archive is offered.
- **AC3** An archived label disappears from pickers but its entries still display it.

---

## 5. Screen inventory and navigation

### 5.1 Navigation structure

```
App shell (bottom NavigationBar on phones; NavigationRail on tablets ≥ 600 dp)
├── Today          ← default tab (Day view: timeline / list)
│   ├── Quick add sheet (+ FAB)  → expands to full Entry editor
│   ├── Entry details / editor
│   ├── Occurrence actions (this day only / routine / skip / log as actual)
│   └── To finish (open entries)
├── Calendar       ← hourly month calendar → tap day → Day view
├── Tasks          ← list ⇄ month toggle
│   ├── Task editor (create/edit)
│   └── Task detail (linked time, reminders, series history)
├── Reports        ← period picker, charts
│   └── Export sheet (CSV / PDF) → PDF preview
└── Settings (gear icon in each tab's app bar)
    ├── Labels & categories → Label editor / Category editor
    ├── Routines → Routine editor
    ├── Notifications (permission status, types, quiet hours, schedule horizon)
    ├── Backup & restore → Import preview → Import result; Safety backups
    ├── Appearance & time (theme, week start)
    └── About & privacy (licenses, erase all data)
```

**Why four tabs + Settings:** the four tabs are the four questions the user asks daily — *what's today, what about that day, what's on my plate, how did I do*. Labels and routines are set up occasionally, so they live in Settings, with shortcuts where they're needed (label picker → "Manage labels"; a routine occurrence → "Edit routine"; Today overflow → "Routines").

### 5.2 Screen inventory

| # | Screen | Purpose | Key elements | Opened from |
|---|---|---|---|---|
| S1 | **Today / Day view** | See and edit one day | Date title, week strip, summary chips, Plan \| Actual timeline or list, now-line, FAB | Tab, calendar, notifications |
| S2 | **Quick add sheet** | Fastest entry creation | Kind toggle, label chips, start/end with ± chips, duration chips, "No end yet", inline overlap note, "More" | FAB, gap tap, "Log time" on task |
| S3 | **Entry editor (full)** | All entry fields | Everything in S2 + note, category override, task link, delete, duplicate | S2 "More", tapping an entry |
| S4 | **Label picker** | Choose or create a label | Search field, recent chips, list, "Create '…'" row | S2, S3, routine editor |
| S5 | **Labels & categories** | Manage labels and categories | Grouped by category, archived section, usage counts | Settings, S4 |
| S6 | **Label editor** | Name, color, icon, category | Live preview of a planned & actual block | S5, S4 long-press |
| S7 | **Category editor** | Name, color, delete/reassign | Labels in category | S5 |
| S8 | **Routines** | List of routines | Time span, reminder status, overlap warnings, paused/ended | Settings, Today overflow |
| S9 | **Routine editor** | Create/edit a routine | Label, times with "next day" hint, starts/ends on, reminder, preview line | S8, occurrence actions |
| S10 | **Occurrence action sheet** | Act on one routine occurrence | Log as actual, Change this day only, Skip this day, Reset to routine, Edit routine | Tap occurrence |
| S11 | **To finish** | Close open entries | Oldest first, End now, +30m/+1h/+2h, Set end, delete | Today chip, check-in notification |
| S12 | **Calendar (hourly)** | Navigate dates | Month grid, per-day mini bars & indicators, today button | Tab |
| S13 | **Tasks list** | Task overview | Groups (Overdue/Active/Upcoming/Completed), filters, FAB | Tab |
| S14 | **Task calendar** | Dates at a glance | Month grid with ● start ◆ deadline, day agenda | Tasks toggle |
| S15 | **Task editor** | Create/edit task | Title, start, deadline (chips), More options (status, priority, category, estimate, repeat, reminders, notes) | S13 FAB, S16 |
| S16 | **Task detail** | Task status and time | Status control, dates, reminders, logged time vs estimate, linked entries, "Log time", series history | S13, S14, notification |
| S17 | **Reports** | Summaries and charts | Period picker, summary cards, 4 charts, data notes, include-tasks toggle, export | Tab, weekly notification |
| S18 | **Export sheet** | CSV/PDF options | Format, table selection, include tasks | S17 |
| S19 | **PDF preview** | Check before sharing | Pages, Share / Save | S18 |
| S20 | **Settings hub** | Entry to all settings | Grouped list | Gear icon |
| S21 | **Notification settings** | Control reminders | Permission status/fix, master switch, per-type, quiet hours, check-in time, "Scheduled through", troubleshooting | S20, permission banners |
| S22 | **Backup & restore** | Export / import | Last export date, Export all, Import, Safety backups | S20, backup reminder |
| S23 | **Import preview** | Decide how to import | File info, version, counts per type, warnings, Replace/Merge choice, confirm | S22 |
| S24 | **Import result** | Outcome | Counts applied, skipped with reasons, safety backup name | S23 |
| S25 | **Appearance & time** | Theme, week start | | S20 |
| S26 | **About & privacy** | Version, licenses, erase | | S20 |
| S27 | **Onboarding** | First run | 4 skippable steps | First launch |
| S28 | **Recovery screen** | DB can't open / migration failed | Explanation, restore safety backup, export raw DB, retry | Startup failure |

### 5.3 Fastest practical flows

**Add an activity (actual, past):** Today → **+** → tap label chip → **Save**. Start/end come from smart defaults (ENT-10); adjust with ±15 min chips or tap the time to open a compact time picker. *3 taps when defaults are right.*

**Add an activity by gap:** tap an empty gap in the timeline → sheet opens with that gap's bounds → tap label → **Save**.

**Add a label:** in any label picker, type the name → **Create "…"**. *No extra screen.*

**Add a routine:** Settings → Routines → **+** (or Today ⋮ → Routines) → pick label → set start and end → **Save**. Reminder defaults to Off with a single "Remind me 15 min before" chip.

**Add a task:** Tasks → **+** → type title → (optional) tap a deadline chip: *This Friday / Next week / Pick date* → **Save**. Start date defaults to today. Everything else is under "More options".

**Finish an open entry:** Today header chip "2 to finish" → **End now** or **+1h**. Or swipe the entry in List mode.

### 5.4 Onboarding (S27)

1. **Welcome** — one sentence on what the app does and that data stays on the device.
2. **Starter labels** — preselected chips the user can toggle: Sleep, Work, Study, Exercise, Meals, Commute, Leisure, Chores, with suggested categories (Rest, Work, Learning, Health, Personal). "Skip" creates none.
3. **Sleep routine (optional)** — "When do you usually sleep?" two time fields, prefilled 23:00 → 07:00, "Skip".
4. **Reminders** — explains the evening check-in and deadline reminders, then **Allow notifications** (triggers the OS prompt) or **Not now**.

### 5.5 Wireframes (phone)

**Today — timeline, split lanes**

```
┌────────────────────────────────────────┐
│ ‹  Sun 25 Oct  ›              Today  ⚙ │
│  M   T   W   T   F   S  [S]            │
│ ⏱ 9h 40m tracked · 12h planned          │
│ [⚠ 1 overlap]  [◷ 2 to finish]          │
├──────┬─────────────┬───────────────────┤
│      │ PLAN        │ ACTUAL            │
│ 00:00│┆ Sleep ↻   ┆│▌Sleep             │
│      │┆ from Sat  ┆│▌from Sat 23:10    │
│ 07:00│             │                   │
│ 08:00│             │▌Commute           │
│ 09:00│┆ Work      ┆│▌Work    │▌Call ⚠  │
│ 12:00│             │                   │
│ ─────────────── now 14:20 ───────────  │
│ 14:05│             │▌Study  ┄┄ no end  │
│      │             │   [Set end]       │
│ 23:00│┆ Sleep ↻ ↓ ┆│                   │
└──────┴─────────────┴───────────────────┘
                                    ( + )
 [ Today ]  [ Calendar ]  [ Tasks ]  [ Reports ]
```
Planned = dashed outline + light tint; Actual = solid tinted block with a strong left edge.

**Quick add sheet**

```
┌────────────────────────────────────────┐
│                 ─────                  │
│  ( Actual │ Planned )                  │
│  Label                                 │
│  [Study] [Work] [Exercise] [Sleep] [⌕] │
│  Start   Sun 25 Oct   14:05  [−15][+15]│
│  End     Sun 25 Oct   14:20  [ Now ]   │
│          [30m] [1h] [2h] [No end yet]  │
│  ⚠ Overlaps with Work 14:00–17:00      │
│  ▸ Note, category, task                │
│                          [   Save   ]  │
└────────────────────────────────────────┘
```

**Tasks — list**

```
┌────────────────────────────────────────┐
│ Tasks                    [≡ List|▦ Month] ⚙ │
│ [All] [In progress] [Learning ▾]        │
│ OVERDUE                                 │
│  ◔  Thesis chapter 2   ◆ 20 Oct · 5d ago│
│ ACTIVE                                  │
│  ○  Renew passport     ◆ Sat 31 Oct  ⚑  │
│  ◑  Learn Flutter tests   6h / 10h      │
│ UPCOMING                                │
│  ○  Pay rent ↻         ● 1 Nov          │
│ COMPLETED (4)                         ▸ │
└────────────────────────────────────────┘
```

### 5.6 Adaptive layout

Use Material 3 window-size classes:

| Width | Layout |
|---|---|
| Compact (< 600 dp) — phones | Bottom NavigationBar; single pane; sheets for add/edit. |
| Medium (600–839 dp) — small tablets, phone landscape | NavigationRail; single pane with wider timeline; dialogs instead of full-screen editors. |
| Expanded (≥ 840 dp) — tablets | NavigationRail; two panes: Calendar + Day view; Tasks list + Task detail; Reports charts in a 2-column grid. |

Don't build desktop/web layouts or foldable-specific handling in v1.

---

## 6. UX behavior for time, routines, overlaps and incomplete entries

### 6.1 Three kinds of time value

Mixing these up is the most common source of calendar bugs, so the code keeps them as distinct types:

| Kind | Used for | Stored as | Example |
|---|---|---|---|
| **Instant** | Entry start/end, `completedAt`, `createdAt/updatedAt`, custom reminder times | UTC epoch milliseconds (integer) | `1761400800000` |
| **Local date** | Task start/deadline, routine starts/ends on, occurrence date, exception date | ISO text `YYYY-MM-DD` | `2026-10-25` |
| **Wall-clock time** | Routine start/end, reminder times of day, quiet hours, check-in time | Minutes since local midnight (0–1439) | `1380` = 23:00 |

Entries also store the IANA zone ID and UTC offset in effect when they were saved. They're not used for display in v1, but they preserve meaning if travel support is ever added.

All "what time is it" logic goes through one injectable clock (package `clock`), so tests can fix "now" anywhere, including DST transitions.

### 6.2 The day boundary

- A **day** is the half-open interval **[local 00:00, next local 00:00)** in the phone's **current** time zone.
- An entry belongs to every day whose interval it intersects with positive duration.
- An entry ending exactly at 00:00 belongs only to the earlier day. One starting at 00:00 belongs to that day.
- Report ranges are the same: a custom range 1–7 Oct means [1 Oct 00:00, 8 Oct 00:00).
- Duration within a day = `min(end, dayEnd) − max(start, dayStart)` computed on **instants**, so DST days (23 h or 25 h) are counted correctly.

### 6.3 Overnight entries

**Timeline:**
- Day 1 shows the block from its start to the bottom edge, with a "continues ↓" chevron and the text "until 07:00 Sun".
- Day 2 shows it from the top edge, with "↑ from Sat 23:00".
- Both segments are the **same entry**; tapping either opens it; the full duration (e.g. "8 h") is shown, plus the in-day portion in the semantics label.

**List mode:** the entry is listed on both days. Its time reads "Sat 23:00 → Sun 07:00 · 8 h" with a small moon/overnight icon. On Day 2 it sorts first.

**Calendar month view:** the entry contributes its clipped portion to each day's tracked total.

**Reports:**
- Totals per day, label or category use clipped durations.
- Counts ("number of sessions") assign an entry to the day it **starts** on.
- CSV "Entries" rows include both the full and the in-range duration (§8.9).

**Multi-day entries** (rare, ≤ 7 days) follow the same rules; middle days show a full-height block with both markers.

### 6.4 Daylight saving time

Iraq/Kurdistan doesn't currently use DST, but the app must still be correct wherever it runs:

- **Spring forward** (e.g. 02:00 → 03:00): wall-clock times in the gap (02:30) don't exist. Routine times falling in the gap move forward to the first valid minute (03:00). The timeline for that day is 23 hours long.
- **Fall back** (02:00 → 01:00): wall-clock times in the overlap (01:30) happen twice. Routine times resolve to the **first** occurrence. The timeline is 25 hours long; the repeated hour is labelled "01:00 (2nd)".
- Durations always come from instants: a Sleep routine 23:00 → 07:00 is 9 h on a fall-back night and 7 h on a spring-forward night, and reports reflect that.

All of this lives in one small, heavily tested `LocalTime` / `DayMath` helper (§11.3). Nothing else in the app constructs local times from parts.

### 6.5 Device time-zone changes (safe handling)

You don't expect to change zones, but phones change zones on their own (travel, network time, manual settings), so the app handles it safely:

1. **Detect.** On every app start and resume, read the device IANA zone (`flutter_timezone`) and compare it with `lastKnownTimeZone` in settings.
2. **Never rewrite instants.** Actual and manual planned entries keep their stored UTC instants. They simply display in the new local time (a 14:00 entry recorded in UTC+3 shows as 12:00 in UTC+1).
3. **Re-anchor routines.** Routine times are wall-clock times, so future **unstarted** occurrences are regenerated in the new zone ("Sleep at 23:00" stays 23:00 local). Past and started occurrences are frozen and not changed.
4. **Reschedule notifications.** Update the notifications plugin's local zone and re-run notification sync (§8.6).
5. **Tell the user once.** A dismissible banner: "Time zone changed from Asia/Baghdad to Europe/Istanbul. Times are shown in your current local time."
6. **Day grouping uses the current zone.** Past days may appear shifted by the offset difference. That's acceptable for a non-travel app and is stated in About.

### 6.6 Overlaps

**Definition.** Two entries overlap when they are the **same kind** (actual–actual or planned–planned), both have an end, and `a.start < b.end && b.start < a.end`. So:
- Touching entries (14:00–15:00 and 15:00–16:00) don't overlap.
- Planned vs actual never "overlap" — comparing them is the point.
- Open entries are excluded until they get an end (then checked).
- Routine vs routine overlap is checked on the template's daily time windows (RTN-07).

**Where it shows:**

| Place | Treatment |
|---|---|
| Editor (before save) | Warning-colored inline note: "⚠ Overlaps with Work 14:00–17:00". Save button unchanged. |
| Timeline | Overlapping blocks share the lane side by side (column layout, like most calendars); each shows a ⚠ icon. |
| Day header | Chip "⚠ 1 overlap" → tap scrolls to it. |
| Month calendar | Small warning-colored ⚠ triangle on the day. |
| Reports | Footnote about overlapping time counted under more than one label; tracked total uses time covered (union), so it never exceeds the period length. |

Overlap detection is computed on read (a sweep over the day's entries); it isn't stored. Later: mark an overlap as intentional to silence it (§16).

### 6.7 Routines: template, occurrences, exceptions

These three things are deliberately different:

| | **Routine (template)** | **Occurrence (generated planned entry)** | **Exception (date-specific override)** |
|---|---|---|---|
| What it is | The rule: "Sleep, every day 23:00 → 07:00, from 1 Oct" | One day's planned entry produced by the rule | "On 25 Oct, Sleep is 00:30 → 08:00" or "skip 25 Oct" |
| Stored in | `routines` | `entries` (kind=planned, source=routine, `routineId`, `occurrenceDate`) | `routine_exceptions` (unique per routine + date) |
| Source of truth? | Yes, for unstarted days | **No — derived**, rebuilt from template + exception | Yes, for its date |
| User edits it via | Routine editor | Occurrence sheet → writes an exception | Occurrence sheet |
| In backup? | Yes | Yes (so history and links survive) | Yes |

**The key rule:** editing a single occurrence never edits the entry row directly. It writes or updates an **exception**, then regenerates that one occurrence. Because the generator always applies exceptions, regenerating can never overwrite a one-day change.

#### Generation ("materialization") algorithm

A pure function, `planOccurrences(routines, exceptions, dateRange, now)`, returns the **desired** occurrences. For each active routine R and each local date D in range (within R's starts-on/ends-on, not paused):

1. If an exception for (R, D) is a **skip** → no occurrence.
2. Start = local(D, exception.startOffset ?? R.startMinute).
3. End = local(D, exception.endOffset ?? (R.endMinute ≤ R.startMinute ? R.endMinute + 1440 : R.endMinute)).
4. Label/note = exception values ?? R values.

(`local(D, minutes)` builds a wall-clock time relative to D's midnight, allowing minutes ≥ 1440 for "next day", and resolves DST per §6.4. Exception offsets may range from −720 to 2,880 so a one-day change can move the start into the next morning.)

A **reconciler** then compares desired with existing occurrence rows for the same routines and dates, keyed by `(routineId, occurrenceDate)`:

| Existing row? | Desired? | Row is **frozen**?¹ | Action |
|---|---|---|---|
| No | Yes | — | **Insert** (also backfills days when the app wasn't opened) |
| Yes | No | No | **Delete** (e.g. skipped, paused, routine ended) |
| Yes | No | Yes | Keep (history) |
| Yes | Yes, differs | No | **Update** |
| Yes | Yes, differs | Yes | Keep (history) |
| Yes | Yes, same | — | Nothing |

¹ **Frozen** = the occurrence has started (start ≤ now) **or** has a linked actual entry. The single exception: when the user explicitly edits a past occurrence ("this day only"), that one key is reconciled even though it's frozen.

**Why duplicates are impossible:**
- A database **unique index** on `(routineId, occurrenceDate)` makes a duplicate a hard error, not a silent bug.
- The generator is **idempotent**: running it twice gives the same result.
- Runs are **single-flight** (one at a time, behind a mutex) and wrapped in **one transaction**.

**Why actual records are never overwritten:** the reconciler only reads and writes rows where `kind = planned AND source = routine AND routineId ∈ routines being processed`. Actual entries are created only by the user (directly or via "Log as actual", which creates a *new* row).

**When it runs:**
- App start and resume (range: from each routine's `generatedThrough + 1` — or its start date — up to today + 14 days).
- After creating/editing/pausing/ending a routine or any exception (that routine; unstarted dates).
- After a time-zone change (all routines; unstarted dates).
- Before showing or reporting on a date range beyond the horizon: `ensureOccurrences(range)`, capped at today + 365 days. So browsing the calendar into next month shows planned routines there too.
- After import.

Each routine stores `generatedThrough` (device bookkeeping) so routine startup work is incremental.

### 6.8 Exceptions — user experience

Tapping a routine occurrence opens the **occurrence sheet**:

- **Log as actual** (if started or past, and not already logged)
- **Change this day only** → mini editor (times, label, note). Saves an exception. The block shows a small "edited" icon next to the repeat icon.
- **Skip this day** → skip exception; occurrence disappears; snackbar with Undo.
- **Reset to routine** (only if an exception exists) → deletes the exception.
- **Edit routine…** → routine editor; banner explains "Changes apply from the next occurrence that hasn't started."

Deleting a routine occurrence from the generic entry delete action is treated as **Skip this day** (with the same wording), so a deleted occurrence never comes back on its own.

### 6.9 Incomplete (open) entries

An **open entry** has a start and no end. Rules:

- It appears in its start day's timeline from start to "now" (if today) or with a fixed 1-hour dashed tail (other days), labelled "No end".
- It appears in **To finish** (S11), sorted oldest first. A badge chip on Today ("◷ 2 to finish") is visible from any date.
- Quick actions: **End now**, **+30m / +1h / +2h** (from start), **Set end…**, **Delete**.
- It is excluded from overlap checks and report totals (with a visible note) [D-08].
- Evening check-in mentions it (NTF-03).
- There's no limit on how many open entries can exist, but quick add shows "You have an open Study entry from 14:05 — end it now?" when creating another actual entry, as a one-tap convenience (not a block).

### 6.10 Long-term tasks: dates, overdue, completion, recurrence

**Dates.** Start and deadline are **local dates** (not instants), so they never shift with time zones. A deadline may optionally have a time.

**Overdue.** A task is overdue when it isn't completed and:
- the deadline has **no time** and today is after the deadline date, or
- the deadline **has a time** and now is after that date+time.

Tasks without a deadline are never overdue. Overdue tasks show an "Overdue · 5 days" chip in red-tinted text with an icon (not color alone) and sort to the top. Status is never changed automatically.

**Completion.** Setting status to Completed sets `completedAt` = now (editable). Reopening clears it and sets In progress. Completing cancels the task's pending reminders.

**Retrospective tasks.** Any start date in the past is allowed. Past-dated reminders are never scheduled. A completed retrospective task needs a "Completed on" date. Repeating retrospective tasks don't backfill past instances — the series continues from the one instance you entered.

**Recurrence (repeating tasks).** One **series** holds the rule; each **instance** is a normal task row with `seriesId`. **Only one open instance per series exists at a time**, so nothing piles up.

When an instance is completed (or skipped):
- **On schedule** mode (default): next start = the next scheduled date after the completed instance's start; if that date is already in the past, keep stepping forward until it's today or later (missed periods are skipped, not created).
- **After completion** mode: next start = completion date + interval ("every 3 months after the last haircut").
- **Deadline**: if the instance had a deadline, the next deadline keeps the same offset from start (e.g. start 1st, deadline 5th).
- **Monthly on the 29th–31st**: clamp to the month's last day, without drifting (31 Jan → 28/29 Feb → 31 Mar).
- **Ends on**: if the next start is after the series end date, no new instance; the series is marked finished.
- The next instance copies title, notes, priority, category, estimate and relative reminders from the completed one, so editing the current instance naturally updates future ones.
- **Undo**: un-completing an instance deletes the next instance if it is still untouched (not edited, no linked time); otherwise both remain and the user is told.

**Deleting a repeating task** asks: *Skip this one* (removes this instance and creates the next; any linked time is kept, unlinked) · *Stop repeating* (keeps this instance, ends the series) · *Delete this and stop repeating*. Completed past instances are kept unless the user picks "Delete all instances".

Decisions to confirm: **D-13** (mode default and missed-period behavior), **D-14** (frequencies offered).

### 6.11 Deletion and undo patterns

| Action | Pattern |
|---|---|
| Delete entry, skip occurrence | Immediate + 5 s **Undo** snackbar |
| Delete task, routine, category, label | Confirmation dialog stating consequences (counts) |
| Import (replace/merge), erase all data | Confirmation + automatic safety backup |
| Complete task | Immediate + Undo |

Undo restores the exact previous rows (kept in memory for the snackbar's lifetime).

---

## 7. Data model

### 7.1 Principles

- **IDs:** UUID strings generated on the device (UUIDv7, time-ordered, for good index locality; §8). IDs never change and are the **identity used for import merging**.
- **Timestamps:** every record has `createdAt` and `updatedAt` (UTC epoch ms), set by repositories using the injectable clock.
- **References by ID**, never by name, so renames are free and history is never rewritten.
- **Derived data** (overlaps, totals, overdue, effective category) is computed, not stored. The only derived data stored is routine occurrences (§6.7) because they need stable IDs for links and history.
- **Hard deletes** plus Undo and safety backups. No soft-delete tombstones (no sync means no need for them).
- **Colors are stored as palette keys** (`"teal"`, `"amber"`), not raw ARGB, so each theme can render accessible light and dark variants. Custom hex colors can be added later as `"#RRGGBB"` keys.

### 7.2 Entity–relationship overview

```
categories 1 ──< labels 1 ──< entries >── 0..1 tasks >── 0..1 task_series
     │                │           │  └── 0..1 planned entry (planned_entry_id, self-reference)
     │                │           └──── 0..1 routines (occurrences only)
     │                └──< routines 1 ──< routine_exceptions
     └──< tasks                      tasks 1 ──< task_reminders
     └──< entries (category override, rare)

settings (key/value)            ← portable + device-only keys
scheduled_notifications         ← device-only bookkeeping, never exported
```

### 7.3 Tables

Types are SQLite/Drift types. "→" means foreign key.

**`categories`**

| Column | Type | Rules |
|---|---|---|
| id | TEXT PK | UUID |
| name | TEXT | 1–40 chars, trimmed |
| name_key | TEXT UNIQUE | lower-cased, trimmed, whitespace collapsed — enforces uniqueness |
| color_key | TEXT NULL | palette key |
| sort_order | INT | |
| created_at, updated_at | INT | UTC ms |

**`labels`**

| Column | Type | Rules |
|---|---|---|
| id | TEXT PK | UUID |
| name / name_key | TEXT / TEXT UNIQUE | as categories (unique across active **and** archived labels) |
| color_key | TEXT | required palette key |
| icon_key | TEXT NULL | curated icon key (stable string, not a font codepoint) |
| category_id | TEXT NULL → categories | app moves references before deleting a category |
| is_archived | BOOL | default false |
| sort_order | INT | |
| created_at, updated_at | INT | |

**`entries`**

| Column | Type | Rules |
|---|---|---|
| id | TEXT PK | UUID |
| kind | TEXT | `planned` \| `actual` |
| label_id | TEXT → labels | required, RESTRICT on delete (labels in use can't be deleted) |
| category_override_id | TEXT NULL → categories | rare |
| start_utc | INT | UTC ms, minute-aligned |
| end_utc | INT NULL | `> start_utc`, `≤ start_utc + 7 days`; NULL = open |
| tz_id | TEXT | IANA zone at save time (informational) |
| utc_offset_min | INT | offset at start (informational) |
| note | TEXT NULL | ≤ 2,000 chars |
| task_id | TEXT NULL → tasks | SET NULL on task delete |
| source | TEXT | `manual` \| `routine` \| `from_plan` |
| routine_id | TEXT NULL → routines | only when source = routine |
| occurrence_date | TEXT NULL | `YYYY-MM-DD`; only when source = routine |
| planned_entry_id | TEXT NULL → entries | only on actual entries logged from a plan; SET NULL on delete |
| created_at, updated_at | INT | |

Constraints and indexes:
- `CHECK ((source = 'routine') = (routine_id IS NOT NULL AND occurrence_date IS NOT NULL AND kind = 'planned'))`
- **Unique** partial index `(routine_id, occurrence_date) WHERE routine_id IS NOT NULL` — the no-duplicates guarantee.
- Index `(start_utc)`, `(kind, start_utc)`, `(label_id)`, `(task_id)`, partial `(start_utc) WHERE end_utc IS NULL` (To finish).
- Day query: `start_utc < dayEnd AND COALESCE(end_utc, start_utc + 1) > dayStart AND start_utc > dayStart − 7 days`. The last condition lets the `start_utc` index do the work (that's why the 7-day cap exists). Open entries therefore show on their start day only, as §6.9 specifies.

**`routines`**

| Column | Type | Rules |
|---|---|---|
| id | TEXT PK | |
| name | TEXT NULL | defaults to label name in UI |
| label_id | TEXT → labels | RESTRICT |
| start_minute, end_minute | INT | 0–1439; not equal; end ≤ start means next day |
| recurrence_freq | TEXT | `daily` (v1 only) |
| recurrence_interval | INT | 1 (v1) |
| weekdays_mask | INT NULL | reserved for weekday routines (Later) |
| starts_on | TEXT | local date |
| ends_on | TEXT NULL | local date |
| is_paused | BOOL | |
| is_archived | BOOL | ended/deleted-with-history routines |
| note | TEXT NULL | |
| reminder_offset_min | INT NULL | NULL = off; 0 = at start; 5–60 = before |
| reminder_ignore_quiet | BOOL | |
| generated_through | TEXT NULL | **device bookkeeping**; not imported (recomputed) |
| created_at, updated_at | INT | |

**`routine_exceptions`**

| Column | Type | Rules |
|---|---|---|
| id | TEXT PK | |
| routine_id | TEXT → routines | CASCADE |
| occurrence_date | TEXT | **unique with routine_id** |
| type | TEXT | `skip` \| `modify` |
| start_offset_min, end_offset_min | INT NULL | minutes from occurrence-date midnight, −720…2,880; end > start |
| label_id | TEXT NULL → labels | override label |
| note | TEXT NULL | override note |
| created_at, updated_at | INT | |

**`task_series`**

| Column | Type | Rules |
|---|---|---|
| id | TEXT PK | |
| freq | TEXT | `daily` \| `weekly` \| `monthly` \| `yearly` |
| interval | INT | ≥ 1 |
| mode | TEXT | `schedule` \| `after_completion` |
| anchor_date | TEXT | first instance's start (defines day-of-month/weekday) |
| ends_on | TEXT NULL | |
| is_active | BOOL | false after "stop repeating" or end reached |
| created_at, updated_at | INT | |

**`tasks`**

| Column | Type | Rules |
|---|---|---|
| id | TEXT PK | |
| series_id | TEXT NULL → task_series | |
| title | TEXT | 1–120 chars |
| notes | TEXT NULL | ≤ 5,000 chars |
| start_date | TEXT | required local date |
| deadline_date | TEXT NULL | ≥ start_date |
| deadline_minute | INT NULL | optional time of day |
| status | TEXT | `not_started` \| `in_progress` \| `completed` |
| priority | TEXT | `low` \| `normal` \| `high` |
| category_id | TEXT NULL → categories | |
| estimate_min | INT NULL | |
| actual_adjust_min | INT | default 0; may be negative |
| completed_at | INT NULL | required iff status = completed |
| created_at, updated_at | INT | |

Indexes: `(status)`, `(start_date)`, `(deadline_date)`, `(series_id)`. Partial unique index "one open instance per series": `(series_id) WHERE status != 'completed' AND series_id IS NOT NULL`.

**`task_reminders`**

| Column | Type | Rules |
|---|---|---|
| id | TEXT PK | |
| task_id | TEXT → tasks | CASCADE |
| type | TEXT | `at_start` \| `before_deadline` \| `on_deadline` \| `custom` |
| offset_days | INT NULL | for `before_deadline` (1–30) |
| minute_of_day | INT NULL | for relative types |
| custom_at_utc | INT NULL | for `custom` |
| ignore_quiet | BOOL | |
| created_at, updated_at | INT | |

**`settings`** — key/value with JSON values and a `scope` of `portable` (exported) or `device` (never exported). See §10.4 for the list.

**`scheduled_notifications`** (device only) — `key TEXT PK` (e.g. `rtn:{routineId}:{date}`), `platform_id INT UNIQUE` (allocated sequentially, avoids hash collisions in the 32-bit ID space), `fire_at_utc INT`, `content_hash TEXT`.

### 7.4 Identifiers

- **Format:** lowercase canonical UUID string (36 chars). UUIDv7 recommended; v4 acceptable.
- **Generated:** only in repositories, never in widgets.
- **Import identity:** same ID ⇒ same record. Natural keys used as secondary matches during merge (§10.6): label/category `name_key`; occurrence `(routineId, occurrenceDate)`; exception `(routineId, occurrenceDate)`.

### 7.5 Domain models vs database rows

- Drift generates row classes for the data layer.
- The domain layer uses **Freezed** entities (team baseline) with typed value objects: `LocalDate`, `WallTime` (minutes), `Instant` wrappers, `EntryKind`, `TaskStatus`, etc.
- Repositories map rows ⇄ entities. Domain code never imports Drift; that keeps generators, reports and validators pure and fast to test.
- Backup DTOs are a **third** representation (versioned JSON), so the database schema can evolve without breaking old backups.

### 7.6 Deletion and rename behavior

| Entity | Delete rule | What happens to references |
|---|---|---|
| Entry (manual/actual) | Always (Undo) | Actual entries linked via `planned_entry_id` → link cleared |
| Entry (routine occurrence) | Becomes **Skip this day** | Exception row created |
| Label | **Only if unused**; otherwise Archive | — |
| Category | Always, after choosing a destination | Labels, tasks, overrides moved to destination / Uncategorized |
| Routine — no past occurrences | Hard delete | Future occurrences and exceptions deleted |
| Routine — has past occurrences | Default: **End & archive** (keeps past planned entries). Option: "Delete with history" deletes its planned occurrences | Actual entries are never deleted; their `planned_entry_id` link is cleared |
| Exception | "Reset to routine" | Occurrence regenerated from template |
| Task | Confirm | Linked entries kept, `task_id` cleared; reminders deleted |
| Task series | Skip / Stop / Delete options (§6.10) | Completed instances kept unless "Delete all" |

**Rename:** labels, categories and tasks are referenced by ID, so a rename updates every screen, report, CSV and PDF immediately. Old names aren't kept (a rename history could come later).

### 7.7 Schema versioning and migrations

- Drift `schemaVersion` starts at 1. Every released schema is exported as a snapshot (`drift_dev schema dump`) and committed.
- Each migration is a step (`from1To2`, …) with a **generated migration test** that opens the old snapshot with sample data and verifies the result.
- Before running a migration, the app copies the DB file to `safety/pre-migration-v{n}.sqlite`.
- If a migration fails: no partial state (transaction), and the app opens the **Recovery screen** (S28) instead of crashing — offering to retry, restore the safety copy, or export the raw database file.
- Never drop a column with user data without first moving it. Destructive changes require a backup-format bump plan as well.

---

## 8. Local-first architecture for Flutter

### 8.1 Stack at a glance

| Concern | Choice | Notes |
|---|---|---|
| SDK | **Flutter 3.47.x stable / Dart 3.13** (verified current on 2026-10-25) | Your machine has 3.44.8 — run `flutter upgrade` in Phase 0. freezed 4 needs Dart 3.13. |
| Design widgets | **`material_ui` + `cupertino_ui` packages** | Material/Cupertino now ship outside the SDK; the in-SDK copies are frozen and slated for deprecation. Start on the packages, with a Phase 0 compile spike for every dependency (fallback: SDK Material). |
| Architecture | Feature-first, three layers (presentation / domain / data) | Matches your team baseline skills. |
| State | **flutter_bloc** — Bloc (not Cubit) with Freezed events/state, `DataState<T>` | Team baseline [D-03]. |
| DI | **get_it** | Team baseline. |
| Navigation | **go_router 18** with `StatefulShellRoute` for the tabs | flutter.dev package, "feature-complete". |
| Database | **Drift 2.35** (SQLite) via `drift_flutter` | Typed SQL, reactive `watch()`, transactions, generated migration tests. |
| Models | **freezed 4** + **json_serializable** | Entities, states, backup DTOs. |
| Notifications | **flutter_local_notifications** + **timezone** + **flutter_timezone** | §8.6. |
| Charts | **fl_chart** | §8.8. |
| Month grids | **table_calendar** | Day timeline is custom (§8.7). |
| PDF | **pdf** + **printing** | Native vector charts (§8.10). |
| CSV | **csv 8** | §8.9. |
| Files | **share_plus**, **file_picker**, **path_provider**, **archive**, **crypto** | §8.11. |
| Time & IDs | **clock**, **uuid** (v7) | Testable "now"; time-ordered IDs. |
| l10n / flavors / assets | flutter_localizations + intl ARB; dev/prod flavors; FlutterGen | Team baseline. |

**Adapting the team baseline:** the baseline assumes an API-backed app. This app keeps its structure (feature-first, Bloc + Freezed, GetIt, GoRouter, use cases, `DataState`, flavors, l10n, FlutterGen) and **drops Dio, Retrofit, network interceptors and `ResponseEntity`**, because there is no server. Data sources are Drift DAOs instead of API services.

### 8.2 Project structure

```
lib/
├── flavors.dart
├── main.dart                      # small: flavor → bootstrap() → runApp
└── src/
    ├── app/
    │   ├── app.dart               # MaterialApp.router, themes, l10n delegates
    │   ├── bootstrap.dart         # startup order (§8.4.4)
    │   ├── routes/                # app_router.dart, route_names.dart
    │   └── theme/                 # app_theme.dart, label_palette.dart, timeline_tokens.dart
    ├── config/
    │   ├── gen/                   # FlutterGen output
    │   └── localization/l10n/     # templates/*.arb, generated/
    ├── core/
    │   ├── di/injection.dart
    │   ├── database/              # app_database.dart, tables/, daos/, migrations/
    │   ├── time/                  # local_date.dart, wall_time.dart, day_math.dart, time_zone_service.dart, day_change_service.dart
    │   ├── notifications/         # notification_gateway.dart (interface), flutter_local_notifications_gateway.dart,
    │   │                          # notification_planner.dart (pure), notification_sync_service.dart, deep_links.dart
    │   ├── files/                 # file_gateway.dart (pick/save/share interface) + implementation
    │   ├── error/                 # failures.dart
    │   ├── usecases/usecase.dart  # UseCase<Type, Param>, NoParams
    │   ├── utils/                 # data_state.dart, id_generator.dart, duration_format.dart
    │   └── widgets/               # shared: empty_view, error_view, duration_text, label_chip, color_dot, section_header
    └── features/
        ├── entries/               # CRUD, quick add, editor, To finish
        ├── day_view/              # timeline + list, layout engine
        ├── calendar/              # hourly month calendar
        ├── labels/                # labels & categories
        ├── routines/              # templates, exceptions, occurrence planner + reconciler
        ├── tasks/                 # tasks, series, reminders, task calendar
        ├── reports/               # aggregation, charts, CSV, PDF
        ├── backup/                # export, import pipeline, safety backups, recovery
        ├── notification_settings/ # settings UI (engine lives in core/notifications)
        ├── settings/
        └── onboarding/

each feature/
├── <feature>_injection.dart
├── data/        datasource/ (DAO wrappers), repositories/ (implementations, mappers)
├── domain/      entities/, repositories/ (interfaces), usecases/, services/ (pure engines)
└── presentation/ bloc/, pages/, widgets/

test/              mirrors lib/; test/fixtures/ (backups per format version, seeded datasets)
integration_test/  patrol journeys
drift_schemas/     committed schema snapshots per version
docs/              PROJECT_PLAN.md, decisions.md
```

### 8.3 Layers and rules

| Layer | Contains | Rules |
|---|---|---|
| **Presentation** | Pages, widgets, Blocs | Widgets render state and dispatch events. Blocs call use cases. No DB or plugin calls from widgets. Side effects (snackbars, navigation, permission prompts) in `BlocListener`s. |
| **Domain** | Freezed entities, value objects (`LocalDate`, `WallTime`, `EntryKind`…), repository interfaces, use cases, **pure engines** | **No Flutter or Drift imports** (checked by a test that scans imports). This is where the hard logic lives, so it's fast to test. |
| **Data** | Drift tables & DAOs, row ⇄ entity mappers, repository implementations | Transactions live here. Repositories set IDs and timestamps. |
| **Core services** | Notification gateway, file/share gateway, time-zone provider, clock | Always behind an interface so tests use fakes and plugins can be swapped. |

**Pure engines** (domain/services) — the heart of the app, each with its own test suite:

| Engine | Input → output |
|---|---|
| `DayMath` | local date ⇄ instants, day bounds, `local(D, minutes)` with DST rules, clipping, splitting at midnight |
| `OverlapDetector` | entries for a range → overlap groups + timeline columns |
| `IntervalUnion` | intervals → covered duration (for "tracked" totals) |
| `OccurrencePlanner` + `OccurrenceReconciler` | routines, exceptions, range, now, existing rows → insert/update/delete plan (§6.7) |
| `TaskRecurrence` | series + completed instance + today → next instance (or none) (§6.10) |
| `ReportAggregator` | entries, labels, categories, tasks, range → report model (totals, series, notes) |
| `NotificationPlanner` | routines' occurrences, tasks, reminders, open entries, settings, now → desired notifications (§8.6) |
| `BackupCodec` / `ImportValidator` / `ImportMerger` | file bytes ⇄ DTOs; DTOs + current DB snapshot → preview + apply plan (§10.6) |
| `CsvReportWriter` / `PdfReportBuilder` | report model → bytes |

### 8.4 State management with Bloc

#### 8.4.1 Blocs and their scope

| Bloc | Scope | Notes |
|---|---|---|
| `AppSettingsBloc` | App | Theme, week start, timeline mode; read from the settings table. |
| `DayViewBloc` | Day page (one per visible date) | Subscribes to `watchDay(date)`; builds timeline model (segments, columns, overlaps, summary). |
| `QuickAddBloc`, `EntryEditorBloc` | Sheet/page | Draft entry, smart defaults, debounced (200 ms) overlap check, save/delete. |
| `LabelPickerBloc`, `LabelsBloc`, `LabelEditorBloc` | Page/sheet | Search, inline create, archive/delete rules. |
| `ToFinishBloc` | Page | Open entries stream; quick end actions. |
| `CalendarBloc` | Calendar tab | Month summaries stream; calls `ensureOccurrences` for the visible month. |
| `RoutinesBloc`, `RoutineEditorBloc`, `OccurrenceBloc` | Page/sheet | Template CRUD, overlap warnings, exception actions. |
| `TasksBloc`, `TaskCalendarBloc`, `TaskEditorBloc`, `TaskDetailBloc` | Tasks tab/pages | Grouping, filters, recurrence on complete, linked time. |
| `ReportsBloc`, `ExportBloc` | Reports tab/sheet | Period selection, aggregation (in an isolate for large ranges), CSV/PDF export. |
| `BackupBloc`, `ImportBloc` | Backup pages | Import is a state machine: idle → picking → validating → preview → applying → done / failed. |
| `NotificationSettingsBloc` | Page | Permission status, toggles, quiet hours, "scheduled through". |

#### 8.4.2 Patterns

- Events and state are **Freezed** classes in `<feature>_event.dart` / `<feature>_state.dart`; async fields use `DataState<T>` (loading / success / error), per the team baseline.
- Repositories expose **streams** for screens that must stay live (`watchDay`, `watchOpenEntries`, `watchTasks`); Blocs subscribe with `emit.forEach`, so subscriptions close with the Bloc.
- One-shot commands (save, delete, export) are use cases returning a Freezed `DataState`/result object, never throwing to the UI.
- Use `buildWhen`/`listenWhen` for noisy streams (the now-line ticks every minute — keep it in a tiny separate widget with its own `Timer`, not in the Bloc).

#### 8.4.3 App-wide services (not Blocs)

- `DayChangeService`: emits when the local date changes (timer to next local midnight, re-armed on resume and time-zone change). Today view and To finish react to it.
- `TimeZoneService`: reads the IANA zone, detects changes (§6.5).
- `OccurrenceService`: single-flight wrapper around planner + reconciler.
- `NotificationSyncService`: §8.6.
- `AppLifecycleCoordinator`: on start/resume runs, in order: time-zone check → `ensureOccurrences` (each routine from its `generatedThrough` to today + 14) → notification sync → day-change re-arm.

#### 8.4.4 Startup order (bootstrap)

1. `WidgetsFlutterBinding.ensureInitialized()`, flavor setup.
2. Open the database (show a minimal splash). If opening or migrating fails → Recovery screen (S28).
3. Register dependencies (GetIt).
4. Initialize timezone data and the notifications plugin; read the launch notification (cold-start tap) and keep its payload.
5. `runApp`. After the first frame: lifecycle coordinator runs; if a launch payload exists, navigate to it once the router is ready.

### 8.5 Persistence with Drift

- **One `AppDatabase`**, opened with `drift_flutter`'s `driftDatabase(name: 'planyar')` (files in the app documents/support directory).
- On open: `PRAGMA foreign_keys = ON`, WAL journal mode.
- **DAOs per feature**; every multi-row write is a transaction (`BEGIN IMMEDIATE` is drift's default in 2.34+).
- **Reactive queries** (`.watch()`) re-emit when the tables they read change — this is what keeps Today, Calendar and To finish live after any edit, import or routine regeneration.
- **Range queries** always use the indexed `start_utc` with a 7-day lower bound (§7.3).
- **Settings live in the DB** (`settings` table), not `shared_preferences`: they're transactional, included in backups, and one less dependency.
- **Migrations:** `dart run drift_dev make-migrations` generates step-by-step migration code and tests from the committed schema snapshots in `drift_schemas/`. Drift 2.31+ throws on downgrades, which surfaces as the Recovery screen rather than silent corruption.
- **Testing:** `NativeDatabase.memory()` for repository and DAO tests.
- **Build note:** the `sqlite3` 3.x package (under drift) downloads a precompiled, checksum-verified SQLite binary through a Dart build hook at **build time**. CI needs network access (or a mirror via the `url_pattern` user-define). Do **not** add the old `sqlite3_flutter_libs` / `sqlcipher_flutter_libs` packages — both are end-of-life.
- **Performance budgets** (mid-range Android, 20k entries ≈ 5 years): day query < 20 ms; month summary < 100 ms; month report < 300 ms; full export < 2 s.

### 8.6 Notification scheduling

All reminders are **local notifications scheduled in advance** (no server, no push). The OS delivers them even when the app is closed; the app's job is to keep the OS's queue correct.

#### 8.6.1 Components

```
 routines/occurrences ─┐
 tasks + reminders ────┤                         ┌─────────────────────┐
 open entries ─────────┼──► NotificationPlanner ─►│ desired list (≤ cap)│
 settings/quiet hours ─┤      (pure, tested)      └─────────┬───────────┘
 now, zone, platform ──┘                                    ▼
                                         NotificationSyncService (single-flight, debounced 1 s)
                                           1. cancel all *pending* (not delivered) notifications
                                           2. schedule desired list via NotificationGateway
                                           3. write ledger (scheduled_notifications table)
                                                            ▼
                                         NotificationGateway (interface)
                                           └─ FlutterLocalNotificationsGateway (plugin)
```

- **Planner** (pure): builds the desired notifications for the **window** (Android 14 days, iOS 7 days), soonest first, capped by a **budget** (iOS ≈ 50 of the 64-request hard limit; Android ≈ 150, well below the ~500 alarms some OEMs allow). Applies quiet hours, drops anything in the past, and gives each a **stable key** (`rtn:{routineId}:{date}`, `tsk:{reminderId}:{taskId}`, `chk:{date}`, `wk:{weekStart}`, `bak:{date}`, `keepalive`).
- **Sync service**: performs a **full, idempotent re-plan** — cancel pending + schedule desired — rather than diffing against the plugin's pending list (that list has no fire times and can be stale on Android after the OS cancels alarms). With ≤ 150 items this is cheap.
- **Ledger** (`scheduled_notifications`): maps each key to a stable 31-bit ID (so an updated reminder replaces rather than duplicates), and records fire time and content hash. It powers "Reminders scheduled through …" and the dev-flavor debug screen.

#### 8.6.2 When sync runs

- Cold start and every resume.
- After any change to routines, exceptions, tasks, task reminders, open entries (start/end), quiet hours or notification settings (Drift table streams, debounced).
- After a time-zone change (the plugin does **not** reschedule on zone change by itself), a permission change (detected on resume), an import, or erase-all.
- Android reboot and app update: the plugin's boot receiver restores its own queue; the next app open re-plans anyway.

#### 8.6.3 Notification types and rules

| Type | Key | Fires | Quiet hours | Channel (Android) |
|---|---|---|---|---|
| Routine reminder | `rtn:` | occurrence start − offset; skipped/changed occurrences use exception values | Dropped unless "allow during quiet hours" | **Routines** (high → heads-up) |
| Task reminder | `tsk:` | per reminder type; never for completed tasks or past times | Deferred to quiet-hours end unless allowed | **Tasks** (high) |
| Evening check-in | `chk:` | daily at check-in time **only if** open entries exist or nothing logged that day (content computed at plan time; re-planned on every entry change) | Dropped | **Check-ins & summaries** (default) |
| Weekly review | `wk:` | first day of week 09:00 (if on) | Deferred | Check-ins & summaries |
| Backup reminder | `bak:` | 30 days after last export, then monthly | Deferred | **Backups** (low) |
| Keep-alive | `keepalive` | at the end of the scheduling window, only if recurring reminders exist: "Open Planyar to keep your reminders coming" | Deferred | Check-ins & summaries |

The **keep-alive** notification is pushed forward every time the app opens, so it only ever fires if you haven't opened the app for about a week — exactly when reminders would otherwise silently stop (iOS window limit; Android "restricted" standby bucket after 8 days of non-use) [D-44].

#### 8.6.4 Platform scheduling modes

- **Android:** use `exactAllowWhileIdle` when exact alarms are permitted (`canScheduleExactNotifications()`), otherwise `inexactAllowWhileIdle` (can be up to ~1 hour late on Android 12+). Don't use `exact` (deferred in Doze) or `alarmClock` (looks like a system alarm). **Confirmed for Planyar (sideloaded): declare `USE_EXACT_ALARM`**, which is auto-granted, so the exact mode is normally always available. (On Play it is restricted to alarm/timer and calendar apps; a Play release would switch to `SCHEDULE_EXACT_ALARM` plus step 3 below) [D-40].
- **iOS:** one-shot calendar triggers for everything (repeating triggers can't skip a single day, and routine exceptions need that). Pending requests are hard-limited to 64 per app, so the planner never submits more than the budget.
- **Time zone:** before scheduling, set the plugin's local zone (`tz.setLocalLocation`) from `flutter_timezone`'s IANA identifier.

#### 8.6.5 Permission flow

1. **Never prompt at launch.** On iOS, initialize the plugin with the alert/sound/badge request flags **off** (the defaults would prompt during `initialize()`).
2. The first time the user turns on any reminder (or taps "Allow notifications" in onboarding step 4): show a one-screen explanation → request notification permission (Android 13+ `POST_NOTIFICATIONS`; iOS alert+sound+badge; no provisional — quiet delivery is wrong for bedtime reminders).
3. **Android 14+ (only if using `SCHEDULE_EXACT_ALARM`, i.e. a future Play release):** if the user enabled a *time-specific* reminder and exact alarms aren't allowed, explain "For on-time reminders, allow Alarms & reminders" → `requestExactAlarmsPermission()` (opens system settings). If declined, keep inexact and show a persistent note in Notification settings.
4. **Denied / blocked:** the toggle stays off; Notification settings shows a banner with **Open settings** (`openAppNotificationSettings()`). Re-check status on every resume.
5. Check permission before scheduling (on iOS 27 the plugin swallows "not authorized" errors, so the app must not assume success).

#### 8.6.6 Taps and deep links

- Each notification carries a **payload** with a route (`/day/2026-10-25?entry=…`, `/tasks/{id}`, `/to-finish`, `/reports?period=last-week`, `/settings/backup`).
- **Cold start:** read `getNotificationAppLaunchDetails()` during bootstrap and navigate once the router is ready (don't navigate before the first frame).
- **Warm:** `onDidReceiveNotificationResponse` → router.
- Routes must tolerate missing targets (deleted task → show a friendly "This task no longer exists").
- **Action buttons** ("Log as planned", "Snooze 10 min") are **Later**: they run in a separate background isolate that must reopen the database and timezone data, and on iOS may run while the phone is locked. Worth doing once the core is stable.

#### 8.6.7 Troubleshooting screen ("Reminders not arriving?")

Shown from Notification settings: permission status (notifications, exact alarms), "scheduled through" date, last sync time, a **Send test notification** button, and plain-language battery tips for Samsung/Xiaomi/Huawei/OnePlus with a link to dontkillmyapp.com and to battery settings. Don't request the battery-optimization exemption (Play restricts it).

### 8.7 Day timeline, month grids and routine engine

**Day timeline — custom widget** (no package offers Plan | Actual lanes with overlap columns and overnight segments):
- A pure `TimelineLayout` engine turns the day's entries into segments: lane (plan/actual), top and height in minutes from the day's start **instant** (so 23 h and 25 h days work), column index and column count for overlaps, and continuation flags.
- Rendering: a vertical scroll view; `CustomPaint` for the hour grid, labels and now-line; `Stack` + `Positioned` (or `CustomMultiChildLayout`) for blocks. A day has tens of blocks at most, so this is fast.
- Hour height = 56 dp × text scale (clamped); blocks shorter than the 48 dp touch target get an enlarged hit area.
- Day-to-day swiping: `PageView` building only today ± 1.
- **List mode** shares the same segment model, rendered as a simple list — built **first** in Phase 1 because it's simpler and fully accessible.

**Month grids:** `table_calendar` with custom cell builders for both the hourly calendar (mini category bar, planned dot, ⚠, ◷) and the task calendar (● start, ◆ deadline). If it doesn't fit the design or doesn't compile with `material_ui`, a custom `GridView` month is a 1–2 day job.

**Routine engine & background work:** nothing needs to run in the background. Occurrences are generated on start/resume, on edits, and on demand when a date range is viewed (§6.7). Notifications are pre-scheduled with the OS. An Android WorkManager daily "top-up" is a Later option, never a delivery mechanism.

### 8.8 Charts

- **Package:** `fl_chart` (MIT, active). It covers horizontal/vertical bars, stacked bars (`rodStackItems`), donut (`PieChart` with `centerSpaceRadius`) and line.
- **Four chart components** (§3.7): `CategoryDonut`, `LabelBars` (horizontal), `PlanVsActualBars` (paired horizontal bars, planned as outlined/hatched bar, actual solid), `DailyStackedColumns`.
- **Readability rules:**
  - Donut ≤ 6 slices + "Other"; label bars top 10 + "Other"; stacked columns ≤ 6 categories + Other.
  - Colors come from the label/category palette keys (same hue everywhere in the app); "Other" and "Uncategorized" are neutral gray.
  - **Direct labels** (value at bar end, "12 h 30 m") instead of legends where possible; donut has a legend list with values and percentages beside/below it.
  - Value axis starts at 0, light gridlines, hour-based ticks (0, 2, 4 h…), no 3D, no dual axes.
  - Horizontal bars for label names (long names stay readable); truncate with ellipsis and show full name on tap.
  - Tap shows a tooltip; animations disabled when reduce-motion is on.
  - Charts have no built-in screen-reader support: wrap each in `Semantics` with a text summary, and offer **View as table** (RPT-11).

### 8.9 CSV export

**Package:** `csv` 8 (note: v7 was a full rewrite and v8 renamed `CsvCodec` → `Csv`; use the current API).

**Tables** (user selects; one file each, zipped if more than one [D-36]):

| File | Columns |
|---|---|
| `summary_by_label.csv` | label, category, actual_minutes, actual_hours, planned_minutes, planned_hours, difference_minutes, entry_count |
| `summary_by_category.csv` | category, actual_minutes, actual_hours, planned_minutes, planned_hours, difference_minutes |
| `daily_totals.csv` (long format, pivot-friendly) | date, category, label, actual_minutes, planned_minutes |
| `entries.csv` | entry_id, kind, label, category, task, start_local, end_local, duration_minutes_total, duration_minutes_in_range, crosses_midnight, has_overlap, source, routine, note |
| `tasks.csv` (if tasks included) | task_id, title, status, priority, category, start_date, deadline, completed_at, estimate_minutes, logged_minutes, overdue_at_range_end |

**Format rules:** UTF-8 **with BOM** (Excel needs it for non-ASCII text), comma delimiter (option: semicolon for regions where Excel expects it), **CRLF** line endings, RFC 4180 quoting, stable English `snake_case` headers, ISO-8601 local date-times **with offset** (`2026-10-25T14:00+03:00`), durations as plain numbers (minutes, and decimal hours with `.`), no thousands separators. **Formula-injection guard:** prefix any cell starting with `=`, `+`, `-`, `@`, tab or CR with `'`. File names: `planyar-report-2026-10-20_2026-10-26-entries.csv`.

### 8.10 PDF reports

- **Packages:** `pdf` (document building) + `printing` (share, system print dialog, optional preview).
- **Charts are drawn natively** with the pdf package's vector chart widgets (bar, line, pie/donut via inner radius, legends). They're sharp, small, searchable, testable, and can be built off the UI thread. Stacked columns (no built-in dataset) are drawn with `pw.CustomPaint`. Screenshotting Flutter widgets (`RepaintBoundary.toImage`) is a fallback only.
- **Fonts must be bundled** (e.g. Noto Sans, plus Noto Sans Arabic later for Kurdish/Arabic). The `PdfGoogleFonts` helper downloads at runtime — not allowed (offline, no INTERNET).
- **Layout:** A4 portrait (Letter for US locales); header with period and generation time; summary row; each chart followed by its data table; optional tasks section; data notes; footer with page numbers.
- **Generation:** build the report model on the main isolate, then generate bytes in a background isolate; share via `Printing.sharePdf` or the share sheet; print via `Printing.layoutPdf`. `PdfPreview` (a Material widget) is optional — check it works with `material_ui` in the Phase 0 spike.

### 8.11 File export, import and sharing

- **Export / share:** write to the temp directory (`path_provider`) → `SharePlus.instance.share(ShareParams(files: [...]))`. On iPad pass `sharePositionOrigin` so the popover anchors correctly.
- **Save to a chosen location:** `file_picker`'s save dialog (works on Android and iOS, returns the saved location). Offer it beside "Share" in the backup screen.
- **Import:** `file_picker` single-file pick, **any type** (custom extensions filter poorly on Android); validate by content (§10.6). Stream-read with a size cap.
- **ZIP:** `archive` ≥ 4.5.2 (earlier 4.4.x wrote malformed zips; 4.5 added output-size limits used as the zip-bomb guard). **Checksum:** `crypto` SHA-256.
- **Adapter:** all file/share calls go through `FileGateway`. `file_picker` changed its API in three major versions in 2026 (now maintained by a new owner), so keep it swappable and pin the major version.
- **No storage permissions** are needed on either platform (system pickers and share sheet handle access).

### 8.12 Localization, flavors, codegen and code quality

- **Localization:** ARB files from day one (English), generated `AppLocalizations` per the team baseline; all dates/numbers via `intl` with the device locale. Layouts use directional insets so RTL can be added later.
- **Flavors:** `dev` and `prod` with **different bundle IDs and app names** ("Planyar Dev"), so the dev build has its own database and never touches real data on your phone. Dev flavor adds a debug menu (seed data, notification inspector, time-travel clock override).
- **Codegen:** `build_runner` with freezed, json_serializable, drift_dev and FlutterGen. Generated files are committed and never hand-edited; CI fails if regeneration changes them.
- **Lints:** `flutter_lints` 6 plus a few stricter rules (`unawaited_futures`, `prefer_final_locals`, `avoid_dynamic_calls`, `always_declare_return_types`), or `very_good_analysis` 11 if you prefer strict-by-default. Analyzer plugins are now native in Dart (`plugins:` in `analysis_options.yaml`); `custom_lint` is archived — don't use it.
- **Import boundary check:** a small test fails if any file under `*/domain/` imports Flutter, Drift or a plugin.

### 8.13 Package recommendations

Versions verified on pub.dev on **2026-10-25**; "verify" means not checked in this research pass — check at Phase 0.

| Package | Purpose | Why it fits | Status | Latest checked |
|---|---|---|---|---|
| `material_ui`, `cupertino_ui` | Material/Cupertino widgets (now outside the SDK) | Required direction for new apps | **Essential** (spike in P0) | 1.8.0 / 1.1.4 (2026-10-20) |
| `flutter_localizations` (SDK), `intl` | l10n, date/number formatting | Standard; Flutter pins intl ^0.20.3 | **Essential** | intl 0.20.3 |
| `flutter_bloc` (+ `bloc`) | State management | Team baseline; stable, Flutter Favorite. Slow release cadence (last May 2025; core `bloc` May 2026) | **Essential** [D-03] | 9.1.1 / bloc 9.2.1 |
| `get_it` | Dependency injection | Team baseline | **Essential** | verify |
| `go_router` | Routing, tab shell, deep links | flutter.dev, feature-complete, already on material_ui | **Essential** | 18.1.1 (2026-10-20) |
| `freezed` + `freezed_annotation` | Immutable entities, unions, states | Team baseline; v4 needs Dart 3.13 | **Essential** | 4.0.3 / 3.1.0 |
| `json_serializable` + `json_annotation` | Backup DTO serialization | google.dev, standard | **Essential** | 6.15.2 |
| `build_runner` | Codegen runner | Much faster in 2026 (AOT builders) | **Essential** (dev) | 2.17.1 |
| `drift`, `drift_flutter`, `drift_dev` | SQLite ORM, reactive queries, migrations | Best fit for relational, range-heavy, reactive, migratable local data | **Essential** | 2.35.3 / 0.3.1 / 2.35.2 |
| `uuid` | Record IDs (v7) | Time-ordered, crypto RNG | **Essential** | 4.6.0 |
| `clock` | Injectable "now" | Makes midnight/DST testable | **Essential** | 1.1.3 |
| `flutter_local_notifications` | Local notification scheduling, permissions, taps | The standard plugin; very active; exact/inexact modes; launch details | **Essential** | 22.3.3 (2026-10-25) |
| `timezone` | `TZDateTime` for scheduling | Required by the plugin | **Essential** | 0.11.2 (tzdata 2026e) |
| `flutter_timezone` | Device IANA zone | Maintained fork; no change stream (check on resume) | **Essential** | 5.1.1 |
| `fl_chart` | In-app charts | MIT, active, covers all 4 chart types | **Essential** | 1.3.0 (2026-10-21) |
| `table_calendar` | Month grids | Custom cell builders; active again in 2026 | **Optional** (custom grid is the fallback) | 3.3.0 |
| `csv` | CSV encoding | Handles quoting, BOM, CRLF | **Essential** (small enough to hand-write if preferred) | 8.0.0 |
| `pdf`, `printing` | PDF build, share, print | Native vector charts; active | **Essential** for RPT-10 | 3.13.1 / 5.15.1 |
| `share_plus` | Share sheet | Standard; current `SharePlus.instance.share` API | **Essential** | 13.3.1 |
| `file_picker` | Import pick + save dialog | Works on both platforms incl. save; churny API → adapter + pinned major | **Essential** | 13.2.0 (2026-10-24) |
| `path_provider` | Temp/support directories | flutter.dev | **Essential** | 2.1.6 |
| `archive` | ZIP read/write with size limits | Active; use ≥ 4.5.2 | **Essential** | 4.5.2 |
| `crypto` | SHA-256 checksum | dart.dev | **Essential** | 3.0.7 |
| `flutter_flavorizr`, `flutter_launcher_icons`, `flutter_native_splash`, `flutter_gen_runner` | Flavors, icons, splash, typed assets | Team baseline tooling | **Optional** (dev tooling) | verify |
| `local_auth` | App lock (Later) | flutter.dev; v3 API | **Later** | 3.0.2 |
| `cryptography` (+ `cryptography_flutter`) | Password-encrypted backups (Later) | AES-GCM, PBKDF2/Argon2id; no 2026 releases | **Later** | 2.9.0 |
| `flutter_slidable` | Swipe actions in lists | Stable but no 2026 release; always provide buttons too | **Optional** | 4.0.3 |
| `app_settings` | Deep links to battery settings | Only for the troubleshooting screen | **Optional** | 9.0.1 |
| `workmanager` | Android daily top-up (Later) | Opportunistic only | **Later** | 0.10.10 |
| **Dev/test:** `mocktail` | Mocks/fakes | Standard | **Essential** | 1.0.5 |
| `bloc_test` | Bloc state tests | Team stack | **Essential** | verify |
| `integration_test` (SDK) | E2E harness | Use the SDK version (pub.dev package is discontinued) | **Essential** | SDK |
| `patrol` (+ `patrol_cli`) | E2E with native dialogs & notification shade | Permission-dialog and notification helpers | **Essential** for P6 | 4.10.0 |
| `fake_async` | Timer/time control in tests | Used by flutter_test | **Essential** | 1.3.3 |
| `alchemist` | Golden tests | Active; **may not accept material_ui's ThemeData** — check in spike | **Optional** | 0.14.1 |
| `flutter_lints` or `very_good_analysis` | Lint rules | Pick one | **Essential** | 6.0.0 / 11.0.0 |

### 8.14 Deliberately not used

| Package / approach | Why not |
|---|---|
| `dio`, `retrofit` (team baseline networking) | No server. |
| `shared_preferences` | Settings live in the DB (transactional, backed up). |
| `isar`, `hive` | Abandoned upstream. |
| `hive_ce`, `sembast`, `objectbox` | Workable, but weaker than SQL for date-range aggregates and migrations; objectbox has a major version in preview. |
| `sqflite` | Fine, but no reactive queries or generated migrations — more hand-written code. |
| `sqlite3_flutter_libs`, `sqlcipher_flutter_libs` | End-of-life; drift/sqlite3 3.x bundles SQLite via build hooks. |
| Syncfusion charts/calendar | Commercial community license with revenue/company limits. |
| `graphic`, `community_charts_flutter` | Steeper API / unmaintained. |
| `kalender`, `calendar_view` | Pre-1.0 churn / hard to customize for Plan \| Actual lanes. |
| `google_fonts` (runtime fetching), `PdfGoogleFonts` | Needs network. |
| `custom_lint`, `golden_toolkit` | Archived / discontinued. |
| `flex_color_scheme`, `dynamic_color` | A hand-built `ColorScheme` from the Warm Focus tokens (§12.2) + our tonal label palette is enough. |
| `permission_handler` | flutter_local_notifications already checks/requests notification and exact-alarm permissions. Add only if another permission appears. |
| Firebase (any) | No cloud by design. |
| Riverpod | Strong alternative, but D-03 keeps your team's Bloc conventions. |

---

## 9. Platform-specific considerations

### 9.1 iOS

| Topic | What to do |
|---|---|
| **Minimum version** | iOS 15 (current Flutter minimum). |
| **App lifecycle** | Builds with the iOS 27 SDK must use the **UIScene** lifecycle or the app won't launch. Start from the current Flutter template and follow the notification plugin's UIScene setup. |
| **Notification permission** | Initialize the plugin with request flags off; ask in context (§8.6.5). Don't use provisional authorization (quiet delivery only). Re-check on resume. |
| **64 pending limit** | Hard limit per app. Planner budget ≈ 50, 7-day window, keep-alive notification (§8.6.3). |
| **Delivery** | Scheduled local notifications are delivered even after force-quit. Background tasks (`BGTaskScheduler`) give no timing guarantees — never rely on them. |
| **Focus / Scheduled Summary** | Users may hold or batch our notifications. "Time Sensitive" (needs the capability added in Xcode) can break through Focus; use it **only** for routine reminders the user marks important — optional, Later [D-43]. |
| **Files** | Import via the system document picker; export via share sheet ("Save to Files"), or the save dialog. |
| **iPad** | Pass `sharePositionOrigin` for share popovers; support Split View widths (compact ↔ regular) via the adaptive layout (§5.6). |
| **Privacy manifest** | App-level `PrivacyInfo.xcprivacy` declaring required-reason APIs used; "Data Not Collected". |
| **Data protection** | Keep the default file protection (accessible after first unlock) so future background actions can open the DB while the phone is locked. |
| **Dependency manager** | CocoaPods is in maintenance mode; Flutter is moving to Swift Package Manager, and some plugins are SwiftPM-only. Use current Flutter defaults. |
| **Signing & installs** | A free Apple ID can install on your own device, but the app **expires every 7 days**. A paid Apple Developer membership enables TestFlight and long-lived installs [D-02]. |
| **Text** | Map Dynamic Type through Flutter's text scaling (§12.7). |

### 9.2 Android

| Topic | What to do |
|---|---|
| **SDK levels** | minSdk 24 (Flutter and plugin minimum); **targetSdk 36** (Play requirement for new apps/updates since 31 Aug 2026); compileSdk per plugin requirements (36 today; some plugins are moving to 37). |
| **Build** | Core library desugaring enabled (required by the notifications plugin), Java 17, AGP/Gradle/Kotlin versions as required by current plugins (e.g. share_plus needs AGP ≥ 8.12.1, Gradle ≥ 8.13, Kotlin 2.2). Keep notification icon resources from being stripped by R8 (`keep.xml`). |
| **Native libraries** | Make sure release builds meet Play's 16 KB memory-page-size requirement for native libraries (SQLite comes in as a native library) — verify with the APK analyzer in Phase 0. |
| **Manifest** | `POST_NOTIFICATIONS`, `RECEIVE_BOOT_COMPLETED`, `USE_EXACT_ALARM` (Android 13+) plus `SCHEDULE_EXACT_ALARM` with `maxSdkVersion="32"` (Android 12) — the sideload choice from D-40; the plugin's scheduled/boot/action receivers. **No `INTERNET`** in release. No `USE_FULL_SCREEN_INTENT`, no battery-optimization exemption request. |
| **Notification permission** | Android 13+ runtime permission, asked in context. |
| **Exact alarms** | Android 14+: `SCHEDULE_EXACT_ALARM` is **denied by default** on fresh installs; user grants it in "Alarms & reminders". If revoked, the system kills the app and cancels its exact alarms → we re-plan on next open. Without it: inexact (up to ~1 h late). `USE_EXACT_ALARM` is auto-granted but Play allows it only for alarm/timer and calendar apps. **Confirmed (D-40): Planyar is a sideloaded APK, so it uses `USE_EXACT_ALARM`** — reminders are on time with no extra permission screen. If the app is ever published on Play, switch to `SCHEDULE_EXACT_ALARM` and the in-context request flow in §8.6.5. |
| **Signing & updates (sideload)** | The release APK is signed with your own **release keystore**, created in Phase 0 and stored **outside the repo** (backed up somewhere safe, e.g. a password manager plus an offline copy). Updates install over the old app only if they're signed with the **same key** and have a higher `versionCode` — then all data is kept. **If the key is lost, the only way to update is to uninstall, which deletes all data**, so always export a backup before any reinstall. `key.properties` and `*.jks` are git-ignored. |
| **Installing** | Build with `flutter build apk --release --flavor prod`, then install via USB (`adb install -r`) or by copying the APK to the phone and allowing "Install unknown apps" for your file manager once. The dev flavor installs side by side as "Planyar Dev". |
| **Doze & standby** | `*AllowWhileIdle` alarms are rate-limited in Doze; apps unused for 8+ days drop to the "restricted" bucket (≈ 1 alarm/day). Mitigated by the keep-alive notification and re-plan on open. |
| **OEM battery killers** | Samsung, Xiaomi, Huawei, OnePlus can stop alarms. Troubleshooting screen with guidance (§8.6.7). |
| **Force stop** | On Android 15+, force-stopping cancels the app's pending alarms; they come back when the app is opened again. Mention it in troubleshooting. |
| **Channels** | Routines, Tasks, Check-ins & summaries, Backups. Create once at startup; users control sound/importance afterwards; never churn channel IDs. |
| **Files** | System pickers / Storage Access Framework — no storage permissions. |
| **Backup** | Android Auto Backup with `dataExtractionRules` (include DB; exclude `safety/` and temp) [D-24]. |
| **UI** | Edge-to-edge is enforced when targeting recent SDKs — handle insets with `SafeArea`/padding. Support predictive back. Provide a monochrome adaptive icon layer for themed icons. |

### 9.3 Both platforms

- Phones first; tablets via adaptive layout; no foldable-specific work.
- 12/24-hour and first day of week from the device (week start overridable).
- Notification deep links are the only external entry points; no URL schemes or app links needed in v1.
- Test on at least one older, smaller device (e.g. 5.4″ / 360 dp width) and one tablet.

---

## 10. Privacy, security, offline behavior, backup, import validation, and recovery

### 10.1 Privacy stance

- **No runtime network use in v1.** No analytics, crash reporting, ads, remote config or font downloads. Fonts and icons are bundled.
- **Android:** Flutter adds the `INTERNET` permission only to debug/profile manifests. Keep it out of the release manifest, and check the merged manifest in CI (`aapt dump permissions` or the merged-manifest report) so no dependency sneaks it in. This lets the app *prove* it can't send data anywhere.
- **iOS:** App Store privacy label "Data Not Collected". Ship an app-level `PrivacyInfo.xcprivacy` declaring required-reason APIs that the app or plugins use (e.g. file timestamps, `UserDefaults`); plugin manifests cover their own usage.
- **Logging:** debug builds only. Release builds never log note text, label names or task titles. An optional on-device error log (last 200 errors, no user content) can be shared manually from About.
- **Notification content:** shows label/task names on the lock screen. A setting "Hide details on lock screen" uses generic text ("Reminder") — Later, unless you want it in MVP [D-41].

### 10.2 Data at rest

| Option | Pros | Cons |
|---|---|---|
| **A. Rely on OS protection** (recommended for v1) | iOS Data Protection and Android file-based encryption already encrypt app data at rest when the phone has a passcode. Simple. OS backups restore cleanly. | Someone with an unlocked phone (or root) can read the DB. |
| B. Encrypt the SQLite DB (SQLite3MultipleCiphers via the sqlite3 build hook, key in `flutter_secure_storage`) | Defense in depth | **Android Auto Backup restores the DB but not the Keystore key → restored DB is unreadable.** Key loss = data loss. More moving parts. |

**Recommendation [D-23]:** Option A in v1, plus optional **app lock** (Face ID / fingerprint via `local_auth`) as a Later item. If you want DB encryption, decide before Phase 1 (it affects how the DB is opened) and exclude the DB from OS backups.

### 10.3 Offline behavior

- Every feature works offline; there is no "online mode".
- **Build-time** network is needed (pub, CocoaPods/SwiftPM, and the sqlite3 package downloads its precompiled SQLite binary through a Dart build hook, verified by checksum). **Runtime** needs none.
- Sharing a file to Drive/email naturally uses the network of *that* app, not ours.

### 10.4 Backup file format (portable, versioned)

**File:** `planyar-backup-2026-10-25-1730.zip` — a standard ZIP so it can be inspected on a computer.

```
planyar-backup-2026-10-25-1730.zip
├── manifest.json     ← small, read first
└── data.json         ← all records
```

**`manifest.json`**

```json
{
  "format": "planyar-backup",
  "formatVersion": 1,
  "appVersion": "1.0.0+12",
  "dbSchemaVersion": 3,
  "createdAtUtc": "2026-10-25T14:30:00.000Z",
  "deviceTimeZone": "Asia/Baghdad",
  "platform": "android",
  "counts": { "categories": 5, "labels": 18, "entries": 4210, "routines": 3,
              "routineExceptions": 12, "taskSeries": 2, "tasks": 40, "taskReminders": 31 },
  "dataFile": "data.json",
  "dataSha256": "9f2c…",
  "encryption": "none"
}
```

**`data.json`** — one top-level object with an array per entity, plus settings:

```json
{
  "categories": [ { "id": "…", "name": "Learning", "colorKey": "indigo", "sortOrder": 0,
                    "createdAtUtc": "…", "updatedAtUtc": "…" } ],
  "labels": [ … ],
  "entries": [ { "id": "…", "kind": "actual", "labelId": "…", "startUtc": "2026-10-24T20:10:00.000Z",
                 "endUtc": "2026-10-25T03:50:00.000Z", "tzId": "Asia/Baghdad", "utcOffsetMin": 180,
                 "note": null, "taskId": null, "source": "manual", "routineId": null,
                 "occurrenceDate": null, "plannedEntryId": null, "createdAtUtc": "…", "updatedAtUtc": "…" } ],
  "routines": [ … ], "routineExceptions": [ … ],
  "taskSeries": [ … ], "tasks": [ … ], "taskReminders": [ … ],
  "settings": { "themeMode": "system", "firstDayOfWeek": 5, "quietHours": { "enabled": true, "startMin": 1350, "endMin": 420 }, … }
}
```

Rules:
- **Instants** as ISO-8601 UTC strings with `Z` (human-readable and unambiguous); local dates as `YYYY-MM-DD`; wall-clock times as integer minutes.
- **Field names are camelCase and independent of DB column names** (backup DTOs are their own layer, §7.5).
- **Versioning:** `formatVersion` is an integer. Adding optional fields does **not** bump it (old apps ignore unknown fields; new apps default missing ones). Renaming/removing fields or changing meaning **does** bump it, with a pure migration function `vN → vN+1` kept forever.
- The app **imports any formatVersion ≤ its own**, and rejects higher ones.
- **Included settings (portable):** theme, first day of week, timeline mode, quiet hours, check-in on/time, weekly review on/time, backup reminder on, default reminder presets, report preferences.
- **Excluded (device-only):** scheduled notification bookkeeping, `generatedThrough`, `lastKnownTimeZone`, permission-prompt state, onboarding-completed flag, last export date, safety backups, UI scroll/selection state.
- **Also included:** routine occurrence rows, so plan history and "Log as actual" links survive (future ones could be regenerated, but keeping them makes the backup a faithful snapshot).

### 10.5 Export process

1. Read everything inside **one read transaction** (consistent snapshot even if a notification handler writes concurrently).
2. Serialize to JSON in a **background isolate** (`Isolate.run`) to keep the UI smooth.
3. Compute SHA-256 of `data.json`, write manifest, zip into the temp directory.
4. Open the share sheet (Save to Files / Drive / email…). On Android also offer **Save to device** via the system file-save dialog (§8.11).
5. Record `lastExportAt`. Delete the temp file when sharing completes.
6. Target: 10,000 entries export in < 2 s on a mid-range phone.

### 10.6 Import pipeline (treat every file as untrusted)

| Stage | Checks | On failure |
|---|---|---|
| 1. **File** | Size ≤ 200 MB; ZIP magic bytes; only `manifest.json` and `data.json` are read (ignore everything else; never extract to disk by path → no zip-slip); uncompressed size ≤ 500 MB and compression ratio sanity check (zip-bomb guard). One accepted format only (no bare JSON files). | "Not a Planyar backup or damaged." Nothing changed. |
| 2. **Manifest** | `format` matches; `formatVersion` ≤ supported; `dataSha256` matches. | Wrong format / newer version / corrupted messages. |
| 3. **Upgrade** | Run `v1→v2→…` migrations on the parsed JSON (pure, tested with frozen fixture files). | Treated as damaged. |
| 4. **Record validation** | Types, required fields, enums, string lengths, UUID format, ISO dates, `end > start`, ≤ 7 days, minute alignment (round if not), color/icon keys known (unknown → fallback key), status/`completedAt` consistency. | Record marked **invalid** with reason; others continue. |
| 5. **Integrity** | References resolve (within the file, or within the DB when merging); unique keys (label names, routine+date, one open instance per series); no duplicate IDs inside the file. | Repair if safe (see below) or mark invalid. |
| 6. **Preview** | Diff against the current DB for **both** modes: per entity — new / will overwrite / identical / invalid. Warnings: "312 local records are newer than the imported versions and will be overwritten"; "2 labels matched by name". | — |
| 7. **Choose & confirm** | Replace or Merge (§10.7), with the counts shown. Replace requires an extra confirmation. | User can cancel; nothing changed. |
| 8. **Safety backup** | Full export of current data to the safety folder. | If this fails, **abort the import**. |
| 9. **Apply** | One write transaction; FK checks deferred until commit; insert in dependency order (categories → labels → task series → tasks → task reminders → routines → exceptions → entries → settings). | Transaction rolls back; DB unchanged; error shown with "Your data was not changed". |
| 10. **Post-process** | `PRAGMA foreign_key_check` and `integrity_check`; regenerate routine occurrences for unstarted dates; resync notifications; update `lastKnownTimeZone`. | Re-run automatically on next start (idempotent). |
| 11. **Result** | Summary screen; import log kept (last 5) in Backup & restore. | — |

**Safe repairs** (always listed in the preview): unknown color key → `gray`; unknown icon → none; entry with a missing label → attached to a placeholder label "Imported – unknown label" (archived), rather than dropped; task with `completed` but no `completedAt` → `completedAt = updatedAt`.

### 10.7 Replace vs Merge

**Replace:** delete all user data, insert everything from the file, apply imported portable settings. Device-only settings are kept.

**Merge** — "imported wins" for matching identities:

| Situation | Rule |
|---|---|
| Same `id` exists | **Overwrite** local record with imported values (even if local `updatedAt` is newer — preview warns). |
| New `id`, no natural-key clash | Insert. |
| Label/category: new `id` but same `name_key` as an existing one | **Match by name**: remap imported references to the existing ID, and overwrite its fields (color, icon, category) with imported values [D-25]. |
| Routine occurrence: different `id`, same `(routineId, occurrenceDate)` | Imported row replaces the local one; local actual entries linked to the old row are re-pointed. |
| Routine exception: same `(routineId, occurrenceDate)` | Imported wins. |
| Entry: different `id` but **exact duplicate** (kind, label after remap, start, end, note) | **Skip** as duplicate (counted in preview) [D-27]. |
| Same task series has a different open instance locally and in the file | Keep both without deleting anything: the imported instance stays in the series; the local one is detached into a standalone (non-repeating) task, so the "one open instance per series" rule holds. Shown in the preview. |
| Settings | **Keep local** by default; checkbox "Also import settings" [D-26]. |
| Local records not in the file | **Kept** (merge never deletes). |

### 10.8 Safety backups and recovery

- **Created automatically** before: any import, erase-all, and DB schema migrations (migration copies the raw `.sqlite` file; the others use the normal backup format).
- **Stored** in the app's support directory `safety/`, **last 5 kept** (oldest pruned), listed in Backup & restore with date and reason, each restorable (= a Replace import of that file) or shareable.
- They're **deleted if the app is uninstalled**, so they protect against bad imports and bugs — not against losing the phone. The backup reminder (NTF-05) covers that.
- **Startup failure** (DB can't open, migration error, integrity check fails): show the Recovery screen (S28) with: Retry · Restore latest safety backup · Export raw database file · Import a backup. Never auto-delete the DB.

### 10.9 OS-level backups

- iCloud device backup (iOS) and Android Auto Backup include app data by default, which gives you a free extra safety net when moving phones.
- **Recommendation [D-24]:** allow it. Configure Android `dataExtractionRules` to include the database, exclude `safety/` and temp files. After an OS restore, the first launch resyncs notifications (they aren't restored).
- If you prefer data never touches Google/Apple cloud backups, disable it (`allowBackup=false`; iOS exclude-from-backup attribute) and rely only on manual exports.

### 10.10 Threats and mitigations (lightweight)

| Threat | Mitigation |
|---|---|
| Malformed or malicious import file | §10.6 pipeline: size/ratio caps, no path extraction, strict parsing, single transaction. |
| CSV opened in a spreadsheet runs a formula | Prefix cells starting with `=`, `+`, `-`, `@`, tab or CR with `'` (§8.9). |
| Backup file shared by mistake | Plain JSON is readable — the export sheet says so; password protection is Later [BAK-07]. |
| Bug corrupts data | Constraints in DB, transactions, integrity checks, safety backups, tested migrations. |
| Unlocked phone in someone else's hands | Optional app lock (Later). |

---


---

## 11. Testing strategy

### 11.1 Shape of the test suite

| Level | What | Tools | Target |
|---|---|---|---|
| **Unit (domain)** | All pure engines (§8.3) | `test`, `clock`, `fake_async` | ≥ 90% line coverage for engines; every bug gets a regression test |
| **Repository / DB** | DAOs, mappers, transactions, constraints, migrations | Drift `NativeDatabase.memory()`, drift generated migration tests | Every table and every migration |
| **Bloc** | State transitions, side-effect triggers | `bloc_test`, `mocktail` | Every Bloc's main paths and error paths |
| **Widget** | Components and pages with fakes | `flutter_test` | Key flows and all empty/loading/error states |
| **Golden** | Timeline, blocks, charts, task rows | `alchemist` (or `matchesGoldenFile` helper — see note) | Light/dark × text scale 1.0/2.0 |
| **Integration / E2E** | Journeys on emulators/simulators, native permission dialogs, notification taps | `integration_test` (SDK) + `patrol` | J1, J6, J7, J15, J18 + notification deep link |
| **Manual device matrix** | Notification delivery, battery/Doze, reboot, OEMs | Checklist (§11.7) | Each release |

**Golden-test note:** `alchemist`'s config takes the SDK's `ThemeData` type, which may not match `material_ui`'s `ThemeData`. Check this in the Phase 0 spike. If it doesn't compile, use a small in-house helper around `matchesGoldenFile` instead (render the widget under both themes and text scales). Run goldens on one fixed CI platform (fonts render slightly differently across OSes).

### 11.2 Unit tests per engine (minimum cases)

- **DayMath:** day bounds for normal, 23 h, 25 h days and a day whose midnight doesn't exist (America/Santiago-style DST at 00:00); `local(D, m)` for m in the DST gap (moves forward) and the repeated hour (first instance); minutes ≥ 1440 (next day); clipping and splitting an entry across 0, 1, 2 and 7 midnights; end exactly at midnight.
- **OverlapDetector:** none; touching; nested; chain of three; identical; open entries ignored; planned vs actual ignored; column assignment stable (same input → same columns).
- **IntervalUnion:** disjoint, overlapping, contained, many small; result never exceeds range length.
- **OccurrencePlanner/Reconciler:** create range; idempotency (run 5× → no change); skip and modify exceptions; exception moving start past midnight; template edit affects only unstarted; frozen rows untouched; linked rows untouched; pause/resume; ends-on; backfill after 10 days closed; time-zone change re-anchors only unstarted; **assert no actual row is ever in the write set**.
- **TaskRecurrence:** daily/weekly/monthly/yearly; interval > 1; monthly on 31st (Feb clamp, no drift); 29 Feb yearly; completing early, on time, late (missed periods skipped); after-completion mode; ends-on reached; undo.
- **ReportAggregator:** fixtures with hand-computed expected totals: overnight entries clipped; overlapping entries (union vs per-label sums); open entries excluded and counted; planned vs actual per label; category via override vs label; bucket choice (day/week/month) by range length; week starting Saturday/Sunday/Monday; empty range.
- **NotificationPlanner:** window and budget cap (soonest first); quiet hours (drop vs defer vs allow); reminders in the past never scheduled; check-in only when useful; stable keys; exception skip removes that day's routine reminder; completed tasks have none; DST-day reminder times.
- **CsvReportWriter:** BOM, CRLF, quoting of commas/quotes/newlines, formula-injection prefix, non-ASCII (Kurdish/Arabic text) round-trip.
- **BackupCodec/ImportValidator/ImportMerger:** see §11.4.

### 11.3 Date/time edge cases and the time-zone matrix

Dart's local time follows the process `TZ` variable on macOS/Linux, so CI runs the domain and repository suites several times:

| `TZ` | Why |
|---|---|
| `UTC` | Baseline |
| `Asia/Baghdad` | Your zone (+03:00, no DST) |
| `America/New_York` | DST at 02:00 |
| `Europe/London` | DST at 01:00, offset 0/+1 |
| `America/Santiago` | DST transition at midnight (a day can start at 01:00) |
| `Australia/Lord_Howe` | 30-minute DST shift |
| `Asia/Kathmandu` | +05:45 offset |

Plus fixed-clock tests (`withClock`) for: just before/after midnight, the DST transition minute, 31 Dec → 1 Jan, 28/29 Feb, and a zone change between two runs.

### 11.4 Backup, export and import tests

- **Round trip:** seeded DB → export → Replace import into empty DB → export again → `data.json` byte-identical (after canonical ordering).
- **Format fixtures:** commit a real backup file for **every** `formatVersion` ever released to `test/fixtures/backups/vN/`. They must import successfully forever.
- **Malformed files (≥ 20 cases):** empty file; not a zip; zip without manifest; wrong `format`; future `formatVersion`; checksum mismatch; truncated JSON; wrong types; missing required fields; invalid enum; bad UUID; end before start; 8-day entry; dangling references; duplicate IDs; label name clash inside the file; huge strings; invalid UTF-8; zip-bomb ratio; entry names with `../`.
  Each asserts: correct user-facing message **and DB unchanged**.
- **Merge scenarios:** same ID newer locally (overwritten + warning); same name different ID (remap); duplicate entries (skipped); occurrence key clash (replaced, links re-pointed); settings kept by default.
- **Failure injection:** throw in the middle of apply → transaction rolled back, safety backup present.
- **Performance:** import 20k entries < 5 s on a mid-range Android device (manual benchmark recorded per release).

### 11.5 Widget and golden tests

- Timeline: overnight start/end segments; 3-way overlap columns; open entry tail; 5-minute entry hit area; 25-hour DST day labels; now-line; split vs combined lanes.
- Quick add: defaults (gap after last entry), kind auto-switch for future start, overlap note appears and doesn't block, "No end yet".
- Label picker: create inline; case-insensitive match; archived label restore prompt.
- To finish: End now / +1h / delete with undo.
- Occurrence sheet: this-day-only, skip, reset.
- Tasks: groups and overdue chip; recurrence on complete with undo snackbar.
- Charts: each chart's empty, one-item and many-items (Other bucket) states; "View as table".
- Accessibility guideline matchers (`androidTapTargetGuideline`, `iOSTapTargetGuideline`, `labeledTapTargetGuideline`, `textContrastGuideline`) on every page test.

### 11.6 Integration / end-to-end (patrol)

Run on Android emulator (API 34 and latest) and iOS simulator:
- J1 quick log; J6 routine creates occurrences; J7 one-day exception; J15 export → erase → import.
- J18 notification permission: grant and deny paths using patrol's native permission-dialog helpers.
- Notification deep link: schedule a near-term test notification (dev flavor debug menu), wait, tap it from the shade, assert the right screen opens — both warm and cold start.

### 11.7 Notification test matrix (manual, per release)

| Scenario | Android (Pixel, latest) | Android (Samsung) | Android (Xiaomi/other OEM) | iPhone (current iOS) |
|---|---|---|---|---|
| Reminder fires with app in background | | | | |
| Reminder fires after app swiped away / force-quit | | | | |
| Reminder fires after device reboot (before opening app) | | | | |
| Reminder in Doze (`adb shell dumpsys deviceidle force-idle`) | | | n/a | n/a |
| Exact-alarm permission revoked → inexact still fires | | | | n/a |
| Notifications permission revoked → app shows fix banner | | | | |
| Time-zone change → reminders at new local times | | | | |
| Quiet hours drop/defer behavior | | | | |
| Many reminders (budget cap) → nearest ones scheduled, horizon shown | | | | |
| Tap from cold start opens right screen | | | | |

Developer aids in the **dev flavor only**: a debug screen listing pending notifications (from the plugin) next to the planner's desired list, with "fire test in 1 min".

### 11.8 CI pipeline

1. `flutter pub get` → `dart run build_runner build --delete-conflicting-outputs` (fail if generated files differ from committed).
2. `dart format --set-exit-if-changed` and `flutter analyze` (zero warnings).
3. `flutter test` (all), then domain + repository suites again under each `TZ` in §11.3.
4. Drift migration tests; backup fixture tests.
5. Golden tests (fixed platform).
6. Release builds for both flavors; check Android merged manifest has no `INTERNET` permission.
7. Nightly or pre-release: patrol journeys on emulators.

---

## 12. Accessibility and visual design direction

### 12.1 Personality

**Calm, quick, clear — "Warm Focus".** Think *a well-made paper planner*: warm ivory and charcoal surfaces, generous spacing, one golden accent for the app, and label colors that carry meaning. No gradients, no heavy shadows, no dense toolbars. The busiest thing on screen should be the user's own day.

### 12.2 Color system

- **App theme — "Warm Focus"** [D-42]: golden accents over calm warm-neutral backgrounds, with dark charcoal for clarity. The Material 3 `ColorScheme` is built by hand from these tokens (not `fromSeed`), so the exact values below are what ships:

| Token | Light | Dark | Used for |
|---|---|---|---|
| Accent (gold) | `#D99A22` | `#D99A22` | Filled buttons, FAB, selected dates/chips, switches, progress, highlights. **Never a large background.** |
| On accent | `#292720` | `#211F1A` | Text/icons on gold (6.1:1 light, 6.7:1 dark). **Never white on gold** (2.4:1 — fails). |
| Gold ink | `#8A5D00` | `#D99A22` | Gold-coloured *text and icons* on surfaces (text buttons, links, focused field, today marker). Light mode needs this darker tone: plain gold on ivory is only 2.3:1. |
| Soft highlight | `#F3D77A` | `#5A4310` | Accent containers (selected rows, tonal buttons, nav indicator). Text on it: `#292720` light (10.5:1) / `#F3D77A` dark (6.6:1). |
| Background | `#FAF7EF` warm ivory | `#211F1A` warm charcoal | Scaffold / page background. |
| Cards & sheets | `#FFFFFF` | `#2D2A23` | Cards, sheets, dialogs, timeline lanes. |
| Main text | `#292720` | `#F3F0E8` | Body text, titles (14.0:1 / 14.5:1 on background). |
| Secondary text | `#706B5F` | `#BDB7A9` | Captions, times, hints (5.0:1 / 8.2:1). |
| Outline | `#8C8576` | `#9A9384` | Input borders, outlined chips (≥ 3:1). Dividers use a lighter, decorative tone. |
| Warning | `#A8470F` on `#FCE6D8` | `#FFB083` on `#5C2A0E` | Overlaps, long entries. **Burnt orange**, kept clearly apart from the gold accent, and always with ⚠ icon + text. |
| Error / destructive | `#B3261E` | `#F2B8B5` | Delete actions, overdue tasks, validation errors. |

  Contrast values were computed with the WCAG 2.x formula; a unit test checks every text/background pair above stays ≥ 4.5:1 (≥ 3:1 for outlines and icons).
- **Theme modes:** System (default) / Light / Dark (SET-01). Both themes ship from day one.
- **Label palette:** 16 named hues — gray, brown, red, rose, orange, amber, yellow, lime, green, teal, cyan, sky, blue, indigo, violet, pink — tuned to sit calmly next to the warm neutrals (moderate chroma, no neon). Each key maps to a seed; the app derives a tonal palette per hue with `ColorScheme.fromSeed` (tonal-spot variant, no extra package):

| Use | Light theme | Dark theme |
|---|---|---|
| Actual block fill | tone 90 | tone 30 |
| Text/icon on block | tone 10 | tone 90 |
| Accent edge / planned outline | tone 40 | tone 80 |
| Planned block fill | tone 95–98 (very light tint) | tone 20 |

  A tone difference of ≥ 50 between text and fill meets WCAG AA 4.5:1 for text, and ≥ 40 meets 3:1 for graphics — so *any* palette color stays readable in both themes. The palette is tested in a golden test (§11).
- **Reserved semantic colors:** gold = the app's accent (actions, selection); burnt orange = warning (overlaps, long entries); red/error = destructive actions and overdue tasks; green tint = completed. Label colors (including the `amber`, `yellow` and `orange` keys) may look similar to these, so warnings and errors always come with an icon and text, never color alone.
- **Optional:** dynamic color (Material You wallpaper colors) for app chrome only — Later, off by default, because the label palette is the primary visual language.

### 12.3 Visual vocabulary

| Thing | Shape & fill | Border | Icon / text | Screen-reader label |
|---|---|---|---|---|
| **Actual entry** | Solid tinted block | Strong 3 dp left edge in accent tone | Label icon + name, time | "Actual. Study. 14:00 to 16:00. 2 hours." |
| **Planned entry** | Very light tint | 1.5 dp **dashed** outline in accent tone | Same text in accent tone | "Planned. Study. …" |
| **Routine occurrence** | As planned | dashed | + ↻ repeat icon | "Planned from routine Sleep. …" |
| **Changed for one day** | As planned | dashed | ↻ + ✎ small icons | "…changed for this day only." |
| **Plan logged as actual** | Planned look, 60% opacity | dashed | ✓ | "…logged." |
| **Open entry** | Actual look, fading tail | dashed bottom edge | "No end" pill + **Set end** button | "Actual. Study. Started 14:05. No end time." |
| **Overlap** | Side-by-side columns | — | ⚠ on each block; header chip | "…overlaps with Work." |
| **Overnight segment** | Clipped block | — | "continues ↓" / "↑ from Sat 23:10" | "…continues to Sunday 07:00." |
| **Long-term task** (Tasks area only) | Card / list row | — | Status ring ○ ◔ ● , ⚑ for High, deadline chip | "Task. Renew passport. In progress. Due Saturday 31 October." |
| **Task chip on an entry** | Small outlined chip | — | 📌 + task title | "Linked to task Thesis." |
| **Overdue task** | Row with error-tinted deadline chip | — | "Overdue · 5 days" + icon | "Overdue by 5 days." |

Planned vs actual is distinguished by **three** independent cues (lane, fill/outline style, text/semantics) — never by color alone.

### 12.4 Typography and formatting

- **Platform fonts** (SF Pro on iOS, Roboto on Android) through the Material 3 type scale — native feel, no font download, no extra bytes [D-31].
- **Tabular figures** for all times and durations so columns line up.
- Times follow the device 12/24 h setting; durations as "2 h 05 m" (compact "2h 5m" in tight spaces); dates "Sun 25 Oct" (localized by `intl`).

### 12.5 Layout, shape, motion

- 4 dp spacing grid, 16 dp side gutters on phones, 24 dp on tablets.
- Corner radius: 16 dp cards/sheets, 8 dp timeline blocks, full-round chips.
- Elevation through tonal surfaces, not shadows.
- Motion 150–250 ms, standard easing; sheets slide, blocks fade/resize. Respect "reduce motion" (`MediaQuery.disableAnimations`).
- Light haptic on save and on completing a task (Later toggle to disable).

### 12.6 Light and dark themes

Both from day one (they cost little with M3 and the tonal palette approach). Default: follow system. All goldens rendered in both.

### 12.7 Accessibility basics (checklist)

- **Text size:** support system text scaling up to 200%. The timeline increases hour height with text scale; blocks too short to show text show only the color edge and remain tappable; at ≥ 150% text scale, suggest **List mode** (which is the fully accessible alternative to the timeline).
- **Contrast:** WCAG 2.2 AA — 4.5:1 for text, 3:1 for icons, outlines and chart marks (§12.2).
- **Touch targets:** ≥ 48 × 48 dp (≥ 44 pt iOS). Short timeline blocks (e.g. 10 min) get an expanded hit area; chips and ± buttons meet the minimum.
- **Screen readers:** every block, chip, chart and icon button has a `Semantics` label (§12.3). The day header reads as a summary. Overlap warnings are announced when they appear in the editor (live region).
- **Charts:** every chart has a text summary ("Most time: Work, 32 hours, 41%") and a **View as table** toggle.
- **Not color alone:** kind, status, warnings and overdue always have an icon or text.
- **Focus & order:** logical traversal order in forms; the save button is reachable; dialogs trap focus.
- **Timeouts:** Undo snackbars last 5 s, extended to 10 s when a screen reader is active.
- **Bold text / high contrast** settings respected where Flutter exposes them.
- **RTL readiness:** use directional padding/alignment everywhere so Arabic/Kurdish can be added later [D-28].
- Automated checks in widget tests: Flutter's `androidTapTargetGuideline`, `iOSTapTargetGuideline`, `labeledTapTargetGuideline`, `textContrastGuideline`.

### 12.8 Empty states and microcopy (tone)

Short, friendly, practical. Examples:
- Empty day: "Nothing logged yet. Tap + or tap the timeline to add what you did."
- No routines: "Routines fill your plan automatically — like sleep from 23:00 to 07:00."
- Reports without plan data: "Add a routine or planned entries to compare plan and reality."
- Overlap note: "Overlaps with Work 14:00–17:00. That's OK — saving anyway."

---

## 13. Phased implementation roadmap

Sizes are rough for one developer working with Claude: **S** ≈ 3–5 focused days, **M** ≈ 1–2 weeks, **L** ≈ 2–3 weeks. Order is chosen so you can **start using the app for real after Phase 2**, with backups already working.

```
P0 Foundation ─► P1 Entries & Today ─► P2 Backup & import ─► P3 Routines & calendar
                                                          └► P4 Reports & CSV ─► P5 Tasks ─► P6 Notifications ─► P7 PDF, polish, release
(P0 includes a notification spike to de-risk P6 early)
```

### Phase 0 — Decisions and foundation (M)
- **Goal:** a running, empty app with the architecture, tooling and safety rails in place.
- **Scope:** confirm §15 decisions; upgrade Flutter to current 3.47.x; create the project (`com.muhammadyaseen.planyar`, dev/prod flavors with separate app IDs so the dev build never touches real data); feature-first structure (§8.2); `material_ui` setup; theme (light/dark, label palette); GoRouter shell with 4 tabs + Settings; GetIt DI; Drift `AppDatabase` v1 with all tables from §7; migration harness + schema snapshot; `clock`, `LocalDate`/`WallTime` types and the `DayMath` helper with tests; l10n (English ARB); lints; CI (analyze, format check, tests, TZ matrix §11.3, check that generated code is up to date). **Material spike:** confirm every dependency compiles with `material_ui` (§8.1), including golden-test tooling and `PdfPreview`. **Notification spike:** schedule one test reminder on a real iPhone and Android phone in the dev flavor, including permission flows.
- **Depends on:** §15 answers (at least D-02, D-03, D-23).
- **Definition of done:** dev and prod run on iOS and Android; CI green; DB opens with schema v1 and a migration test exists; `DayMath` tests pass in ≥ 5 time zones; the spike's findings are written into `docs/decisions.md`.

### Phase 1 — Entries, labels and Today (L)
- **Goal:** log and view time comfortably.
- **Scope:** ENT-01…ENT-12, LBL-01…LBL-06, CAT-01…CAT-05, VIEW-01…VIEW-05, VIEW-07; To finish (S11); onboarding steps 1–2; overlap detection; overnight rendering; Undo.
- **Depends on:** P0.
- **Definition of done:** journeys J1–J5 and J20 pass as widget/integration tests; timeline goldens (overnight, overlap, open entry, DST day) in light/dark at 1.0× and 2.0× text; 5,000 seeded entries scroll at 60 fps on a mid-range Android device.

### Phase 2 — Full backup, export and import (M)
- **Goal:** data safety before daily use.
- **Scope:** BAK-01…BAK-06 for the entities that exist so far (format v1 already includes all entity arrays, empty where unused); safety backups; recovery screen; erase all data.
- **Depends on:** P1.
- **Definition of done:** J15–J17 pass; round-trip test (export → replace import → export) gives identical `data.json`; fuzz suite of ≥ 20 malformed files leaves the DB unchanged; a 10k-entry backup imports in < 5 s.

### Phase 3 — Routines and month calendar (L)
- **Goal:** the plan fills itself; navigate any date.
- **Scope:** RTN-01…RTN-07, ENT-09 (log as actual), occurrence sheet & exceptions, generator + reconciler, `ensureOccurrences`, time-zone change handling (§6.5), month calendar VIEW-06, tablet two-pane VIEW-08 (basic), onboarding step 3.
- **Depends on:** P1; P2 (backup must cover routines — extend tests).
- **Definition of done:** J6–J9 and J19 pass; property-style tests show the generator is idempotent (run N times → same rows) across DST and zone-change fixtures; no actual entry is ever modified by the generator (asserted in tests).

### Phase 4 — Reports and CSV (M)
- **Goal:** understand where time goes.
- **Scope:** RPT-01…RPT-09, RPT-11 (without tasks section); chart components; CSV export.
- **Depends on:** P1, P3 (for planned vs actual).
- **Definition of done:** J14 passes; aggregation tests with hand-computed fixtures (overnight, overlaps, open entries, DST) match exactly; CSV opens correctly in Excel (Windows/Mac) and Google Sheets with non-ASCII labels; month report for 3 years of data computes in < 300 ms.

### Phase 5 — Long-term tasks (L)
- **Goal:** lightweight task tracking linked to time.
- **Scope:** TSK-01…TSK-12; task calendar; task section in reports (RPT-07); backup coverage for tasks.
- **Depends on:** P1 (linking), P4 (report section), P2 (backup).
- **Definition of done:** J10–J12 pass; recurrence tests cover month-end clamping, leap years, missed periods, after-completion mode, undo; import/export round-trip includes tasks.

### Phase 6 — Notifications (M)
- **Goal:** reliable, gentle reminders.
- **Scope:** NTF-01…NTF-10; notification planner and sync service; permission flows; quiet hours; deep links; troubleshooting section.
- **Depends on:** P3 (routines), P5 (tasks), P0 spike.
- **Definition of done:** J13 and J18 pass; planner unit tests (window, budget, quiet hours, IDs stable); manual device matrix (§11.6) completed and recorded; no duplicate notifications after 10 app restarts and a reboot.

### Phase 7 — PDF, polish, accessibility, release (M)
- **Goal:** v1.0 quality.
- **Scope:** RPT-10 (PDF), accessibility audit and fixes (§12.7), tablet layout polish, empty states, app icon & splash, performance pass, signed release APK (prod flavor, your release keystore) installed on your phone, iOS build kept compiling, final docs.
- **Depends on:** all previous.
- **Definition of done:** accessibility checklist passes with TalkBack and VoiceOver on real devices; all journeys J1–J20 pass; zero analyzer warnings; release builds of both platforms installed and used for one full week without data issues.

### Working with Claude on this plan

- Keep this file at `docs/PROJECT_PLAN.md` and add a short `CLAUDE.md` that points to it, repeats the **glossary** and the **non-negotiable rules** (actual entries are never modified by automation; instants in UTC; all time math in `DayMath`; no new packages without asking).
- Work **one phase per branch**, and inside a phase prompt by requirement IDs: "Implement RTN-03 with the reconciler from §6.7; tests first."
- For domain logic (DayMath, generator, recurrence, reports, import validation, notification planner), ask for **tests first**, then the implementation.
- Keep `docs/decisions.md` updated whenever a §15 decision is confirmed or changed.
- After each task, ask Claude to run `dart run build_runner build --delete-conflicting-outputs`, `flutter analyze` and `flutter test`, and to report anything it couldn't run.

---

## 14. Risks and mitigations

| # | Risk | Likelihood | Impact | Mitigation |
|---|---|---|---|---|
| R1 | **Notifications arrive late or not at all** (Doze, OEM battery killers, exact-alarm denial, iOS 64-pending limit, app not opened for weeks) | High | High | Rolling-window planner with budget; resync on every open; inexact fallback with explanation; troubleshooting screen with OEM battery tips; "scheduled through" date; early spike in P0; device test matrix. |
| R2 | **Time bugs** (DST, midnight, zone change) | Medium | High | Three explicit time types; single `DayMath` helper; TZ-matrix CI; fixture tests for DST days. |
| R3 | **Data loss** from a bad migration or import | Low | Very high | Transactions, safety backups, generated migration tests, recovery screen, backup reminder, round-trip tests. |
| R4 | **Routine generator duplicates or overwrites** | Medium | High | Unique index, idempotent pure planner + reconciler, frozen rule, tests asserting actual rows untouched. |
| R5 | **Scope creep** into project management | High | Medium | Non-goals list; Later list; every new idea goes to §16 first. |
| R6 | **Timeline complexity** (overlap columns, overnight segments, text scaling) takes longer than expected | Medium | Medium | Build List mode first (simpler, accessible), then timeline; custom layout with goldens. |
| R7 | **Platform churn** — Material moving to `material_ui`, freezed 4 / Dart 3.13, iOS UIScene requirement, Android target-SDK bumps | Medium | Medium | Start on current stable and `material_ui`; pin versions; upgrade at phase boundaries only; read breaking-change notes each phase. |
| R8 | **Package abandonment** | Low–Medium | Medium | Prefer flutter.dev / verified publishers; wrap plugins behind interfaces (notifications, files, share) so they can be swapped. |
| R9 | **Bloc boilerplate slows development** | Medium | Low | Accept it for consistency with your team skills; use shared base patterns; Claude handles boilerplate well. (Alternative: D-03.) |
| R10 | **Reports double-count** overlapping time | Medium | Medium | Union for totals, per-label sums documented with footnote; tests. |
| R11 | **Personal-install friction on iOS** (free provisioning expires every 7 days) | Deferred — Android-only for now (D-02) | Low | Keep iOS buildable; decide on a paid Apple account if iOS is ever needed. |
| R12 | **Too many notifications** annoy the user | Medium | Medium | Off-by-default for routines; quiet hours; check-in only when useful; per-type switches. |
| R13 | **Backup file never made** before phone loss | Medium | High | Monthly backup reminder; "last export" shown; OS backups allowed (D-24). |
| R14 | **Release signing key lost** → updates impossible without uninstalling (data wiped) | Low | Very high | Create the keystore once in Phase 0, store outside the repo with two backups; never commit it; export a backup before any reinstall (§9.2). |

---

## 15. Open questions and assumptions for your approval

> **Confirmed on 2026-10-25.** You approved the recommended default for every decision ("use whatever you prefer"), with these specific answers: **D-01** name *Planyar*; **D-02** sideloaded APK on your Android phone; **D-09** weeks start on **Friday**; **D-23** no encryption; **D-28** English throughout. **D-40** follows from D-02 (`USE_EXACT_ALARM`). The "Recommended" column below is now the agreed behavior; `docs/decisions.md` is the running log for future changes.

### Product and distribution
| ID | Question | Agreed | Why it matters |
|---|---|---|---|
| D-01 | App name | **Planyar** — package `planyar`, Android ID `com.muhammadyaseen.planyar` | Bundle ID, icon, file names. The Android ID can never change without losing in-place updates. |
| D-02 | How will you install it? | **Sideloaded release APK on your own Android phone.** iOS kept buildable, not released | Exact-alarm permission (§9.2), signing-key care, no store work. |
| D-28 | Languages at launch | **English only**, RTL-ready layouts; Kurdish/Arabic later | Localization effort and RTL testing. |
| D-09 | First day of week | **Friday** by default (changeable in settings to any day) | Week reports ("This week" = Fri–Thu), calendar grids, weekly review reminder (Friday 09:00). |

### Entries, labels, categories
| ID | Question | Recommended | Why it matters |
|---|---|---|---|
| D-04 | Can planned entries be open (no end)? | **Yes** — same rule for both kinds | Simpler model; matches your wording. |
| D-05 | Per-entry category override | **Yes, hidden under "More"** | You listed category on entries; most entries just inherit. |
| D-06 | Changing a label's category regroups past entries | **Yes (live)** | Reports follow your current organization. |
| D-07 | Deleting an in-use category | **Allowed after choosing a destination** | Labels must stay non-deletable while in use; categories are just groups. |
| D-08 | Open entries in report totals | **Excluded, with a visible note** | Alternative: count today's open entries up to "now". |
| D-33 | Long-entry warning and maximum | **Warn > 16 h, max 7 days** | Catches typos (wrong date) and keeps queries fast. |
| D-34 | Overlap rules | **Same kind only; touching ≠ overlap; open entries excluded** | Avoids noisy warnings. |
| D-38 | Time precision | **Minutes** | Simpler UI, equality and duplicate detection. |
| D-37 | Delete confirmations | **Undo for entries; confirm dialogs for labels/routines/tasks/categories** | Speed vs safety. |

### Routines
| ID | Question | Recommended | Why it matters |
|---|---|---|---|
| D-10 | Routine edits apply to… | **Occurrences that haven't started** (past stays as it was) | Honest history for plan vs actual. |
| D-11 | How far ahead occurrences are created | **14 days + on demand when browsing (max 1 year)** | Performance vs completeness. |
| D-12 | Routine reminder default | **Off**, with a one-tap "15 min before" chip | Avoid excess notifications. |
| D-32 | Timeline default | **Split lanes (Plan \| Actual)** | Clear comparison; combined view available. |

### Tasks
| ID | Question | Recommended | Why it matters |
|---|---|---|---|
| D-13 | Repeating task behavior | **One open instance at a time; next created on completion/skip; "On schedule" default with missed periods skipped; "After completion" optional** | Prevents pile-ups of overdue copies. Alternative: every period creates an instance regardless. |
| D-14 | Repeat frequencies | **Daily, weekly, monthly, yearly + interval** | Covers most needs simply. |
| D-15 | Default reminder when a deadline is set | **"1 day before at 09:00", pre-added and removable** | Useful by default, still opt-out. |
| D-16 | Actual effort | **Linked actual time + manual adjustment** | Works whether or not you log time against tasks. |
| D-17 | Priority | **Low / Normal / High, default Normal** | Light but useful for sorting. |
| D-18 | Categories shared by labels and tasks | **Yes, one list** | One concept to learn. |
| D-39 | "Completed on" default for retrospective tasks | **Deadline if in the past, else today** | Fewer edits when back-filling. |

### Notifications
| ID | Question | Recommended | Why it matters |
|---|---|---|---|
| D-19 | Quiet hours default | **On, 22:30–07:00**, suggested from your Sleep routine if you create one; routine/task reminders can opt out per item | Calm by default. |
| D-20 | Evening check-in default | **On at 21:00, only when useful** | Main tool for finishing open entries. |
| D-21 | Weekly review reminder | **Off by default** | Not everyone wants it. |
| D-40 | Android precise timing | **`USE_EXACT_ALARM`** (auto-granted; allowed because the app is sideloaded, not on Play). Inexact fallback kept for safety | On-time reminders with no permission screen; switch to `SCHEDULE_EXACT_ALARM` if ever published on Play. |
| D-41 | Hide notification details on lock screen | **Later** (setting) | Privacy on shared screens. |
| D-43 | iOS "Time Sensitive" routine reminders (break through Focus) | **Later, opt-in per routine** | Needs an Xcode capability; Apple asks to use it sparingly. |
| D-44 | Keep-alive notification when the app hasn't been opened for ~a week | **On** whenever recurring reminders exist | Prevents reminders silently stopping (iOS 64 limit, Android standby). |

### Reports
| ID | Question | Recommended | Why it matters |
|---|---|---|---|
| D-35 | "Tracked" total | **Time covered (union), so overlaps aren't double-counted**; per-label sums footnoted | Honest totals ≤ 24 h/day. |
| D-36 | Multiple CSV tables | **One file per table; zipped when more than one** | Works with every "Save to Files" target. |

### Data, privacy, tech
| ID | Question | Recommended | Why it matters |
|---|---|---|---|
| D-03 | State management | **Bloc (with Freezed events/states), GetIt, GoRouter** — matches your installed team Flutter skills, so future Claude sessions follow the same conventions. Alternative: Riverpod 3 (less boilerplate, recommended by the package research) | Whole-app architecture; hard to change later. |
| D-22 | Backup format | **ZIP with manifest.json + data.json, integer formatVersion** | Portability and future-proofing. |
| D-23 | Encrypt the database | **No in v1; optional app lock later** | Avoids key-loss risk with OS restores. |
| D-24 | OS-level backups (iCloud/Google) | **Allowed** | Extra safety when changing phones. |
| D-25 | Merge: same label name, different ID | **Treat as the same label** (remap) | Avoids duplicate "Study" labels. |
| D-26 | Merge: settings | **Keep this device's settings unless you tick "also import settings"** | Merging is about data. |
| D-27 | Merge: exact duplicate entries with different IDs | **Skip** | Prevents double-counting after importing an overlapping backup twice. |
| D-29 | 12/24-hour | **Follow device** | Native behavior. |
| D-30 | Minimum OS | **iOS 15, Android 7.0 (API 24)** — current Flutter's minimums | Device coverage. |
| D-31 | Font | **Platform default** (SF Pro / Roboto) | Native feel; no bundled font. Alternative: bundle Inter for identical looks. |
| D-42 | App colors | **"Warm Focus"** (changed 2026-10-25 from slate-teal `#3F6E78`): golden amber accent `#D99A22`, pale yellow highlight `#F3D77A`, ivory `#FAF7EF` / charcoal `#211F1A` backgrounds — full token table in §12.2 | Visual identity; easy to change. |

---

## 16. Prioritized MVP and later enhancements

### 16.1 MVP (v1.0), in priority order

**Tier 1 — usable daily (Phases 0–2)**
1. Labels (inline create, color, icon, archive, rename) and simple categories.
2. Actual and planned entries: create, edit, delete with undo, past/future, open entries, overnight.
3. Today view: split-lane timeline + list mode, overlap warnings, current-time line, gap fill.
4. To finish list and header chip.
5. Full backup export, import (replace/merge), validation, safety backups, recovery screen.

**Tier 2 — plan vs actual (Phases 3–4)**
6. Daily routines with automatic planned occurrences.
7. One-day exceptions (change/skip/reset) and "Log as actual".
8. Month calendar (hourly area); basic tablet two-pane.
9. Reports: week / month / custom, summary cards, 4 chart types, table alternatives.
10. CSV export.

**Tier 3 — tasks and reminders (Phases 5–6)**
11. Long-term tasks: start/deadline, status, notes, priority, category, retrospective, overdue, filters.
12. Task calendar (separate), linking entries to tasks, estimate vs actual effort.
13. Repeating tasks.
14. Notifications: routine reminders, task reminders, evening check-in, backup reminder, weekly review (off), quiet hours, permission handling, deep links.
15. Tasks section in reports.

**Tier 4 — finish (Phase 7)**
16. PDF report with charts.
17. Accessibility pass, light/dark polish, onboarding, empty states.

### 16.2 Later enhancements (not in v1)

| Area | Enhancement |
|---|---|
| Entries | Drag to create/resize on timeline; live timer; "mark overlap as intentional"; bulk edit; search; templates/presets ("Gym 1 h"). |
| Labels | Merge labels; rename history; custom hex colors. |
| Routines | Weekday selection (Mon–Fri); per-routine adherence report; "log as planned" from notification action without opening the app. |
| Views | Week view (7-column); 3-day view; home-screen widgets (today summary, quick add). |
| Tasks | Search; projected next occurrences in task calendar; simple checklists (only if truly needed). |
| Notifications | Long-open entry nudge; snooze actions; hide details on lock screen; Android background top-up with WorkManager. |
| Reports | Category filter; goals per label ("10 h study/week") with progress; year view; compare with previous period. |
| Data | Password-encrypted backups; auto-export to a chosen folder; import from CSV of other apps; app lock. |
| Integrations | Apple Health / Health Connect sleep import; calendar export (.ics). |
| Platform | Kurdish/Arabic localization (RTL); dynamic color option; watch/desktop (unlikely). |
