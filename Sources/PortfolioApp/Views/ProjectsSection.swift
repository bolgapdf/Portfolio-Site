import ElementaryUI

@View
struct ProjectsSection {
    var body: some View {
        section(.class("section"), .id("projects")) {
            div(.class("container reveal")) {
                p(.class("section-label")) { "Projects" }
                h2(.class("section-title")) { "Things I've built." }
                p(.class("section-subtitle")) {
                    "iOS apps, widgets, and AI agents."
                }
                div(.class("grid grid-3")) {
                    for project in ResumeData.projects {
                        ProjectCard(project: project)
                    }
                }
            }
        }
    }
}

@View
struct ProjectCard {
    var project: Project

    var body: some View {
        div(.class("card project-card")) {
            div(.class("app-icon \(project.gradientClass)")) {
                span { project.glyph }
            }
            h3(.class("card-title")) { project.name }
            p(.class("card-body")) { project.description }
            div(.class("pill-row")) {
                for tag in project.tags {
                    span(.class("pill")) { tag }
                }
            }
        }
    }
}
