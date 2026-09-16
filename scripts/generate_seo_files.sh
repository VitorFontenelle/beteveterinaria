#!/usr/bin/env bash
set -euo pipefail

SITE_URL="${SITE_URL:-https://beteveterinaria.com}"
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
  <url>
    <loc>${SITE_URL}/medico-veterinario-fortaleza/</loc>
    <lastmod>${LASTMOD}</lastmod>
    <changefreq>monthly</changefreq>
    <priority>0.9</priority>
  </url>
  <url>
    <loc>${SITE_URL}/veterinario-a-domicilio-fortaleza/</loc>
    <lastmod>${LASTMOD}</lastmod>
    <changefreq>monthly</changefreq>
    <priority>0.9</priority>
  </url>
  <url>
    <loc>${SITE_URL}/veterinario-online/</loc>
    <lastmod>${LASTMOD}</lastmod>
    <changefreq>monthly</changefreq>
    <priority>0.9</priority>
  </url>
</urlset>
EOF

# Replace SITE_URL placeholders in all SEO HTML shells (home + service pages).
if command -v find >/dev/null 2>&1 && command -v sed >/dev/null 2>&1; then
  while IFS= read -r -d '' file; do
    sed -i.bak "s|__SITE_URL__|${SITE_URL}|g" "$file"
    rm -f "${file}.bak"
  done < <(find web -name '*.html' -print0)
fi

echo "SEO files generated for ${SITE_URL}"
