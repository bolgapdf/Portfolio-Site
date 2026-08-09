import ElementaryUI

@View
struct Site {
    var body: some View {
        NavBar()
        main {
            Hero()
            // Same order as the nav, so the links and the scroll agree.
            ExperienceSection()
            ProjectsSection()
            SkillsSection()
            OutsideWork()
        }
        SiteFooter()
    }
}

Application(Site()).mount(in: .body)
