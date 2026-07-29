# peterkautwima.com — Portfolio Site (revamp)

## Context

Complete revamp of my personal portfolio, peterkautwima.com. The old site is the
HTML5 UP "Aerial" template — a single animated landing screen that only links out
(GitHub, LinkedIn, Projects, CV). It's a link hub, not a portfolio. This rebuild turns
it into a real portfolio with a proper case study per project. Keep the domain and the
CV asset; treat everything else as replaceable.

This site has two jobs: it's a credential in itself (a polished Next.js site signals
front-end skill to a hiring manager) and a showcase for my ML/AI + engineering work.

## Current state — Phase 1 (shipped July 2026)

The revamp runs in two phases. **Phase 1 (this repo, now):** a static site with no build
step. `index.html` at the repo root is the home page (inline CSS/JS), built from the locked
design file `portfolio-homepage-prototype.html`. Case studies live under `work/`, one
self-contained page each — the first is `work/evolving-climbers/`. **Phase 2 (planned):**
the Next.js + TypeScript + Tailwind + MDX rebuild described in the rest of this document.

**Testing locally:** case-study links point at folders (`work/<slug>/`) to keep public URLs
clean, and resolving a folder to its `index.html` is a web-server behaviour. So opening
`index.html` from disk will not navigate to case studies — `file://` has no server to apply
that rule. **Double-click `preview.command`** (starts a local server and opens the browser),
or run `python3 -m http.server 8000`. The Netlify deploy preview on each PR is the other
check. Individual case-study files open fine on their own; only inter-page links need the
server.

Deployment facts (verified, not what older notes assumed): the site deploys on
**Netlify** — project `peterkautwima`, production branch **`master`**, publish directory
= repo root, **no build command**. PRs get deploy previews at
`deploy-preview-<PR#>--peterkautwima.netlify.app`. There is no Vercel project for this
repo.

## About me / who you're working with

Full-stack engineer (6+ yrs, React/TypeScript), BSc Hons in ML/AI. This is my home
stack, so you don't need to teach me React — but DO explain architectural choices
(content model, component boundaries, motion strategy) so the site reflects decisions
I can defend, not framework defaults. I care about taste, performance, accessibility,
and honest framing over flash.

## Stack (decided — Phase 2)

Next.js (App Router) + TypeScript + Tailwind CSS, MDX for case-study content. Hosting is
Netlify today (see Current state); where Phase 2 deploys gets decided when the rebuild
lands. Rationale: my daily stack; hosts my interactive React components natively;
MDX keeps case studies content-first while allowing inline live demos.

## Design direction (locked) — "Evolutionary Brutalism"

Dark, cinematic, oversized-type portfolio with a living/generative hero. Personality of
editorial brutalism + an alive, on-brand hero. Reference sites I'm aiming at: Nudot
Creative Studio (dark, huge display type, generative "LABS" strip), NESH (bold
personal-brand brutalism, playful stat cards), Stone Investment (cinematic video hero).

- **Base:** near-black (`#08080a`), off-white ink (`#f4f4ee`), muted grey (`#8a8a94`).
- **Accent:** acid-lime (`#c6f24e`) primary, electric indigo (`#6b5cff`) secondary.
  (Accent is still open to swap if a better one emerges — confirm before mass use.)
- **Type:** Archivo Black for oversized display/headlines; Space Grotesk for UI/body;
  JetBrains Mono for labels, metadata, tags. Sentence/upper mix, huge scale in heroes.
- **Texture:** subtle film grain overlay; hairline borders; 12–14px card radius.
- **Motion:** a generative particle/flock system in the hero that reacts to cursor and
  reads as "evolving"; marquees; chunky magnetic hovers; bold section transitions.
  Everything must honor `prefers-reduced-motion` and never block first paint.
- **Signature hero:** the home hero should feature the Evolving Climbers simulation —
  ideally a looping **video background** of the sim (or the generative canvas as a
  lighter fallback). This ties the whole identity to "systems that adapt."
- The shipped Phase 1 build is `index.html` (from `portfolio-homepage-prototype.html`,
  Evolutionary Brutalism). Treat it as the visual north star for Phase 2, not literal
  code to copy.

## Architecture — hub and spoke

- **Hub:** the site — home page + one case-study page per project, built from a shared
  template and a typed content model.
- **Spokes:** the projects. Featured case studies:
  1. University cancer-detection project (coursework — frame it as such).
  2. A RAG pipeline.
  3. "Evolving Climbers" — the GA creatures sim. It has its own interactive explainer
     in a SEPARATE repo (`evolving-climbers`), built decoupled and data-driven. Plan
     to embed/port that explainer here as a native case-study route reading the same
     results data — reuse, don't rebuild from scratch.
  4. A few other repositories (I'll point you to them).
- Each case study follows ONE structure: problem/context → approach → results (visual)
  → honest scope & limitations → links (repo, live demo). Lock this template on the
  first case study before mass-producing the rest.

## Working rules (important)

1. **Design spec before build.** Before scaffolding pages, produce and get my approval
   on: the sitemap, the case-study page template, the content model (MDX frontmatter
   fields per project), and the visual direction (type scale, color, motion). No page
   code until the spec is agreed.

2. **Build one exemplar end-to-end first.** Fully build a single case study (home +
   one project) and lock the template and design system before repeating. Don't
   mass-produce pages off an unproven template.

3. **Reusable design system.** Design tokens (color, spacing, type) in one place;
   shared components (case-study layout, project card, section blocks, media/figure,
   callout). New projects should be cheap to add — mostly content, little bespoke code.

4. **Honest framing — hard rule.** Every case study must be accurate about what I built
   and what the project is. The cancer-detection project is UNIVERSITY COURSEWORK — say
   so. "Evolving Climbers" is a GENETIC ALGORITHM in a PROVIDED physics environment,
   NOT reinforcement learning, and I did not build the base simulator. Copy must never
   overclaim: no "trained an agent," no "built the simulator," no inflated role.
   Impressive AND accurate. If any draft copy crosses this line, STOP and fix it.

5. **Performance & accessibility are first-class, not polish.** Semantic HTML, keyboard
   navigable, visible focus states, sufficient contrast, respects
   prefers-reduced-motion. Heavy media (videos, the creatures explainer) is lazy-loaded
   / dynamically imported so it never blocks first paint. Target strong Lighthouse
   scores and state them.

6. **Content lives as data, not hardcoded JSX.** Case studies are MDX + typed
   frontmatter; project metadata (title, stack, links, dates) comes from a typed
   source so the site is consistent and a new project is a content edit. Keep
   presentation (components) separate from content (MDX/data).

7. **Explain architectural choices as you make them** (content model, component
   boundaries, motion approach, when a section becomes a client component). One or two
   lines on the WHY and the tradeoff — enough that I can defend it in an interview.

8. **master is always deployable.** Short-lived branches (`feat/…`, `fix/…`, `content/…`),
   small atomic commits, Conventional Commits style. Netlify deploy previews per PR;
   master must always deploy green — it auto-deploys to peterkautwima.com. Update README
   setup/run/deploy notes in the same commit as any change that affects them. Commits are
   authored by ME alone — no Co-Authored-By trailer: ensure `.claude/settings.json`
   contains `{"includeCoAuthoredBy": false}` before the first commit of any session.

   **BRANCH CHECK — run this before writing a single file of new work.** One unit of work
   (a phase, a feature, a fix) = one branch off an up-to-date `master` = one PR. This has
   already gone wrong once: Phase 1 was built and committed onto Phase 0's already-merged
   branch because nobody checked first.

   ```sh
   git branch --show-current     # am I on a stale/merged branch?
   git status --short            # any uncommitted work to deal with first?
   git checkout master && git pull
   git checkout -b feat/<this-unit-of-work>
   ```

   Do not accept "I'll switch later" — by then the commits are in the wrong place and
   fixing it needs a rebase or a force push. If work has _already_ started on the wrong
   branch, the cheap recovery is `git branch -m <better-name>` before pushing, or simply
   continuing there and naming the PR accurately; do not rewrite pushed history to tidy a
   branch name.

9. **SEO baseline on every page.** Per-page title/description metadata, Open Graph
   images (generate them), a sitemap, and semantic headings. This is a portfolio — it
   should be findable and share cleanly.

10. **Motion with restraint.** Thoughtful, purposeful animation (reveal, transition,
    the interactive demos) — never gratuitous. Everything degrades gracefully and
    honors reduced-motion. If an effect doesn't earn its JS cost, cut it.

11. **Verify in a real browser, not just a build (lesson from another project where an
    interactive page was shipped never actually opened).** "It compiles" and "the JSX is
    valid" are not "it works." Before calling any page or embedded demo done: load it in a
    real browser, click through interactions, check mobile width, run Lighthouse, and —
    for embedded showcases — confirm the interactive parts actually render and respond.
    Screenshots or a viewed preview beat an assumed-good build.

## Repo structure

Phase 1 (current, static):

| Path                                | Purpose                                              |
| ----------------------------------- | ---------------------------------------------------- |
| `index.html`                        | Home page — single file, inline CSS/JS               |
| `work/<slug>/index.html`            | One self-contained case study per folder (see below) |
| `assets/peter-kautwima-cv-2026.pdf` | CV, linked from nav and footer                       |
| `assets/favicon.svg`                | "PK" favicon, site colours                           |
| `assets/og-image.png`               | 1200×630 Open Graph / Twitter card image             |
| `preview.command`                   | Double-click to run the site locally (macOS)         |
| `robots.txt`                        | Allow-all                                            |
| `CLAUDE.md` · `README.md`           | Working rules (this file) · public repo front        |
| `.claude/settings.json`             | Claude Code harness settings (no co-author trailer)  |

Phase 2 target tree (proposed; confirm in the spec step):

```
peterkautwima.com/
├── CLAUDE.md · README.md
├── package.json · next.config.mjs · tailwind.config.ts · tsconfig.json
├── content/
│   └── projects/                 # one MDX per case study + typed frontmatter
├── src/
│   ├── app/                      # App Router: /, /projects, /projects/[slug], /cv
│   ├── components/               # design-system + layout components
│   │   ├── ui/                   # primitives (Button, Card, Tag, Figure, Callout)
│   │   ├── case-study/           # case-study section blocks
│   │   └── demos/                # interactive pieces (e.g. Evolving Climbers explainer)
│   ├── lib/                      # content loading, metadata, og-image helpers
│   ├── styles/                   # tokens, globals
│   └── data/                     # site config, project index, social links
├── public/                       # CV pdf, images, video, favicons
└── README.md
```

Names/layout are a starting proposal — settle them in the spec step, then treat the
agreed tree as locked.

## Relationship to the evolving-climbers repo

The creatures sim + its interactive explainer live in their own repo, decoupled and
data-driven (all logic reads from a results JSON). This portfolio depends on that project's
OUTPUT; it never reimplements the simulation.

**Shipped (Phase 0, July 2026):** the generated explainer is **copied** — never moved — into
`work/evolving-climbers/index.html` and served as a case-study route. It is fully
self-contained (experiment data and video inlined as base64), so it needs nothing else from
this repo.

The source repo stays the master. To refresh: regenerate there via
`explainer/build_data.py`, copy the file across, and re-apply the three portfolio-only
edits, which are listed in README.md — a home link back to the site, route metadata, and a
mobile overflow fix. Keep that list in README.md current; if the divergence grows past a
handful of edits, script it rather than re-applying by hand.

When Phase 2 lands, this route becomes React components under `src/components/demos/`
reading the same data. Until then the copied file IS the case study.

## Reference docs — when to read what

- **README.md** — setup, run, deploy. Keep it true; it's the public front of a public
  repo and part of the credential.
- **The design spec (from rule 1)** — the agreed IA, template, content model, and
  visual direction. If a page would deviate from it, STOP and flag before building.

```

```
