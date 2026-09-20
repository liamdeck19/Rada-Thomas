#!/bin/bash
# Rebuild the Cloudflare deploy bundle from source.
# Run after editing index.html or styles.css, then drag dist/ into Cloudflare Pages.
set -e
cd "$(dirname "$0")"
rm -rf dist rada-thomas-site.zip
mkdir -p dist/images
cp index.html styles.css dist/
sips -Z 1800 images/hero.jpg --out dist/images/hero.jpg >/dev/null
sips -Z 1200 images/rada-portrait.jpg --out dist/images/rada-portrait.jpg >/dev/null
(cd dist && zip -rq ../rada-thomas-site.zip . -x ".*")
echo "Built dist/ + rada-thomas-site.zip. Deploy: drag dist/ into Cloudflare > Workers & Pages > rada-thomas > Create deployment."
