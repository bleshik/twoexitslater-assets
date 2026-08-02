# Funding map — publish guide

Two files per issue: **public teaser** (growth) and **full report** (subscribers).

## Current issue (July 2026)

| Audience | File | URL |
|---|---|---|
| Public (canonical, use everywhere) | `funding-map.html` | https://assets.twoexitslater.com/funding-map.html |
| Public archive (July 2026) | `funding-map-july-2026-teaser.html` | https://assets.twoexitslater.com/funding-map-july-2026-teaser.html |
| Subscribers (canonical, welcome + footer) | `vault/funding-map.html` | https://assets.twoexitslater.com/vault/funding-map.html |
| Subscriber archive (July 2026) | `vault/funding-map-july-2026-a8f3.html` | https://assets.twoexitslater.com/vault/funding-map-july-2026-a8f3.html |

**Teaser:** Full 2026 default works; one filter change works; second change → subscribe overlay + blur.

**Full:** all filters open, unlisted in `vault/` (`robots.txt` blocks `/vault/`). The stable `vault/funding-map.html` URL always contains the newest full report.

## Monthly workflow

1. Regenerate reports:
   ```bash
   cd ~/Desktop/Workspace/business-models
   REPORT_PERIOD=2026-07 ruby kb/scripts/generate_w202628_report.rb
   ```
2. Publish both files. The teaser command writes the dated archive and refreshes
   the stable public `funding-map.html` URL:
   ```bash
   cd ~/K/twoexitslater
   ./scripts/publish-teaser.sh july-2026
   ./scripts/publish-vault.sh july-2026
   ```
3. Commit and push `twoexitslater` repo.
4. **Stable teaser URL** (`https://assets.twoexitslater.com/funding-map.html`) →
   posts, LinkedIn, `alekseibalchunas.com` (#hunt section). Keep dated teaser
   URLs as an archive; do not use them for new promotion.
5. **Stable vault URL** (`https://assets.twoexitslater.com/vault/funding-map.html`) → Beehiiv welcome email, newsletter footer, and all new subscriber placements. Set it once; do not replace it each month.
6. Update `VAULT.md` “Current issue” table with the new dated archive URL.

## Naming

- Teaser: `funding-map-<period>-teaser.html` (public, root)
- Stable teaser: `funding-map.html` (public, root; overwritten with the newest issue)
- Full: `funding-map-<period>-<suffix>.html` (vault, random suffix each month)
- Stable full report: `vault/funding-map.html` (unlisted; overwritten with the newest issue)
