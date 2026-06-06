# Lean-to — Micro.blog Hugo theme

Context for Claude Code working **in this theme repo**. Lean-to is the active custom
theme for [machination.org](https://machination.org), a Micro.blog-hosted site. This
repo *is* the theme: Micro.blog connects to it and rebuilds the site when you push.

## The one hard constraint: Hugo 0.91

Micro.blog builds this site with **Hugo 0.91** (pinned on the Design page). Develop
and preview against 0.91 — **never** modernize template syntax to 0.140+/0.158 idioms,
or the live build breaks. (A prior theme failed in production for exactly this reason.)

| Keep using (0.91) | Do NOT switch to |
|---|---|
| `.Site.Author.avatar` | `.Site.Params.Author.avatar` |
| `paginate` in config | `pagination.pagerSize` |
| `.Paginate` / `.Paginator` | (same, fine) |
| `.RSSLink` (if needed) | `.OutputFormats.Get "RSS"` |
| Kind `taxonomyTerm` | Kind `taxonomy` |

## Local preview

**Standalone (this repo only)** — uses `exampleSite/` fixtures:
```bash
./preview.sh            # → http://localhost:1313/
```
`preview.sh` runs `klakegg/hugo:0.91.0` against `exampleSite/`, mounting the repo's
parent so `--theme=lean-to` resolves (works on a fresh `git clone` named `lean-to`).

**Against real content** — from Matt's `my-site` checkout, where this repo lives at
`themes/lean-to`:
```bash
docker run --rm -v "$(pwd)":/src -p 1313:1313 klakegg/hugo:0.91.0 server \
  --themesDir=themes --theme=lean-to,theme-blank -D --bind=0.0.0.0
```
That chains `theme-blank` for the base partials Micro.blog injects (see below).

## Template map

- `layouts/_default/baseof.html` — shell: `head` → `header` → `main` block → `sidebar`
  → `footer` + `custom_footer`. Two-column (`content-wrapper` / `content-main` / `sidebar`).
- `layouts/index.html` — homepage `h-feed`; lists `where .Site.Pages.ByDate.Reverse "Type" "post"`,
  paginated. Renders title (→ `<h2>`) only if present; otherwise just the entry. Adds
  `cat-<slug>` classes per category.
- `layouts/post/single.html` — single post (`type: post`), `h-entry` with date,
  content, categories, optional Micro.blog conversation embed.
- `layouts/_default/single.html` — plain pages (e.g. About): title + content.
- `layouts/categories/list.html` — a category's term page.
- `layouts/_default/list.html` — generic list/archive.
- Partials: `head`, `header` (avatar, title, dark/light toggle, nav), `nav`
  (Home + `.Site.Menus.main` + optional `/blog`), `sidebar` (Categories from
  `.Site.Taxonomies.categories` + Blogroll from `.Site.Data.blogroll`), `categories`
  (inline per-post category links), `footer`, `pagination`.

## Partials that come from elsewhere — do not re-create in `layouts/`

Micro.blog injects base/plugin partials its `theme-blank` provides. This theme calls:
- `microblog_head.html` (in `head.html`) and `custom_footer.html` (in `baseof.html`)
  — provided by **theme-blank** at build time.
- Plugin stubs **already committed here** as empty files so local builds don't error:
  `twitter_meta.html`, `open_graph_meta.html`, `plugin_metatags.html`.

⚠️ Do **not** add `microblog_head.html` / `custom_footer.html` to this theme's
`layouts/` — an in-theme copy would shadow Micro.blog's real one in production. For
standalone preview they are stubbed under **`exampleSite/layouts/partials/`** instead,
which Micro.blog ignores (it uses the repo as a theme and skips `exampleSite/`).

## Design conventions

- **Accent:** burnt orange (headline links, especially clippings). Defined in
  `static/css/main.css`.
- **Category hooks:** every post article gets `cat-<category-slug>` classes for
  CSS targeting. Only `cat-clippings` currently has dedicated styling (compressed
  layout, visually-hidden heading, unstyled link lists).
- **Dark/light:** `data-theme` on `<html>`, set pre-paint in `head.html` from
  `localStorage`/`prefers-color-scheme`; toggled by `static/js/theme-switcher.js`.
- **Microformats:** `h-feed` / `h-entry` / `u-url` / `dt-published` / `p-name` /
  `e-content` / `p-summary` — preserve these when editing markup (IndieWeb parsing).

## Deploy loop

1. Branch off `main`; make changes.
2. Preview at Hugo 0.91 (`./preview.sh` or the `my-site` command); screenshot/verify.
3. Diff, then open a PR to `main`. **Never push straight to `main`.**
4. After merge: in Micro.blog → Design → Edit Custom Themes → reload/sync this theme.
   (That reload is web-UI only; it can't be automated.)

## License

MIT. Derived from Bothy (MIT, Matthew Lang) and theme-blank (MIT, Micro.blog). See
`LICENSE`.
