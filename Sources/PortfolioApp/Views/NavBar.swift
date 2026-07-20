import ElementaryUI

@View
struct NavBar {
    var body: some View {
        header(.class("nav")) {
            div(.class("nav-inner")) {
                a(.class("nav-name"), .href("#top")) { ResumeData.name }
                nav(.class("nav-links")) {
                    a(.href("#experience")) { "Experience" }
                    a(.href("#projects")) { "Projects" }
                    a(.href("#skills")) { "Skills" }
                    a(.href(ResumeData.resumeURL), .target(.blank)) { "Resume" }
                }
            }
        }
    }
}
