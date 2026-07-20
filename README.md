# jacobsilva.me

Personal portfolio site, built with [ElementaryUI](https://github.com/elementary-swift/elementary-ui) —
Swift compiled to WebAssembly, running natively in the browser.

## Stack

- **ElementaryUI** — SwiftUI-inspired views (`@View`, `var body: some View`) rendered to the DOM
- **Vite** + [`vite-plugin-swift-wasm`](https://github.com/elementary-swift/vite-plugin-swift-wasm) — dev server with Swift hot reload, release bundling with Embedded Swift
- **Plain CSS** ([theme.css](Sources/PortfolioApp/Styles/theme.css)) — Apple-inspired dark design
- **GitHub Actions → GitHub Pages** — builds and deploys `dist/` on every push to `main`

## Prerequisites

- Swift 6.3+ with the matching Swift SDK for WebAssembly ([wasm getting started](https://www.swift.org/documentation/articles/wasm-getting-started.html))
- Node.js 22+
- `wasm-opt` (optional, `brew install binaryen`)

```sh
# verify — should print swift-6.3.1-RELEASE (or later)
swift --version
# should list swift-6.3.1-RELEASE_wasm and _wasm-embedded
swift sdk list
```

## Develop

```sh
npm install    # also runs `swift package resolve` (preinstall)
npm run dev    # dev server with hot reload on Swift file saves
```

## Build & preview

```sh
npm run build
npm run preview
```

## Editing content

All copy (roles, projects, skills, links) lives in
[ResumeData.swift](Sources/PortfolioApp/Models/ResumeData.swift) — edit text there
without touching the views. Layout lives in [Views/](Sources/PortfolioApp/Views/),
design tokens in [theme.css](Sources/PortfolioApp/Styles/theme.css).

The custom domain is set by [public/CNAME](public/CNAME), which Vite copies into the
deployed output.
