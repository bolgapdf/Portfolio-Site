import ElementaryUI

/// One section per app, each with its own devices.
///
/// This started as a single phone cycling through all three, which is a nice
/// effect and the wrong idea: it gives every app a third of a screen and asks
/// the reader to wait their turn. An app is worth a section.
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
            }

            for (index, app) in ShowcaseApp.all.enumerated() {
                AppShowcase(app: app, index: index)
            }
        }
    }
}

@View
struct AppShowcase {
    var app: ShowcaseApp
    var index: Int

    /// Alternating sides, so a column of sections doesn't read as a list.
    private var rowClass: String {
        index.isMultiple(of: 2) ? "showcase-row" : "showcase-row flipped"
    }

    var body: some View {
        div(.class("container")) {
            div(.class("\(rowClass) reveal")) {
                div(.class("showcase-devices")) {
                    if let mac = app.macImage {
                        MacFrame(image: mac, name: app.name)
                        PhoneFrame(image: app.phoneImage, name: app.name, inset: true)
                    } else {
                        PhoneFrame(image: app.phoneImage, name: app.name, inset: false)
                    }
                }

                div(.class("showcase-copy")) {
                    h3(.class("showcase-name")) { app.name }
                    p(.class("showcase-line")) { app.line }
                    p(.class("showcase-detail")) { app.detail }
                    div(.class("pill-row")) {
                        for tag in app.tags {
                            span(.class("pill")) { tag }
                        }
                    }
                    a(.class("showcase-link"), .href(app.url)) { "Source on GitHub ›" }
                }
            }
        }
    }
}

@View
struct PhoneFrame {
    var image: String
    var name: String
    /// Set when a Mac is behind it, which makes the phone the smaller of the
    /// two and moves it into the corner.
    var inset: Bool

    var body: some View {
        div(.class(inset ? "phone phone-inset" : "phone")) {
            div(.class("phone-screen")) {
                img(
                    .class("device-shot"),
                    .src(image),
                    .alt("\(name) on iPhone"),
                    .custom(name: "loading", value: "lazy")
                )
            }
            div(.class("phone-notch")) {}
        }
    }
}

@View
struct MacFrame {
    var image: String
    var name: String

    var body: some View {
        div(.class("mac")) {
            div(.class("mac-bar")) {
                span(.class("mac-dot red")) {}
                span(.class("mac-dot amber")) {}
                span(.class("mac-dot green")) {}
            }
            div(.class("mac-screen")) {
                img(
                    .class("device-shot"),
                    .src(image),
                    .alt("\(name) on Mac"),
                    .custom(name: "loading", value: "lazy")
                )
            }
        }
    }
}

struct ShowcaseApp {
    let name: String
    let line: String
    let detail: String
    let tags: [String]
    let phoneImage: String
    /// Only for the apps that genuinely ship on the Mac. Absent, the section
    /// renders the phone alone rather than a window frame with nothing in it.
    let macImage: String?
    let url: String

    static let all: [ShowcaseApp] = [
        ShowcaseApp(
            name: "Cartridge",
            line: "A Game Boy emulator, written from the CPU up.",
            detail: """
                Passes all 500 opcodes of the SM83 reference suite, and renders \
                dmg-acid2 and cgb-acid2 pixel-for-pixel against their published \
                references. Colour, sound, save states, and a library that syncs.
                """,
            tags: ["Swift", "SwiftUI", "Emulation", "iOS · macOS"],
            phoneImage: "/assets/showcase/cartridge-phone.png",
            macImage: nil,
            url: "https://github.com/bolgapdf/Cartridge"
        ),
        ShowcaseApp(
            name: "Sift",
            line: "Finds the photo you meant to take once and took eleven times.",
            detail: """
                Perceptual hashing behind a band index, so 10,500 photos take \
                11 seconds instead of 55 million comparisons. It found 652 \
                groups holding 1,087 redundant copies in my own library.
                """,
            tags: ["Swift", "PhotoKit", "Perceptual hashing", "iOS"],
            phoneImage: "/assets/showcase/sift-phone.png",
            macImage: nil,
            url: "https://github.com/bolgapdf/Sift"
        ),
        ShowcaseApp(
            name: "Barbell",
            line: "A lifting tracker that follows a rotation, not a calendar.",
            detail: """
                Rotation-based scheduling that survives a missed week, an Apple \
                Watch companion with live heart rate, and a Live Activity for \
                the rest timer.
                """,
            tags: ["SwiftUI", "SwiftData", "watchOS", "HealthKit"],
            phoneImage: "/assets/showcase/barbell-phone.png",
            macImage: nil,
            url: "https://github.com/bolgapdf/Barbell"
        ),
    ]
}
