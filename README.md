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

If `swift --version` prints 6.2.x, that's Xcode's toolchain at `/usr/bin/swift`
shadowing the one swiftly installed. The npm scripts put `~/.swiftly/bin` first
so `npm run dev` and `npm run build` work regardless — prepending a directory
that doesn't exist is harmless, which is why the same scripts are what CI runs.
`swift` on its own in that shell will still be the wrong one.

## Develop

```sh
npm install    # also runs `swift package resolve` (preinstall)
npm run dev    # http://localhost:5173, rebuilds on Swift and CSS saves
```

Editing a view recompiles the WebAssembly module and reloads the page — a few
seconds, against roughly nine minutes for a round trip through GitHub Pages.
Worth using for anything visual.

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
