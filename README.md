# Lean-to

A Hugo theme for Micro.blog, derived from [Bothy](https://github.com/matthewl/bothy).

## About

Lean-to is a customized theme based on Bothy. A lean-to is the regional equivalent in the northeastern United States of what a bothy commonly refers to in Scotland—a simple shelter.

## Features

Built on Bothy's foundation, Lean-to adds:

- **Two-column layout** with responsive sidebar
- **Sidebar sections** for Categories and Blogroll ("Regular Reads")
- **Category-based article classes** (e.g., `cat-clippings`, `cat-links`) for targeted styling
- **Clippings post styling**: visually hidden headings, compressed layout, burnt orange headline links
- **Blogroll support** via `data/blogroll.yaml`

## Usage

Place in your `themes/` directory and configure in Hugo or select via Micro.blog.

## Local development

Micro.blog builds with **Hugo 0.91** — develop and preview against that version (newer
template syntax can break the live build). A bundled `exampleSite/` lets you preview
the theme standalone:

```bash
./preview.sh        # → http://localhost:1313/  (uses Docker + Hugo 0.91)
```

See [`CLAUDE.md`](CLAUDE.md) for the template map, design conventions, the Hugo 0.91
syntax constraints, and the deploy/reload loop.

### Blogroll

Create `data/blogroll.yaml`:

```yaml
- name: Example Site
  url: https://example.com/
  description: A brief description
```

## Credits

- Original [Bothy Theme](https://github.com/matthewl/bothy) by [Matthew Lang](http://micro.blog/matthewlang)
- Lean-to customizations by [Matthew Bradley](https://machination.org)

## License

MIT License. See [LICENSE](LICENSE) for details.
