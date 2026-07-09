# Shiptivitas — Three Ideas to Grow Daily Active Users

**Context.** The Kanban board shipped on **2 June 2018**. In the eleven months since,
average daily active users (DAU) rose from **3.63 → 11.79** (a **3.25× / +225% lift**).
The three ideas below are each grounded in a specific number from the data and follow the
required format: **Hypothesis → Expected Impact → What the feature is**. Simple wireframes
are included as optional flows.

Supporting data used throughout:
- **38 of 200 cards (19%)** never left the *backlog*.
- The flow leaks: **167 cards started** (backlog → in-progress) but only **103 completed** (in-progress → complete) — a **62%** completion rate.
- DAU peaked at **12.9 (Jul 2018)** then drifted to **10.0 (Feb 2019)** — post-launch novelty is fading.
- Reaching *complete* (103 times) is the value moment managers care about most.

---

## Idea 1 — Stuck-card nudges  ·  *targets: activation*

**Hypothesis.**
Cards that sit untouched in the backlog are forgotten, not rejected. If we resurface them
with a timely nudge, the owner will return to the app to act on them. (19% of cards never
move, and the funnel leaks from 167 started to 103 completed.)

**Expected Impact.**
A measurable drop in never-moved cards and an estimated **+10–15% DAU** — every nudge is a
concrete reason to open the app that day, and each returning login is a counted active user.

**What the feature is.**
A weekly **"Stale cards" digest**: an email plus an in-app banner listing cards untouched for
7+ days, each with one-tap **Move** or **Archive** so the user can clear them without hunting.

**Flow / wireframe.**
```
 ┌─────────────────────────────────────────────┐
 │  📥  3 cards have been in Backlog for 7+ days │
 │                                               │
 │  • Nolan LLC — Vision-Oriented UI    [Move ▸] │
 │  • Kohler Group — Multi-Tasking      [Move ▸] │
 │  • Borer LLC — Incremental Orch.     [Move ▸] │
 │                                    [Archive]  │
 └─────────────────────────────────────────────┘
   Email  ──►  click card  ──►  board opens on that card
```

---

## Idea 2 — Completion streaks  ·  *targets: retention*

**Hypothesis.**
Users lose the daily habit once the newness wears off (DAU slid from 12.9 to 10.0 after the
launch peak). A lightweight goal tied to the app's core value moment — moving a card to
*Complete* — will rebuild the daily return loop.

**Expected Impact.**
A flatter, slower DAU decline and higher week-over-week return; target **+8–12% retained DAU**
month over month.

**What the feature is.**
A **"cards completed this week" goal and streak counter** in the board header, with a gentle
reminder when a live streak is about to lapse — turning completion into a habit worth keeping.

**Flow / wireframe.**
```
 ┌──────────────── Board header ────────────────┐
 │  🔥 4-week streak     ▓▓▓▓▓▓▓░░  6 / 8 done   │
 └───────────────────────────────────────────────┘
   card → Complete  ──►  progress bar fills
   streak at risk   ──►  "1 card keeps your streak alive" reminder
```

---

## Idea 3 — Manager completion alerts  ·  *targets: acquisition loop*

**Hypothesis.**
Emailing a manager the instant their team completes a key card pulls a brand-new, high-value
user segment into the app and adds accountability that speeds the whole board along.
(Completing a card happened 103×; managers care most about completions.)

**Expected Impact.**
A new returning-user segment (managers) converting from email → login, plus faster card
throughput; target **+15% DAU**.

**What the feature is.**
A per-card **"Notify on complete"** toggle: when a card reaches *Complete*, the chosen manager
gets an email summary with a link that deep-opens the board on that card.

**Flow / wireframe.**
```
 Card menu                       Manager's inbox
 ┌───────────────────────┐       ┌──────────────────────────────┐
 │ Notify on complete ▸  │       │ ✅ "Wiza LLC" was completed    │
 │  to: [ Manager ▼ ]    │  ──►  │    by Dawna P. · 2m ago        │
 └───────────────────────┘       │    [ Open board ▸ ]            │
        card hits Complete       └──────────────────────────────┘
                                   click ──► logs the manager in (DAU)
```

---

*Full analysis, both graphs, and the SQL that produced these numbers are in the accompanying
`analysis.html` report.*
