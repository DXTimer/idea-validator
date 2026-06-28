# Idea Validator

A Claude Code skill that pressure-tests your startup, product, or feature idea, then tells
you whether to pursue it and what to test first.

It runs a panel of named sub-agents who argue both sides, finds the one assumption
everything rests on, and designs an offer you could sell today — all written up in one
linked report.

When you're excited about an idea, you're the worst judge of it. This skill gives you the
room of skeptics and believers you'd want before you commit, each working independently so
none of them can lean on your hope or on each other's conclusions.

Inspired by Garry Tan's gstack `plan-ceo-review`: the same adversarial, multi-agent,
opinionated spirit, pointed at validating ideas instead of reviewing code.

---

## What it does

Run `/validate-idea <your idea>` and the skill:

1. **Sharpens** the idea into a testable frame (problem, customer, today, proposal,
   why-now, wedge).
2. **Picks a mode** with you — Gut Check, Full Gauntlet, Kill Mode, or Investor Mode.
3. **Runs the dialectic** — two personas in parallel: **Sloan** the repeat founder
   builds the strongest honest case *for*; **Dutch** the burned operator builds the
   strongest honest case *against*. Same idea, opposite jobs.
4. **Runs the specialist panel** — more parallel personas, each adversarial in its lane:
   - **Priya** (market) — is the budget real, big enough, why now (web-researched)
   - **the Customer** — the actual buyer, in first person, "I'm busy and I already have a way to do this"
   - **Marcus** (competitor) — the incumbent who copies it in a quarter (web-researched)
   - **Reggie** (operator) — can it be built, distributed, and paid for
   - **the Coroner** (pre-mortem) — the autopsy: how it's dead in 24 months
   - **Gabriela** (investor) — in Investor Mode only
5. **Distills "What Has To Be True"** — turns the believer's case and the skeptic's
   objections into the explicit list of conditions that must *all* hold to win, ranked
   by how shaky each one is. The shakiest is the riskiest assumption.
6. **Finds the cheapest test** — designs the experiment that de-risks the shakiest
   assumption, with kill and success criteria.
7. **Renders a verdict** — PURSUE / PURSUE-REFRAMED / PARK / PASS, scored against a
   rubric where one fatal flaw caps the whole score.
8. **Designs the offer** — **The Closer** builds an irresistible offer and a
   cash-flow-smart price (deposit-for-credit, founding pricing, guarantees) where the
   paid pre-sale *is* the validation test. Money beats words.
9. **Red-teams its own verdict** — **The Adversary** challenges the conclusion in both
   directions (too kind? too harsh?), and the verdict gets revised or defended in the open.
10. **Writes a linked report** — a directory of files (executive-summary index → dialectic,
    what-has-to-be-true, panel, the test, the offer, red team) plus ready-to-use
    artifacts: a landing-page prompt, an interview script, and cold outreach.

You make every important call. The skill recommends hard, then leaves the decision to you.

```mermaid
flowchart TD
    idea([Your idea]) --> sharpen[Sharpen into a testable frame<br/>problem · customer · today · proposal · why-now · wedge]
    sharpen --> mode{Pick a mode<br/>Gut Check · Full Gauntlet · Kill Mode · Investor Mode}
    mode --> dialectic

    subgraph dialectic [The dialectic · parallel · opposite jobs on identical input]
        direction LR
        sloan[Sloan · repeat founder<br/>strongest honest case FOR]
        dutch[Dutch · burned operator<br/>strongest honest case AGAINST]
    end

    dialectic --> panel

    subgraph panel [Specialist panel · parallel · blind to each other]
        direction LR
        priya[Priya<br/>market]
        customer[the Customer<br/>the buyer]
        marcus[Marcus<br/>competitor]
        reggie[Reggie<br/>operator]
        coroner[the Coroner<br/>pre-mortem]
        gabriela[Gabriela · investor<br/>Investor Mode only]
    end

    panel --> whtbt[What Has To Be True<br/>conditions ranked by shakiness]
    whtbt --> risk[Riskiest assumption<br/>the shakiest condition]
    risk --> test[Cheapest test<br/>kill + success criteria]
    test --> verdict{{Verdict<br/>PURSUE · PURSUE-REFRAMED · PARK · PASS}}
    verdict --> closer[The Closer<br/>irresistible offer = the validation test]
    closer --> adversary[The Adversary<br/>red-teams the verdict, both directions]
    adversary --> report[(Linked report + artifacts)]
```

---

## Install

```bash
./install.sh          # symlinks the skill into ~/.claude/skills/validate-idea
```

Then `/validate-idea` works in any session. Uninstall: `rm ~/.claude/skills/validate-idea`.

Reports land in `idea-validations/<date>-<slug>/` in your current working directory, so you
can watch the files appear live as the panel runs.

---

## Usage

```
/validate-idea an AI chief-of-staff for solo founders that reads my email,
calendar, and Slack and proactively runs my day
```

or conversationally: *"I'm thinking about building X. Pressure-test it before I commit."*

Modes you can ask for directly:
- "just gut-check this" → **Gut Check** (fast)
- "tear it apart" / "I'm already in love with this" → **Kill Mode**
- "I'm pitching VCs" → **Investor Mode**
- otherwise → **Full Gauntlet** (default)

Swap personas on the fly: *"be my toughest customer Dana"* or *"review it like Bezos."*

---

## A worked example (real results)

[`skills/validate-idea/examples/2026-06-27-ai-chief-of-staff-solo-founders/`](skills/validate-idea/examples/2026-06-27-ai-chief-of-staff-solo-founders/)
is a real run of the full gauntlet — the panel produced it live with real web research.
Start with [`index.md`](skills/validate-idea/examples/2026-06-27-ai-chief-of-staff-solo-founders/index.md)
(the 60-second executive summary) and follow its links. The verdict came out PURSUE-REFRAMED
at low confidence (effectively a PASS as framed), with a $500 concierge pre-sale as the
validation test. Fatal flaws and all — that's the real output.

---

## Repo layout

```
idea-validator/
├── README.md
├── install.sh
└── skills/validate-idea/
    ├── SKILL.md                 # the skill — read as instructions
    ├── references/
    │   ├── panel.md             # the named personas + return contracts
    │   ├── rubric.md            # scoring + capping rules + verdicts
    │   ├── offer-playbook.md    # business/offer knowledge (the value equation, cash-flow plays)
    │   └── report-format.md     # the linked multi-file output spec
    └── examples/
        └── 2026-06-27-ai-chief-of-staff-solo-founders/   # a real produced run
```

---

## Design notes

- **The disagreement is built in.** Sloan and Dutch get opposite jobs on the same input.
  The five lenses can't see each other's work, and the Adversary can't see the panel. That
  independence is the whole point, so each persona runs as its own sub-agent with its own
  context.
- **"What has to be true" turns argument into action.** The believers and skeptics each
  imply a set of conditions. List them, rank them by how shaky they are, and the shakiest
  one becomes the bet you test first.
- **One fatal flaw caps the score.** Average the scores and a weak idea slips through with a
  passing grade. So a single killer finding — no market, no moat — overrides an otherwise
  high total.
- **Money is the real test.** A paid deposit from the exact buyer is the strongest signal
  you can get. The offer is built to *be* that experiment, with a number that tells you when
  to walk away.
- **You're in charge.** The skill recommends hard, then hands every real decision back to
  you.
