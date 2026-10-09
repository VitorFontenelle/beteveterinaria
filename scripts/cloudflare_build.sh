#!/usr/bin/env bash
set -euo pipefail

# Cloudflare Pages has no Flutter pre-installed — install it before building.
FLUTTER_VERSION="${FLUTTER_VERSION:-stable}"
FLUTTER_DIR="${FLUTTER_DIR:-$HOME/flutter}"

if [ ! -d "$FLUTTER_DIR/.git" ]; then
  git clone https://github.com/flutter/flutter.git -b "$FLUTTER_VERSION" --depth 1 "$FLUTTER_DIR"
fi

export PATH="$FLUTTER_DIR/bin:$PATH"

bash scripts/generate_seo_files.sh

flutter --version
flutter config --enable-web
flutter pub get
flutter build web --release --dart-define=SITE_URL="${SITE_URL:-https://beteveterinaria.com}"

if [ -f web/robots.txt ]; then
  cp web/robots.txt build/web/robots.txt
fi
if [ -f web/sitemap.xml ]; then
  cp web/sitemap.xml build/web/sitemap.xml
fi
if [ -f web/llms.txt ]; then
  cp web/llms.txt build/web/llms.txt
fi
if [ -f web/_redirects ]; then
  cp web/_redirects build/web/_redirects
fi
