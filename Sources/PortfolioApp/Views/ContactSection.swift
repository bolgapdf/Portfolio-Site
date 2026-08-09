import ElementaryUI

/// Contact: the photo and the ways to reach me, in one section.
///
/// These used to be two things: a photo band with a caption and three feet of
/// empty space beside it, and a row of bare text links in the footer. Merged,
/// the photo fills the left of a real section and the cards fill the right, so
/// neither is padding for the other. It also gives the nav's Contact item
/// somewhere substantial to land.
@View
struct ContactSection {
    var body: some View {
        section(.class("section section-alt"), .id("contact")) {
            div(.class("container reveal")) {
                h2(.class("section-title")) { "Contact" }

                div(.class("contact-inner")) {
                    figure(.class("contact-figure")) {
                        img(
                            .class("contact-photo"),
                            .src("/assets/family.jpg"),
                            .alt("Jacob Silva with his partner and their dog on a trail"),
                            .custom(name: "loading", value: "lazy")
                        )
                        figcaption(.class("contact-caption")) { ResumeData.outsideWork }
                    }

                    div(.class("contact-links")) {
                        for link in ResumeData.contactLinks {
                            ContactCard(link: link)
                        }
                    }
                }
            }
        }
    }
}

@View
struct ContactCard {
    var link: ContactLink

    var body: some View {
        // Split on the attribute rather than the content: mailto should hand
        // off to a mail client in place, the rest should leave the page up.
        if link.opensInNewTab {
            a(.class("contact-card"), .href(link.url), .target(.blank), .rel("noopener")) {
                ContactCardBody(link: link)
            }
        } else {
            a(.class("contact-card"), .href(link.url)) {
                ContactCardBody(link: link)
            }
        }
    }
}

@View
struct ContactCardBody {
    var link: ContactLink

    /// The mark is a CSS mask rather than an inline `<svg>`: ElementaryUI has
    /// no mountable conformance for SVG elements, and a mask still inherits
    /// `currentColor`, so the icon picks up the card's hover state for free.
    private var iconClass: String {
        switch link.icon {
        case .email: "contact-icon icon-email"
        case .resume: "contact-icon icon-resume"
        case .gitHub: "contact-icon icon-github"
        case .linkedIn: "contact-icon icon-linkedin"
        }
    }

    var body: some View {
        span(.class(iconClass), .custom(name: "aria-hidden", value: "true")) {}
        span(.class("contact-text")) {
            span(.class("contact-label")) { link.label }
            span(.class("contact-detail")) { link.detail }
        }
    }
}
