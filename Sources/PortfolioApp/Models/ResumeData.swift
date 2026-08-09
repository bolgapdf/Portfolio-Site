// All site copy lives here — edit text without touching any view code.

struct Role {
    let title: String
    let company: String
    let location: String
    let dates: String
    let summary: String
}

/// A language and how long it's been in use. Shown in the header, so the
/// numbers are claims a reader can ask about.
struct Language {
    let name: String
    let years: Int
}

/// One of the apps, with the screenshots that go beside it.
struct Project {
    let name: String
    let description: String
    /// What it runs on. Sits beside the name rather than in the pill row —
    /// it's the first thing someone asks, and it isn't a skill.
    let platforms: [String]
    /// What it's built out of.
    let tags: [String]
    let phoneImage: String
    /// Only for the apps that actually ship on the Mac. Absent, the row shows
    /// the phone alone rather than a window frame with nothing in it.
    let macImage: String?
    let url: String
}

struct SkillGroup {
    let label: String
    let skills: [String]
}

enum ResumeData {
    static let name = "Jacob Silva"
    static let role = "Software Engineer at Apple"
    static let location = "San Diego, California"

    static let languages: [Language] = [
        Language(name: "Java", years: 6),
        Language(name: "Python", years: 4),
        Language(name: "Swift", years: 3),
        Language(name: "JavaScript", years: 1),
        Language(name: "C#", years: 1),
    ]

    static let intro = """
        I work on deployment tooling for software engineering teams, building systems in Swift \
        that other engineering teams use to ship services on Kubernetes. Computer Science degree \
        from San Diego State, with minors in statistics and mathematics. Outside of work, I enjoy \
        working out, as well as going on hikes with my dog and partner.
        """

    /// Caption for the closing photo. Says who's in it and nothing more — the
    /// hero intro already covers the hiking, so this doesn't repeat it.
    static let outsideWork = "My partner, our dog, and me."

    static let email = "jacob@jacobsilva.me"
    static let linkedInURL = "https://www.linkedin.com/in/jacob-silva-/"
    static let gitHubURL = "https://github.com/bolgapdf"
    static let resumeURL = "/assets/resume.pdf"

    static let roles: [Role] = [
        Role(
            title: "Production Software Engineer",
            company: "Apple",
            location: "San Diego, CA",
            dates: "Jun 2026 – Nov 2026",
            summary:
                "I build deployment tooling and stage-management systems in Swift, used by teams across Apple to ship services on Kubernetes. It covers 30+ repositories and hundreds of commits a day that previously needed image tags updated by hand."
        ),
        Role(
            title: "QA Automation Engineer",
            company: "Apple",
            location: "San Diego, CA",
            dates: "Jan 2025 – Jul 2025",
            summary:
                "I built a chaos client on ToxiProxy that simulates network failures, latency spikes, and service degradation against distributed systems in CI. It reduced team debugging time by 30–40% and exposed dependency failures that testing hadn't caught."
        ),
        Role(
            title: "Technical Specialist",
            company: "Apple Retail",
            location: "La Jolla, CA",
            dates: "Oct 2025 – Present",
            summary:
                "I diagnose and repair hardware, software, and account issues across the Apple lineup, with consistent first-contact resolution and satisfaction ratings within the 90th percentile of stores."
        ),
        Role(
            title: "iOS/macOS Support Advisor",
            company: "Apple Support College Program",
            location: "San Diego, CA",
            dates: "Jan 2024 – Oct 2025",
            summary:
                "I handled iOS and macOS support by phone, and escalated distributed-system and account-infrastructure issues for root-cause investigation."
        ),
    ]

    static let projects: [Project] = [
        Project(
            name: "Cartridge",
            description: """
                A Game Boy and Game Boy Color emulator for iPhone and Mac, written from the \
                processor up in Swift. Color, sound, save states, and a library that syncs between \
                devices via iCloud. Verified against the reference test suites the emulator \
                community uses.
                """,
            platforms: ["iOS", "macOS"],
            tags: ["Swift", "SwiftUI", "Core Animation", "AVFoundation"],
            phoneImage: "/assets/showcase/cartridge-phone.png",
            macImage: "/assets/showcase/cartridge-mac.png",
            url: "https://github.com/bolgapdf/Cartridge"
        ),
        Project(
            name: "Sift",
            description: """
                Finds near-duplicate photos, not just exact copies, such as bursts, second \
                attempts, screenshots saved twice. Scans a library at ~1,000 photos a second, and \
                gives a simple interface to keep or delete photos.
                """,
            platforms: ["iOS"],
            tags: ["Swift", "SwiftUI", "PhotoKit", "Perceptual hashing"],
            phoneImage: "/assets/showcase/sift-phone.png",
            macImage: nil,
            url: "https://github.com/bolgapdf/Sift"
        ),
        Project(
            name: "Barbell",
            description: """
                A lifting tracker that follows a lifting rotation instead of a calendar set workout \
                plan, so a missed day doesn't shift everything. Apple Watch app with live heart \
                rate, and a rest timer on the Lock Screen. Logged record of lifts completed, \
                personal records, and upcoming workouts.
                """,
            platforms: ["iOS", "watchOS"],
            tags: ["Swift", "SwiftUI", "SwiftData", "HealthKit", "ActivityKit"],
            phoneImage: "/assets/showcase/barbell-phone.png",
            macImage: nil,
            url: "https://github.com/bolgapdf/Barbell"
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
                "SwiftUI", "SwiftData", "WidgetKit", "Swift Charts", "CloudKit", "HealthKit",
                "ActivityKit", "PhotoKit", "AVFoundation", "Core Animation",
            ]
        ),
        SkillGroup(
            label: "Testing",
            skills: ["Swift Testing", "XCTest", "XCUITest"]
        ),
        SkillGroup(
            label: "Backend & Infrastructure",
            skills: [
                "Server-side Swift", "Kubernetes", "Docker", "REST APIs", "CI/CD",
                "Distributed Systems", "GitHub Actions",
            ]
        ),
        SkillGroup(
            label: "Tools & Data",
            skills: [
                "Xcode", "Instruments", "Git", "PyTorch", "NumPy", "Pandas", "FastAPI",
            ]
        ),
    ]
}
