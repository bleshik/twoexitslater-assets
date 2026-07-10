# Funding map — publish guide

Two files per issue: **public teaser** (growth) and **full report** (subscribers).

## Current issue (June 2026)

| Audience | File | URL |
|---|---|---|
| Public (posts, sharing) | `funding-map-june-2026-teaser.html` | https://assets.twoexitslater.com/funding-map-june-2026-teaser.html |
| Subscribers (welcome + footer) | `vault/funding-map-june-2026-x7k2.html` | https://assets.twoexitslater.com/vault/funding-map-june-2026-x7k2.html |

**Teaser:** Full 2026 default works; one filter change works; second change → subscribe overlay + blur.

**Full:** all filters open, unlisted in `vault/` (`robots.txt` blocks `/vault/`).

## Monthly workflow

1. Regenerate reports:
   ```bash
   cd ~/Desktop/Workspace/business-models
   ruby kb/scripts/generate_w202628_report.rb
   ```
2. Publish both files:
   ```bash
   cd ~/K/twoexitslater
   ./scripts/publish-teaser.sh july-2026
   ./scripts/publish-vault.sh july-2026
   ```
3. Copy teaser to personal site:
   ```bash
   cp ~/Desktop/Workspace/business-models/reports/W202628_analysis_report_teaser.html \
      ~/K/alekseibalchunas/reports/funding-map-july-2026-teaser.html
   ```
4. Commit and push both repos.
5. **Teaser URL** → posts, LinkedIn, site.
6. **Vault URL** → welcome email and newsletter footer only.

## Naming

- Teaser: `funding-map-<period>-teaser.html` (public, root)
- Full: `funding-map-<period>-<suffix>.html` (vault, random suffix each month)
