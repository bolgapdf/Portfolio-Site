import ElementaryUI

@View
struct Hero {
    var body: some View {
        section(.class("hero"), .id("top")) {
            div(.class("container reveal")) {
                p(.class("eyebrow")) { ResumeData.eyebrow }
                h1(.class("hero-name")) { ResumeData.name }
                p(.class("hero-tagline")) { ResumeData.tagline }
                a(.class("hero-cta"), .href("#projects")) { "View my work ›" }
            }
        }
    }
}
