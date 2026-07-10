# Vault (paid newsletter links)

Unlisted HTML reports. No links from the public site — share URL only in the paid email section.

## Current issue

| Period | File | URL |
|---|---|---|
| June 2026 | `funding-map-june-2026-x7k2.html` | https://assets.twoexitslater.com/vault/funding-map-june-2026-x7k2.html |

## Monthly workflow

1. Regenerate the report in `business-models`:
   ```bash
   cd ~/Desktop/Workspace/business-models
   ruby kb/scripts/generate_w202628_report.rb
   ```
2. Publish with a **new** random suffix (never reuse old URLs):
   ```bash
   cd ~/K/twoexitslater
   ./scripts/publish-vault.sh july-2026
   ```
3. Commit and push:
   ```bash
   git add vault/ robots.txt
   git commit -m "chore(vault): add funding map for july-2026"
   git push
   ```
4. Put only the printed URL in the paid section of the newsletter.

## Naming

`funding-map-<period>-<suffix>.html`

- `period` — slug like `june-2026`, `july-2026`
- `suffix` — 4 random chars (`a-z0-9`); pass explicitly or let the script generate

Old files stay online (forwarded links keep working) but subscribers only get the new URL each month.
