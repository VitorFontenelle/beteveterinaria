#!/usr/bin/env bash
set -euo pipefail

SITE_URL="${SITE_URL:-https://beteveterinaria.pages.dev}"
LASTMOD="$(date -u +%Y-%m-%d)"

cat > web/robots.txt <<EOF
User-agent: *
Allow: /

Sitemap: ${SITE_URL}/sitemap.xml
EOF

cat > web/sitemap.xml <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
  <url>
    <loc>${SITE_URL}/</loc>
    <lastmod>${LASTMOD}</lastmod>
    <changefreq>weekly</changefreq>
    <priority>1.0</priority>
  </url>
</urlset>
EOF

if command -v sed >/dev/null 2>&1; then
  sed -i.bak "s|__SITE_URL__|${SITE_URL}|g" web/index.html
  rm -f web/index.html.bak
fi

echo "SEO files generated for ${SITE_URL}"
