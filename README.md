# peterkautwima.com

Personal portfolio of **Peter Kautwima** — ML/AI engineer & full-stack developer,
Cape Town. Live at [peterkautwima.com](https://peterkautwima.com).

A single-file static site in the site's own "Evolutionary Brutalism" style: dark,
oversized type, and a live flocking simulation in the hero that reacts to your cursor
(open the dials in the Labs section to play with it). Every project card links to a live
demo, live site, or public repo — honest framing over a wall of claims.

## Repo structure

| Path | Purpose |
|---|---|
| `index.html` | The entire site — one file, inline CSS/JS, no build step |
| `assets/peter-kautwima-cv-2026.pdf` | CV, linked from nav and footer |
| `assets/favicon.svg` | "PK" favicon in the site colours |
| `assets/og-image.png` | 1200×630 Open Graph / Twitter card image |
| `robots.txt` | Allow-all |
| `CLAUDE.md` | Project working rules and the Phase 2 spec |
| `.claude/settings.json` | Claude Code harness settings |

## Phases

| Phase | Stack | Status |
|---|---|---|
| 1 — this site | Single-file static HTML/CSS/JS | **Shipped** (July 2026) |
| 2 — rebuild | Next.js · TypeScript · Tailwind · MDX case studies | Planned — spec in `CLAUDE.md` |

## Run locally

No build step, no dependencies:

```sh
python3 -m http.server 8000
# open http://localhost:8000
```

## Deploy

Netlify auto-deploys `master` to peterkautwima.com (publish directory = repo root, no
build command). Pull requests get deploy previews at
`deploy-preview-<PR#>--peterkautwima.netlify.app`.

## Quality

Verified before ship: every link resolves, the hero canvas runs at ~60 FPS, no console
errors, true 375 px mobile render, and Lighthouse **90 / 91 / 100 / 100**
(performance / accessibility / best practices / SEO). The two sub-100 scores are the
render-blocking Google Fonts request and the design's muted-grey text contrast.
