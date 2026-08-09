import ElementaryUI

@View
struct ExperienceSection {
    var body: some View {
        section(.class("section section-alt"), .id("experience")) {
            div(.class("container reveal")) {
                h2(.class("section-title")) { "Experience" }
                div(.class("grid grid-2")) {
                    for role in ResumeData.roles {
                        RoleCard(role: role)
                    }
                }
            }
        }
    }
}

@View
struct RoleCard {
    var role: Role

    var body: some View {
        div(.class("card")) {
            h3(.class("card-title")) { role.title }
            p(.class("card-meta")) { "\(role.company) · \(role.location)" }
            p(.class("card-dates")) { role.dates }
            p(.class("card-body")) { role.summary }
        }
    }
}
