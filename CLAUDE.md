# Garrek.org — Personal Website

A hand-coded personal website. The layout, typography, colors, and styling are all original — this is a creative work, not a template. Respect existing design decisions and do not introduce frameworks, libraries, or tooling that isn't already here.

## Tech Stack

- **Static site generator**: Eleventy (Node.js)
- **Template language**: Liquid
- **Markup**: Plain HTML + Markdown
- **Styling**: Single CSS file (`src/css/styles.css`) — no Sass, no preprocessors, no CSS frameworks
- **JavaScript**: None in the site output. The site uses zero client-side JavaScript. Do not add any.
- **Hosting**: Cloudflare Workers (static assets via `wrangler deploy`)
- **Plugins**: `@11ty/eleventy-plugin-rss` (Atom feed) only
- **Feeds**: Atom (`/feed.xml` via plugin) + JSON Feed v1.1 (`/feed.json` via Nunjucks template)

### Build & deploy

- `npm start` — Run Eleventy dev server with live reload
- `npm run build` — Build the site to `_site/`
- `npx wrangler deploy` — Deploy `_site/` to Cloudflare (configured in `wrangler.toml`)

## Design Principles

This site is a creative expression. Do not "improve" or "modernize" the design without being asked.

- **Minimalism**: Clean, typography-driven design with generous whitespace
- **No clutter**: No hamburger menus, no JavaScript widgets, no analytics, no cookie banners
- **Shades of blue**: The accent color palette is built around blues, with terracotta (`#d4795a`) for dark mode headings. Do not introduce other accent colors.
- **Typography first**: Libre Baskerville (serif) for body and headings; Courier Prime (monospace) for navigation; Helvetica/sans-serif for figcaptions; Menlo/Monaco for code

### Color Scheme (via `prefers-color-scheme`)

| Element | Light | Dark |
|---|---|---|
| Background | `#ffffff` | `#15252b` (deep teal) |
| Body text | `#202020` | `#d0d0d0` |
| Link underline | `#2090e0` | `#2090e0` |
| Nav links | `#1478d4` (blue) | `#5aafe6` (light blue) |
| Headings | `#000` | `#d4795a` (terracotta) |
| `<hr>` separators | `#2090e0` (blue) | `#2090e0` (blue) |

### Distinctive Link Hover Effect

Links use a thick underline that overlaps the text on hover (`text-decoration-thickness: 0.6em`, `text-underline-offset: -5px`, `text-decoration-skip-ink: none`). This is an intentional stylistic choice — do not "fix" it.

## Layout

CSS Grid with subgrid for vertical alignment:
- **Site header**: Sticky at top with border-bottom rule, spans full width. Title driven by `_data/site.json`.
- **Mobile** (< 640px): Single column, horizontal nav bar (sticky, full-width with solid background)
- **Desktop** (>= 640px): Sidebar nav (180px) + content column, max-width 800px
  - 4-row grid: header row, title row, content row, footer row
  - `main` spans rows 2–3 with `grid-template-rows: subgrid` so nav aligns with page body, not the title
  - Nav is sticky (`top: 4em`) to clear the sticky header
  - All pages wrap content in `.page-title` and `.page-body` divs
- **Photography gallery**: Full-width override via `wrapper-photo` class

### Typographic Scale (Major Third — 1.25 ratio)

| Element | Size |
|---|---|
| Site title | `1.6em` |
| h1 | `2em` |
| h2 | `1.5em` |
| h3 | `1.25em` |
| Body | `1em` (16px) |

## Site Structure

```
eleventy.config.js               # Eleventy configuration (collections, filters, passthrough)
wrangler.toml                    # Cloudflare Workers deployment config
package.json                     # Node.js dependencies
src/
  _data/site.json                # Site metadata (title, URL, author)
  _includes/
    layouts/                     # default.liquid, post.liquid, gallery.liquid
    head.liquid                  # Favicon, meta tags, feed auto-discovery links
    navigation.liquid            # Sidebar nav links
    footer.liquid                # Single-line footer: copyright + RSS + JSON Feed
  posts/                         # Blog posts (Markdown, YYYY-MM-DD-title.md)
    posts.11tydata.js            # Directory data: layout and permalink computation
  css/styles.css                 # All styling in one file
  assets/
    images/                      # Organized by section: about/, posts/, research/
    photography/small/           # Photo gallery images
    fonts/                       # Self-hosted Libre Baskerville + Courier Prime
  feed-json.njk                  # JSON Feed v1.1 template
  index.liquid                   # Home page with pagination (10 posts/page)
  writing.liquid                 # Post archive grouped by year
  photography.liquid             # Photo grid gallery (uses gallery.liquid layout)
  about.html                     # Bio, subscribe links, favorite tools
  research.html                  # Research explanation with figures
  code.html                      # Julia projects
  sports.html                    # Kettlebell sport (Sport Rank 2) and running records
  404.html                       # Error page
```

## Posts

### Front matter

Keep it minimal — only `title` and `date` (layout is set by `posts.11tydata.js`):

```yaml
---
title: "Post Title Here"
date: 2025-01-15
---
```

### Permalink structure

Posts use the pattern `/:year/:month/:day/:slug.html` (e.g., `/2025/01/15/post-title.html`). This is computed in `posts.11tydata.js` and matches the old Jekyll URL structure.

### Writing conventions

- Posts range from short link posts (a few sentences linking to an article) to long-form essays
- HTML is used directly in Markdown for figures, line breaks, and structured content
- Em dashes: `&mdash;` (not `—` or `--`)
- HTML entities for special characters: `&times;`, `&ndash;`, `&emsp;`
- Footnotes use `[^fn_YYYYMMDD_N]` naming convention
- References at the end of a post are separated by a `<br>` tag, listed as plain Markdown links
- Technical/reference sections use `<hr class="ref">` as a separator

### Figures

Always use HTML `<figure>` elements, not Markdown image syntax:

```html
<figure>
    <img src="/assets/images/posts/filename.png" alt="Descriptive alt text"/>
    <figcaption>Caption text here.</figcaption>
</figure>
```

For right-floated figures (wraps text around image, max 40% width):

```html
<figure class="right">
    <img src="/assets/images/about/image.jpeg" alt="Alt text"/>
</figure>
```

### Image naming

Images use size prefixes: `small-`, `medium-800px-`, `large-1200px-`.

### Date display

Posts display dates as: `Thursday, September 03 2025` (via `date` filter with `'%A, %B %d %Y'`).
The writing archive uses: `03 Sep 2025` (via `date` filter with `'date_to_string'`).

## What Not to Do

- Do not add client-side JavaScript
- Do not add CSS preprocessors, frameworks, or utility classes
- Do not add syntax highlighting (intentionally disabled)
- Do not change fonts, colors, or spacing without being asked
- Do not add new Eleventy plugins without being asked
- Do not restructure the single-file CSS into multiple files
- Do not add `<meta>` description/SEO tags to individual posts — the site is deliberately simple
- Do not use Markdown image syntax `![]()`; use HTML `<figure>` elements
- Do not change the link hover effect
