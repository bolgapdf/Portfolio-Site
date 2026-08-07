import ElementaryUI

/// A phone that cycles through the apps.
///
/// The projects grid says what was built; this shows it. Three cards of prose
/// are three claims, and one screen that moves is the thing itself.
///
/// The cycling is pure CSS — a keyframe per slide, offset by a delay. No
/// JavaScript, which matters here because the page is a WebAssembly module and
/// a carousel is not worth a second runtime.
@View
struct ShowcaseSection {
    var body: some View {
        section(.class("section showcase"), .id("showcase")) {
            div(.class("container reveal")) {
                p(.class("section-label")) { "Built recently" }
                h2(.class("section-title")) { "Shipped to my own pocket." }
                p(.class("section-subtitle")) {
                    "Apps I use every day. No mockups — these are screenshots."
                }

                div(.class("showcase-stage slides-\(ShowcaseApp.all.count)")) {
                    PhoneFrame()
                    div(.class("showcase-captions")) {
                        for (index, app) in ShowcaseApp.all.enumerated() {
                            ShowcaseCaption(app: app, index: index)
                        }
                    }
                }
            }
        }
    }
}

@View
struct PhoneFrame {
    var body: some View {
        div(.class("phone")) {
            div(.class("phone-screen")) {
                for (index, app) in ShowcaseApp.all.enumerated() {
                    img(
                        .class("showcase-shot slide-\(index)"),
                        .src(app.image),
                        .alt("\(app.name) running on iPhone"),
                        .custom(name: "loading", value: index == 0 ? "eager" : "lazy")
                    )
                }
            }
            div(.class("phone-notch")) {}
        }
    }
}

@View
struct ShowcaseCaption {
    var app: ShowcaseApp
    var index: Int

    var body: some View {
        div(.class("showcase-caption slide-\(index)")) {
            h3(.class("showcase-name")) { app.name }
            p(.class("showcase-line")) { app.line }
            p(.class("showcase-detail")) { app.detail }
            div(.class("pill-row")) {
                for tag in app.tags {
                    span(.class("pill")) { tag }
                }
            }
            a(.class("showcase-link"), .href(app.url)) { "Source ›" }
        }
    }
}

struct ShowcaseApp {
    let name: String
    let line: String
    let detail: String
    let tags: [String]
    let image: String
    let url: String

    static let all: [ShowcaseApp] = [
        ShowcaseApp(
            name: "Cartridge",
            line: "A Game Boy emulator, written from the CPU up.",
            detail: """
                Passes all 500 opcodes of the SM83 reference suite and renders \
                dmg-acid2 and cgb-acid2 pixel-for-pixel against their published \
                references.
                """,
            tags: ["Swift", "SwiftUI", "Emulation", "iOS · macOS"],
            image: "/assets/showcase/cartridge-play.png",
            url: "https://github.com/bolgapdf/Cartridge"
        ),
        ShowcaseApp(
            name: "Barbell",
            line: "A lifting tracker that follows a rotation, not a calendar.",
            detail: """
                Rotation-based scheduling, an Apple Watch companion with live \
                heart rate, and a Live Activity for the rest timer.
                """,
            tags: ["SwiftUI", "SwiftData", "watchOS", "HealthKit"],
            image: "/assets/showcase/barbell-today.png",
            url: "https://github.com/bolgapdf/Barbell"
        ),
    ]
}
