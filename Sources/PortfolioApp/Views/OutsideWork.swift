import ElementaryUI

/// A quiet sign-off between the last section and the footer.
///
/// The hero already carries a portrait, so a second photo up top would compete
/// with the name. Down here it reads as the person behind the work rather than
/// the header of the page — you've finished reading, and then you meet them.
/// Deliberately small: no section title, no call to action, one line of caption.
@View
struct OutsideWork {
    var body: some View {
        section(.class("outside")) {
            div(.class("container reveal")) {
                div(.class("outside-inner")) {
                    img(
                        .class("outside-photo"),
                        .src("/assets/family.jpg"),
                        .alt("Jacob Silva with his partner and their dog on a trail"),
                        .custom(name: "loading", value: "lazy")
                    )
                    div(.class("outside-copy")) {
                        p(.class("eyebrow")) { "Outside work" }
                        p(.class("outside-line")) { ResumeData.outsideWork }
                    }
                }
            }
        }
    }
}
