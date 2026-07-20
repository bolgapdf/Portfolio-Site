// All site copy lives here — edit text without touching any view code.

struct Role {
    let title: String
    let company: String
    let location: String
    let dates: String
    let summary: String
}

struct Project {
    let name: String
    let description: String
    let glyph: String
    let gradientClass: String
    let tags: [String]
}

struct SkillGroup {
    let label: String
    let skills: [String]
}

enum ResumeData {
    static let name = "Jacob Silva"
    static let eyebrow = "Software Engineer"
    static let tagline =
        "Software engineer at Apple. Computer Science at San Diego State University. I build iOS apps, resilient test systems, and AI experiments."

    static let email = "jacobsilva2u@gmail.com"
    static let linkedInURL = "https://www.linkedin.com/in/jacob-silva-/"
    static let gitHubURL = "https://github.com/bolgapdf"
    static let resumeURL = "/assets/Jacob-Silva-Resume.pdf"

    static let roles: [Role] = [
        Role(
            title: "Production Software Engineer",
            company: "Apple",
            location: "San Diego, CA",
            dates: "Jun 2026 – Nov 2026",
            summary:
                "Building deployment workflow tooling and stage-management systems in Swift for the Platform Apps and Technologies team, helping engineering teams across Apple ship services reliably at scale on Kubernetes."
        ),
        Role(
            title: "QA Automation Engineer",
            company: "Apple",
            location: "San Diego, CA",
            dates: "Jan 2025 – Jul 2025",
            summary:
                "Architected a Chaos Client with ToxiProxy to simulate targeted network failures, latency spikes, and service degradation in CI, cutting team debugging time 30–40% and exposing hidden dependency failures."
        ),
        Role(
            title: "Technical Specialist",
            company: "Apple Retail",
            location: "La Jolla, CA",
            dates: "Oct 2025 – Present",
            summary:
                "Diagnosed and resolved complex hardware, software, and account-level issues across the full Apple lineup, with consistent first-contact resolution and above-average satisfaction ratings."
        ),
        Role(
            title: "iOS/macOS Support Advisor",
            company: "Apple Support College Program",
            location: "San Diego, CA",
            dates: "Jan 2024 – Oct 2025",
            summary:
                "Resolved iOS and macOS issues over phone-based support with above-average satisfaction ratings, escalating distributed-system and account-infrastructure issues for root-cause investigation."
        ),
    ]

    static let projects: [Project] = [
        Project(
            name: "ClearCut",
            description:
                "A personal finance app for iOS — CloudKit-synced across devices, with Swift Charts spending insights, budget alert notifications, and CSV import.",
            glyph: "$",
            gradientClass: "gradient-green",
            tags: ["Swift", "SwiftUI", "SwiftData", "Swift Charts", "CloudKit"]
        ),
        Project(
            name: "2048 AI Agent",
            description:
                "An Expectimax agent that plays 2048, weighing probabilistic tile outcomes with board heuristics and pruning — visualized in real time via FastAPI.",
            glyph: "2048",
            gradientClass: "gradient-purple",
            tags: ["Python", "NumPy", "PyTorch", "FastAPI"]
        ),
        Project(
            name: "Classly",
            description:
                "A home-screen widget surfacing live class schedules with Core Data persistence and adaptive layouts across widget sizes and devices.",
            glyph: "◷",
            gradientClass: "gradient-orange",
            tags: ["Swift", "SwiftUI", "WidgetKit", "Core Data"]
        ),
    ]

    static let skillGroups: [SkillGroup] = [
        SkillGroup(
            label: "Languages",
            skills: ["Swift", "Python", "Java", "JavaScript", "C#"]
        ),
        SkillGroup(
            label: "iOS & Apple Frameworks",
            skills: [
                "SwiftUI", "WidgetKit", "SwiftData", "Swift Charts", "CloudKit",
                "UserNotifications", "Xcode", "Instruments",
            ]
        ),
        SkillGroup(
            label: "Backend & Infrastructure",
            skills: [
                "Server-side Swift", "Kubernetes", "Docker", "REST APIs", "CI/CD",
                "Distributed Systems",
            ]
        ),
        SkillGroup(
            label: "Data & Libraries",
            skills: ["PyTorch", "NumPy", "Pandas", "FastAPI", "Matplotlib", "Git"]
        ),
    ]
}
