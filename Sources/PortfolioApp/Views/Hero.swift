import ElementaryUI

/// Name, role, where, what languages, what I do. In that order, because that's
/// the order someone reads a person's page in.
@View
struct Hero {
    var body: some View {
        section(.class("hero"), .id("top")) {
            div(.class("container reveal")) {
                h1(.class("hero-name")) { ResumeData.name }
                p(.class("hero-role")) { ResumeData.role }
                p(.class("hero-location")) { ResumeData.location }

                div(.class("lang-row")) {
                    for language in ResumeData.languages {
                        span(.class("lang")) {
                            span(.class("lang-name")) { language.name }
                            span(.class("lang-years")) {
                                " · \(language.years) \(language.years == 1 ? "yr" : "yrs")"
                            }
                        }
                    }
                }

                p(.class("hero-intro")) { ResumeData.intro }
                a(.class("hero-cta"), .href("#projects")) { "View my work ›" }
            }
        }
    }
}
