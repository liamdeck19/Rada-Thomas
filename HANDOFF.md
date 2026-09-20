# Rada Thomas Website — Handoff

One-page static site for **Rada Thomas**, Registered Physiotherapist & Osteopathic Manual Practitioner (Hamilton & Burlington, ON).

## Live
- **https://radathomas.com** (and www) — this is the URL to share.
- Hosted on **Cloudflare Pages**, project name **`rada-thomas`**, account `johnligori@jladigital.com`.
- Domain `radathomas.com` is registered + DNS-managed on Cloudflare (same account); custom domain attached to the Pages project; SSL is automatic.

## Repo
- **github.com/liamdeck19/Rada-Thomas** (branch `main`). You (`JL-9929`) are a **collaborator, not the owner**.
- Push works via a token cached in the macOS keychain — `git push` needs no extra input.

## Stack / files
Plain static HTML + CSS. No framework, no build step for the site itself.
- `index.html` — the whole page. Fonts load from Google Fonts CDN. Stylesheet linked as `styles.css?v=2` (cache-buster — bump if a CSS change won't show).
- `styles.css` — all styles. Mobile nav is a hamburger menu (≤768px) with a few lines of inline JS in index.html.
- `images/` — original photos (`hero.jpg`, `rada-portrait.jpg`).
- `Rada Thomas.html` — self-contained single-file copy (images+fonts inlined). Legacy emailable fallback; radathomas.com is the delivery channel now.
- `build.sh` — rebuilds `dist/` + `rada-thomas-site.zip` (optimizes images) for deploy.
- `dist/`, `scratch_build/`, `rada-thomas-site.zip` — build artifacts, gitignored.

## Contact info on the page
- Email: **radathomasrehab@gmail.com** (mailto on the "Contact Rada" button + the contact line)
- Phone: **289-337-8403** (tel link)

## How to make a change (the whole workflow)
1. Edit `index.html` / `styles.css`.
2. Preview locally if wanted: dev server is `.claude/serve.js` (Node, port 4321) — `preview_start` name `rada-static`. (Python broke after Xcode was installed; we use Node.)
3. `./build.sh`
4. **Deploy:** drag the `dist/` folder into Cloudflare → Workers & Pages → `rada-thomas` → **Create deployment**. Same URL, no domain reconfig. **This is a manual Direct Upload — `git push` does NOT auto-deploy.**
5. `git commit` + `git push` to keep the repo in sync.

## Gotchas
- **Direct Upload, not Git-connected.** The live site only updates when you drag `dist/` into Cloudflare. Auto-deploy-on-push would require repo owner **liamdeck19** to connect the repo on Cloudflare's Git side.
- **Cloudflare Email Obfuscation** rewrites the email in the served HTML (`data-cfemail=...` / `[email protected]`). Normal — it decodes in-browser and the mailto works on click. Toggle under Scrape Shield if ever unwanted.
- Emailing the `Rada Thomas.html` file to someone: they must **open it with a browser** (double-click may show source). The hosted link avoids this.
