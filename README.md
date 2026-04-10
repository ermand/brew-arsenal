# Ermand’s Brew Arsenal

A single-file, dark-themed dashboard for the [Homebrew](https://brew.sh) **formulae** and **casks** on my machine. It’s a visual catalog with search, categories, and links to each project—no build step, no backend.

**Repository:** [github.com/ermand/brew-arsenal](https://github.com/ermand/brew-arsenal)

[![Lint HTML](https://github.com/ermand/brew-arsenal/actions/workflows/lint-html.yml/badge.svg)](https://github.com/ermand/brew-arsenal/actions/workflows/lint-html.yml)

On every push and pull request to `main`, [HTMLHint](https://htmlhint.com/) runs against [`index.html`](./index.html) (see [`.github/workflows/lint-html.yml`](./.github/workflows/lint-html.yml)).

---

## Features

- **Header stats** — Total packages, formulae count, and casks count (computed from the data in the page).
- **Search** — Filter packages by name or description.
- **Category chips** — Browse by tag (Shell, CLI Tools, Git, Media, etc.).
- **Grid and list views** — Toggle layout without losing filters.
- **Cards** — Short description, category pill, formula vs cask label, and a GitHub (or upstream) link when available.

---

## Try it locally

```bash
git clone git@github.com:ermand/brew-arsenal.git
cd brew-arsenal
open index.html   # macOS
# or double-click the file / drag into a browser
```

---

## Install the same packages (Brewfile)

The repo includes a [`Brewfile`](./Brewfile) that matches [`index.html`](./index.html): Homebrew **formulae** and **casks** in one place for [`brew bundle`](https://docs.brew.sh/Manpage#bundle-subcommand).

```bash
cd brew-arsenal
brew bundle install --file=Brewfile
```

Or run the helper script (same thing):

```bash
./install.sh
```

Check what would be installed or see drift without installing:

```bash
brew bundle check --file=Brewfile   # exit 1 if something is missing
brew bundle list   --file=Brewfile   # print formulae and casks
```

Some names may live on third-party taps; if `brew bundle` reports “Unable to resolve”, add the tap Homebrew suggests, then run the command again.

When you add or remove packages in the HTML, update the `Brewfile` (and this section’s commands stay the same).

---

## Publish with GitHub Pages (optional)

1. Repo → **Settings** → **Pages**.
2. **Build and deployment**: deploy from the `main` branch, root or `/docs` as you prefer.
3. After the first deploy, the page is typically at  
   `https://ermand.github.io/brew-arsenal/`  
   (exact URL depends on your Pages configuration.)

---

## Customizing the list

Package data lives in the `packages` array near the bottom of [`index.html`](./index.html). Each entry looks like:

```js
{ n: "name", t: "formula" | "cask", c: "Category", d: "Short description", gh: "https://..." }
```

After editing, refresh the browser. Update the “last updated” line in the header (`~ brew list · last updated …`) if you want that metadata to stay honest. Keep [`Brewfile`](./Brewfile) in sync if you use `brew bundle` to reproduce the stack. Use **`index.html`** as the site entry file so static hosts (Forge, GitHub Pages, nginx `index`) serve it at `/`.

---

## Stack

- Plain **HTML**, **CSS**, and **JavaScript** (no frameworks).
- Fonts: [Instrument Serif](https://fonts.google.com/specimen/Instrument+Serif), [DM Sans](https://fonts.google.com/specimen/DM+Sans), [DM Mono](https://fonts.google.com/specimen/DM+Mono) (loaded from Google Fonts).

---

## License

This repo is a personal snapshot UI; add a license file if you intend to share it under explicit terms.
