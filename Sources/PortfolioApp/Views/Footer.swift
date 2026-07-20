import ElementaryUI

@View
struct SiteFooter {
    var body: some View {
        footer(.class("footer")) {
            div(.class("container")) {
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
