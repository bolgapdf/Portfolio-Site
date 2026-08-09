import ElementaryUI

@View
struct SiteFooter {
    var body: some View {
        // The nav's Contact link lands here: the links were already the
        // contact details, they just had nothing to point at.
        footer(.class("footer"), .id("contact")) {
            div(.class("container")) {
                // Labelled, because the nav now sends people here on purpose.
                p(.class("eyebrow")) { "Contact" }
                div(.class("footer-links")) {
                    a(.href(ResumeData.linkedInURL), .target(.blank), .rel("noopener")) { "LinkedIn" }
                    a(.href(ResumeData.gitHubURL), .target(.blank), .rel("noopener")) { "GitHub" }
                    a(.href(ResumeData.resumeURL), .target(.blank)) { "Resume" }
                    a(.href("mailto:\(ResumeData.email)")) { ResumeData.email }
                }
                p(.class("footer-copy")) {
                    "© 2026 \(ResumeData.name). Built with Swift and WebAssembly."
                }
            }
        }
    }
}
