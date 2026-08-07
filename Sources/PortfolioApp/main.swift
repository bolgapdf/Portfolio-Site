import ElementaryUI

@View
struct Site {
    var body: some View {
        NavBar()
        main {
            Hero()
            ShowcaseSection()
            ExperienceSection()
            ProjectsSection()
            SkillsSection()
        }
        SiteFooter()
    }
}

Application(Site()).mount(in: .body)
