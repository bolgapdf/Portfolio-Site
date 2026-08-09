import ElementaryUI

/// Just the colophon. The links that used to live here are the Contact
/// section now, where they get room to be read rather than skimmed past.
@View
struct SiteFooter {
    var body: some View {
        footer(.class("footer")) {
            div(.class("container")) {
                p(.class("footer-copy")) {
                    "© 2026 \(ResumeData.name). Built with Swift and WebAssembly."
                }
            }
        }
    }
}
