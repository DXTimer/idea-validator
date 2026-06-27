# Report format — a linked set of files, not one document

The output is a **directory**, not a single file. One short index that a busy person
reads in 60 seconds, linking out to the pieces. Each piece stands alone so the user
can open just the part they need (or hand the landing-page prompt straight to a
designer without reading the rest).

## Where it goes

```
idea-validations/<YYYY-MM-DD>-<idea-slug>/
├── index.md                     # executive summary + verdict + scorecard + links
├── dialectic.md                 # Believer vs Skeptic, and the crux
├── what-has-to-be-true.md       # the load-bearing conditions, ranked by uncertainty
├── panel.md                     # market / customer / competitor / operator / pre-mortem
├── riskiest-assumption-and-test.md   # the leap + the cheapest experiment
├── offer.md                     # the irresistible offer + cash-flow play (if not a PASS)
├── red-team.md                  # the challenge to the verdict + what changed
└── artifacts/
    ├── landing-page-prompt.md   # paste into v0 / Lovable / Stitch to build the test page
    ├── interview-script.md      # the problem-interview questions
    └── outreach.md              # the cold DM/email to recruit test subjects
```

Create the dir under the current working directory. If cwd isn't writable, use the
scratchpad and say so. Omit `offer.md` and the artifacts only on a clean PASS (a dead
idea needs no offer). Always write `index.md`, `dialectic.md`, `what-has-to-be-true.md`,
`panel.md`, `riskiest-assumption-and-test.md`, and `red-team.md`.

Voice everywhere: concrete, no hedging, no AI filler, no em dashes. Every claim traces
to a panelist by name. Cross-link files with relative markdown links.

---

## `index.md` — the 60-second read

````markdown
# Idea Validation — <Idea Name>

> **Verdict: <PURSUE / PURSUE, REFRAMED / PARK / PASS>** · Confidence: <low/med/high>
> Score: <X>/50 (capped by: <rule or none>) · Mode: <mode> · <date>

**The one sentence:** <what to do and why, in one line>

**Why this verdict (3 bullets):**
- <load-bearing reason, names a panelist>
- <load-bearing reason>
- <load-bearing reason>

**The single most important number/fact that would flip this verdict:** <one line>

## Scorecard
| Dimension | Score | Why |
|-----------|:-----:|-----|
| Problem severity | _/5 | <tied to a finding> |
| Customer pull | _/5 | |
| Market size & timing | _/5 | |
| Willingness to pay | _/5 | |
| Differentiation / moat | _/5 | |
| Distribution / reachability | _/5 | |
| Feasibility / unit economics | _/5 | |
| Founder-market fit | _/5 | |
| Defensible why-now | _/5 | |
| Risk testability | _/5 | |
| **Total** | **_/50** | **Cap: <rule / none>** |

## Read next
- [The dialectic — bull vs bear](dialectic.md)
- [What has to be true to win](what-has-to-be-true.md)
- [The panel's findings](panel.md)
- [The riskiest assumption & the cheapest test](riskiest-assumption-and-test.md)
- [The offer & how to pre-sell it](offer.md)
- [Build the test landing page](artifacts/landing-page-prompt.md)
- [Customer interview script](artifacts/interview-script.md)
- [Red team challenge](red-team.md)

## Do this next
<the single next action — almost always: run the cheapest test from the riskiest-assumption file>
````

---

## `dialectic.md`

Believer (Sloan) and Skeptic (Dutch), each as 3-5 load-bearing bullets in their voice,
then:

```markdown
## Where they actually clash
<the one disagreement the whole verdict turns on>

## Who's right, and why
<your call on the crux, naming which panelist the evidence backs and why>
```

---

## `what-has-to-be-true.md` — the heart

Derive this directly from the dialectic. The Believer's bull case is a set of
conditions that must hold for the upside; the Skeptic's fatal objections are
conditions that must NOT happen. Merge them into one ranked list of statements that
**must all be true** for the idea to win. Rank by uncertainty: the least-certain one
is the riskiest assumption.

```markdown
# What Has To Be True

For <idea> to win, every one of these must hold. Ranked most-shaky first.

| # | Must be true | Status | Evidence / who flagged it | If false |
|---|--------------|:------:|---------------------------|----------|
| 1 | <condition> | hoped / believed / known | <panelist + finding> | <consequence> |
| 2 | <condition> | | | |
| ... | | | | |

**Status legend:** known (evidence says yes) · believed (reasonable, untested) ·
hoped (no evidence, load-bearing).

**The shakiest link:** condition #<n> — this is the riskiest assumption. Everything
downstream depends on it. See [the test](riskiest-assumption-and-test.md).
```

This is the section the user asked for: believers + skeptics → the explicit
preconditions for success.

---

## `panel.md`

One short subsection per lens, each led by the panelist's name and their
load-bearing finding (not the raw block). Keep sources for Market and Competitor.

```markdown
## Market — Priya
<load-bearing finding> · Sources: <urls>

## Customer — <avatar>
<pull strength + the desire or the friction>

## Competitor — Marcus
<moat rating + what survives copying> · Sources: <urls>

## Operator — Reggie
<distribution channel + the execution risk>

## Pre-mortem — The Coroner
<the #1 cause of death + its early warning sign>

## Where the panel disagreed with itself
<cross-panel tensions and what they mean>
```

---

## `riskiest-assumption-and-test.md`

```markdown
# The riskiest assumption

**The leap of faith:** <restate the shakiest must-be-true condition>

Why it's the one that matters: <one paragraph>

# The cheapest way to find out

**Experiment:** <concrete tactic — concierge, interviews, paid pre-sale, fake door>
**Cost / time:** <rough>
**Success criterion:** <result that says keep going>
**Kill criterion:** <result that says stop>

This tests the leap directly. Anything else is procrastination.

Artifacts to run it: [landing page](artifacts/landing-page-prompt.md) ·
[interview script](artifacts/interview-script.md) · [outreach](artifacts/outreach.md)
```

---

## `offer.md`

Render the Offer Architect's block as readable prose: the named offer, the value
stack, the guarantee, the price + cash-flow play, and explicitly how the offer
doubles as the validation test (the kill number). End with: "The pre-sale of this
offer IS the experiment in [riskiest-assumption-and-test.md]."

---

## `artifacts/landing-page-prompt.md`

A ready-to-paste prompt for an AI site builder (v0, Lovable, Stitch, Bolt). It must
specify: the avatar, the headline (the dream outcome), subhead, the offer, the
guarantee, the scarcity/urgency, 3 objection-killer sections, the single CTA (capture
email or take the deposit), and the visual tone. Written so the user pastes it and
gets a working pre-sale/smoke-test page. Keep it self-contained.

## `artifacts/interview-script.md`

10-15 problem-interview questions for the target buyer, in the Mom-Test spirit (ask
about their past behavior and real spend, never pitch). Include the two or three
probes that separate the real risk from the comfortable answer.

## `artifacts/outreach.md`

The cold DM and the cold email to recruit test subjects / pilot buyers. Short, specific,
avatar-targeted, one ask. Include where to send it (named communities/channels).
