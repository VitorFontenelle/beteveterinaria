# beteveterinaria

A personal landing page for my wife, **Dra. Elisabete Nascimento** (@beteveterinaria) — a veterinarian based in Fortaleza, Ceará, with a postgraduate focus on feline medicine.

The site helps pet owners find her for in-home consultations in Fortaleza (and nearby cities such as Caucaia and Eusébio, with a travel fee) and for online consultations across Brazil.

Built with **Flutter Web** and designed for deployment on **Cloudflare Pages**, with technical SEO so Google can discover local veterinary searches more easily.

## Features

- Clean, brand-aligned landing page (lavanda `#9c9ad6` · rosa `#de8691`)
- WhatsApp and Instagram contact CTAs
- Sections for about, services, home-visit benefits, feline specialty, and FAQ
- Dual SEO strategy: crawlable static HTML + Flutter UI, JSON-LD (`VeterinaryCare`, FAQ), Open Graph, sitemap, and robots.txt
- Favicon / PWA icons / Open Graph image ready for a professional browser tab presence

## Local development

```bash
flutter pub get
flutter run -d chrome
```

## Build for production

```bash
# Optional: set the public site URL used in canonical tags and sitemap
export SITE_URL=https://beteveterinaria.pages.dev

bash scripts/generate_seo_files.sh
flutter build web --release --dart-define=SITE_URL=$SITE_URL
```

Output is written to `build/web/`.

> On Windows without Bash, run `flutter build web --release` after manually replacing `__SITE_URL__` in `web/index.html`, or use Git Bash / WSL for the scripts.

## Deploy to Cloudflare Pages

1. Connect this GitHub repository in the Cloudflare Pages dashboard.
2. Set **Framework preset** to **None**.
3. Configure build settings:

| Setting | Value |
|---------|-------|
| **Build command** | `bash scripts/cloudflare_build.sh` |
| **Build output directory** | `build/web` |
| **Root directory** | `/` (leave default) |

4. **Environment variables** (optional):

| Variable | Value | When to use |
|----------|-------|-------------|
| `FLUTTER_VERSION` | `stable` | Default Flutter channel |
| `SITE_URL` | `https://beteveterinaria.pages.dev` | Production URL for canonical tags, sitemap, and Open Graph |

### Alternative: deploy with Wrangler

After building locally:

```bash
npx wrangler pages deploy build/web --project-name=beteveterinaria
```

## SEO & Google discoverability

The site includes:

- Meta tags — title, description, keywords, robots, canonical, Open Graph, Twitter Card
- JSON-LD structured data — `VeterinaryCare`, `WebSite`, `WebPage`, `Person`, `FAQPage`
- `robots.txt` and `sitemap.xml` generated at build time from `SITE_URL`
- Static HTML landing copy in `web/index.html` for the first crawl wave (visually hidden after Flutter loads)
- Semantic headings, selectable text, and FAQ answers kept in the DOM

### Submit to Google Search Console

1. Go to [Google Search Console](https://search.google.com/search-console)
2. Add your property and verify ownership
3. Submit `https://your-domain/sitemap.xml`
4. Use **URL Inspection** to request indexing of the homepage

Also consider claiming a **Google Business Profile** for Fortaleza — it often has more impact on Maps / local pack than the website alone.

## Contact

- WhatsApp: [+55 85 9959-6612](https://wa.me/558599596612)
- Instagram: [@beteveterinaria](https://www.instagram.com/beteveterinaria)
- CRMV-CE 3839

## Project structure

```
lib/
  data/          # Landing copy + SEO config
  pages/         # Landing page composition
  theme/         # Brand colors, fonts, gradients
  utils/         # External link helpers
  widgets/       # Header, hero, sections, FAQ, footer
web/
  index.html     # SEO shell + static crawlable content
  _headers       # Cloudflare security / cache headers
  _redirects     # SPA fallback
  icons/         # Favicon & PWA icons
scripts/
  cloudflare_build.sh
  generate_seo_files.sh
assets/
  brand/         # Logos
  photos/        # Professional photos used on the page
```

## License

Private project for personal/family use unless otherwise noted. Feel free to fork the technical structure for your own landing pages.
