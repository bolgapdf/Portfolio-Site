import ElementaryUI

@View
struct SkillsSection {
    var body: some View {
        section(.class("section section-alt"), .id("skills")) {
            div(.class("container reveal")) {
                p(.class("section-label")) { "Skills" }
                h2(.class("section-title")) { "Tools of the trade." }
                div(.class("skill-groups")) {
                    for group in ResumeData.skillGroups {
                        div(.class("skill-group")) {
                            p(.class("skill-group-label")) { group.label }
                            div(.class("pill-row")) {
                                for skill in group.skills {
                                    span(.class("pill")) { skill }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
