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
