#!/usr/bin/env bash
set -euo pipefail

SITE_URL="${SITE_URL:-https://beteveterinaria.com}"
LASTMOD="$(date -u +%Y-%m-%d)"

cat > web/robots.txt <<EOF
User-agent: *
Allow: /

User-agent: OAI-SearchBot
Allow: /

User-agent: ChatGPT-User
Allow: /

User-agent: Google-Extended
Allow: /

User-agent: PerplexityBot
Allow: /

User-agent: anthropic-ai
Allow: /

User-agent: Applebot-Extended
Allow: /

Sitemap: ${SITE_URL}/sitemap.xml
EOF

SITEMAP_PATHS=(
  "/"
  "/portfolio/"
  "/medico-veterinario-fortaleza/"
  "/veterinario-fortaleza/"
  "/veterinario-a-domicilio-fortaleza/"
  "/veterinario-a-domicilio-meireles/"
  "/veterinario-a-domicilio-aldeota/"
  "/veterinario-a-domicilio-sao-joao-do-tauape/"
  "/veterinario-perto-de-mim-fortaleza/"
  "/atendimento-veterinario-em-casa-fortaleza/"
  "/veterinaria-domiciliar-fortaleza/"
  "/especialista-em-felinos-fortaleza/"
  "/veterinario-regiao-metropolitana-fortaleza/"
  "/veterinario-online/"
)

{
  echo '<?xml version="1.0" encoding="UTF-8"?>'
  echo '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">'
  for path in "${SITEMAP_PATHS[@]}"; do
    priority="0.9"
    changefreq="monthly"
    if [ "$path" = "/" ]; then
      priority="1.0"
      changefreq="weekly"
    elif [ "$path" = "/portfolio/" ]; then
      priority="0.85"
      changefreq="monthly"
    elif [ "$path" = "/veterinario-a-domicilio-meireles/" ] || [ "$path" = "/veterinario-a-domicilio-aldeota/" ] || [ "$path" = "/veterinario-a-domicilio-sao-joao-do-tauape/" ]; then
      priority="0.92"
      changefreq="monthly"
    fi
    echo "  <url>"
    echo "    <loc>${SITE_URL}${path}</loc>"
    echo "    <lastmod>${LASTMOD}</lastmod>"
    echo "    <changefreq>${changefreq}</changefreq>"
    echo "    <priority>${priority}</priority>"
    echo "  </url>"
  done
  echo '</urlset>'
} > web/sitemap.xml

# Replace SITE_URL placeholders in SEO shells, llms.txt, etc.
if command -v find >/dev/null 2>&1 && command -v sed >/dev/null 2>&1; then
  while IFS= read -r -d '' file; do
    sed -i.bak "s|__SITE_URL__|${SITE_URL}|g" "$file"
    rm -f "${file}.bak"
  done < <(find web \( -name '*.html' -o -name 'llms.txt' \) -print0)
fi

echo "SEO files generated for ${SITE_URL}"
