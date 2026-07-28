# peterkautwima.com

Personal portfolio of **Peter Kautwima** — ML/AI engineer & full-stack developer,
Cape Town. Live at [peterkautwima.com](https://peterkautwima.com).

A static site in the site's own "Evolutionary Brutalism" style: dark, oversized type, and
a live flocking simulation in the hero that reacts to your cursor (open the dials in the
Labs section to play with it). Every project card links to a live demo, live site, case
study, or public repo — honest framing over a wall of claims.

Case studies live under `/work/`. The first is **Evolving Climbers**, a self-contained
interactive explainer for the genetic-algorithm creatures project.

## Repo structure

| Path | Purpose |
|---|---|
| `index.html` | The home page — one file, inline CSS/JS, no build step |
| `work/evolving-climbers/index.html` | Evolving Climbers case study (see *Case studies* below) |
| `assets/peter-kautwima-cv-2026.pdf` | CV, linked from nav and footer |
| `assets/favicon.svg` | "PK" favicon in the site colours |
| `assets/og-image.png` | 1200×630 Open Graph / Twitter card image |
| `preview.command` | Double-click to run the site locally (macOS) |
| `robots.txt` | Allow-all |
| `CLAUDE.md` | Project working rules and the Phase 2 spec |
| `.claude/settings.json` | Claude Code harness settings |

## Case studies

`work/evolving-climbers/index.html` is a **copy** of the explainer generated in the
[evolving-creatures-genetic-algorithm](https://github.com/peter-kautwima/evolving-creatures-genetic-algorithm)
repo (`explainer/index.html`, built from `results/` by `explainer/build_data.py`). It is
fully self-contained — experiment data and video are inlined — so it needs no assets from
this repo.

**To refresh it:** regenerate in the source repo, then copy the file here and re-apply the
two portfolio-only edits below. The source repo remains the master; this is a deployment
copy.

Portfolio-only divergences from the source file:

1. A `← Peter Kautwima` home link in the sticky bar, so visitors who deep-link in from the
   Labs section can get back to the site.
2. Canonical URL, favicon, and Open Graph / Twitter metadata for the
   `/work/evolving-climbers/` route.

The Labs section on the home page deep-links into this page's `#loop` (the generation
stepper) and `#settings` (the population and mutation dials).

## Phases

| Phase | Stack | Status |
|---|---|---|
| 1 — this site | Single-file static HTML/CSS/JS | **Shipped** (July 2026) |
| 2 — rebuild | Next.js · TypeScript · Tailwind · MDX case studies | Planned — spec in `CLAUDE.md` |

## Run locally

No build step, no dependencies:

**Double-click `preview.command`.** It picks a free port, starts a static server, and opens
your browser. Close the Terminal window to stop it.

Or by hand:

```sh
python3 -m http.server 8000
# open http://localhost:8000
```

Either way, use a server rather than double-clicking `index.html`. Links to case studies
point at folders (e.g. `work/evolving-climbers/`) so the public URLs stay clean — and
resolving a folder to its `index.html` is something a *web server* does. Opened straight
from disk there is no server, so those links land on a folder listing instead of the page.

(Opening `work/evolving-climbers/index.html` directly does work — it is self-contained. It
is only the links *between* pages that need the server.)

## Deploy

Netlify auto-deploys `master` to peterkautwima.com (publish directory = repo root, no
build command). Pull requests get deploy previews at
`deploy-preview-<PR#>--peterkautwima.netlify.app`.

## Quality

Verified before ship: every link resolves, the hero canvas runs at ~60 FPS, no console
errors, true 375 px mobile render, and Lighthouse **90 / 91 / 100 / 100**
(performance / accessibility / best practices / SEO). The two sub-100 scores are the
render-blocking Google Fonts request and the design's muted-grey text contrast.
