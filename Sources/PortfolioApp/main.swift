import ElementaryUI

@View
struct Site {
    var body: some View {
        NavBar()
        main {
            Hero()
            // Projects before experience: it's the section the header's call to
            // action points at, and the strongest thing on the page.
            ProjectsSection()
            ExperienceSection()
            SkillsSection()
        }
        SiteFooter()
    }
}

Application(Site()).mount(in: .body)
