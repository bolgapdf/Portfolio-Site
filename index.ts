import "./Sources/PortfolioApp/Styles/theme.css";
import { runApplication } from "elementary-ui-browser-runtime";
import appInit from "virtual:swift-wasm?init";

// Fade/slide-in sections as they enter the viewport. Content stays fully
// visible unless the `js-reveal` class is armed here, so nothing can get
// stuck hidden if observation fails.
function armRevealOnScroll() {
  if (!("IntersectionObserver" in window)) return;
  document.documentElement.classList.add("js-reveal");

  const observer = new IntersectionObserver(
    (entries) => {
      for (const entry of entries) {
        if (entry.isIntersecting) {
          entry.target.classList.add("is-visible");
          observer.unobserve(entry.target);
        }
      }
    },
    { threshold: 0.15, rootMargin: "0px 0px -40px 0px" },
  );

  const observeNew = () => {
    document.querySelectorAll(".reveal:not([data-observed])").forEach((el) => {
      el.setAttribute("data-observed", "");
      observer.observe(el);
    });
  };

  observeNew();
  new MutationObserver(observeNew).observe(document.body, {
    childList: true,
    subtree: true,
  });
}

armRevealOnScroll();
await runApplication(appInit);
