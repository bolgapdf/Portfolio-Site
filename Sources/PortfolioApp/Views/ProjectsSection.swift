import ElementaryUI

/// The projects, each with the devices it runs on.
///
/// This replaced a grid of three text cards. The cards described the apps; this
/// shows them, and a screenshot answers "is this real" faster than any sentence.
@View
struct ProjectsSection {
    var body: some View {
        section(.class("section"), .id("projects")) {
            div(.class("container reveal")) {
                p(.class("section-label")) { "Projects" }
                h2(.class("section-title")) { "Things I've built." }
                p(.class("section-subtitle")) {
                    "Apps I use every day. These are screenshots, not mockups."
                }
            }

            for (index, project) in ResumeData.projects.enumerated() {
                ProjectRow(project: project, index: index)
            }
        }
    }
}

@View
struct ProjectRow {
    var project: Project
    var index: Int

    /// Alternating sides, so a column of rows doesn't read as a list.
    private var rowClass: String {
        index.isMultiple(of: 2) ? "showcase-row" : "showcase-row flipped"
    }

    var body: some View {
        div(.class("container")) {
            div(.class("\(rowClass) reveal")) {
                div(.class("showcase-devices")) {
                    if let mac = project.macImage {
                        MacFrame(image: mac, name: project.name)
                        PhoneFrame(image: project.phoneImage, name: project.name, inset: true)
                    } else {
                        PhoneFrame(image: project.phoneImage, name: project.name, inset: false)
                    }
                }

                div(.class("showcase-copy")) {
                    h3(.class("showcase-name")) { project.name }
                    p(.class("showcase-line")) { project.line }
                    p(.class("showcase-detail")) { project.description }
                    div(.class("pill-row")) {
                        for tag in project.tags {
                            span(.class("pill")) { tag }
                        }
                    }
                    a(.class("showcase-link"), .href(project.url)) { "Source on GitHub ›" }
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
        // No drawn window chrome: the screenshot is of a real window and
        // already has its own.
        div(.class("mac")) {
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
