
{{this.autolayout(auto)}}

 
<style>
  .dndcontainer {
    color: #1f1a17;
    font-family: Georgia, "Times New Roman", serif;
    line-height: 1.7;
  }
  .dndcontainer h1 {
    font-size: clamp(2.2rem, 2vw + 2rem, 3.6rem);
    line-height: 1.05;
    letter-spacing: -0.02em;
    margin: 0 0 0.6em;
  }
  .dndcontainer h2 {
    font-size: clamp(1.6rem, 1.2vw + 1.3rem, 2.4rem);
    line-height: 1.2;
    margin: 1.4em 0 0.5em;
  }
  .dndcontainer h3 {
    font-size: clamp(1.2rem, 0.8vw + 1rem, 1.6rem);
    line-height: 1.3;
    margin: 1.3em 0 0.4em;
  }
  .dndcontainer p {
    margin: 0 0 1em;
    color: #2b2420;
  }
  .dndcontainer a {
    color: #7b2e19;
    text-decoration: underline;
    text-decoration-thickness: 2px;
    text-underline-offset: 2px;
  }
  .dndcontainer ul,
  .dndcontainer ol {
    margin: 0 0 1.2em 1.2em;
    padding: 0;
  }
  .dndcontainer li {
    margin: 0.3em 0;
  }
  .dndcontainer blockquote {
    margin: 1.2em 0;
    padding: 0.2em 1em;
    border-left: 3px solid #e0cbbf;
    background: #fff7f0;
    color: #4a3f39;
  }
  .dndcontainer hr {
    border: 0;
    border-top: 1px solid #ead7cb;
    margin: 2em 0;
  }
  .dndcontainer img {
    display: block;
    max-width: 100%;
    height: auto;
    border-radius: 14px;
    box-shadow: 0 18px 36px rgba(31, 26, 23, 0.15);
    cursor: zoom-in;
  }
  .dndcontainer figure {
    margin: 1.4em 0;
  }
  .dndcontainer figcaption {
    margin-top: 0.5em;
    font-size: 0.95rem;
    color: #5c4f48;
  }
  .dndcontainer-lightbox {
    position: fixed;
    inset: 0;
    background: rgba(15, 23, 42, 0.82);
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 24px;
    z-index: 9999;
  }
  .dndcontainer-lightbox img {
    max-width: min(96vw, 1100px);
    max-height: 90vh;
    border-radius: 16px;
    box-shadow: 0 24px 60px rgba(0, 0, 0, 0.35);
    cursor: zoom-out;
  }
</style>

<script>
  (function () {
    const root = document.querySelector(".dndcontainer");
    if (!root) return;

    const openLightbox = (img) => {
      const overlay = document.createElement("div");
      overlay.className = "dndcontainer-lightbox";
      overlay.setAttribute("role", "dialog");
      overlay.setAttribute("aria-modal", "true");
      overlay.setAttribute("aria-label", "Image preview");

      const full = document.createElement("img");
      full.src = img.currentSrc || img.src;
      full.alt = img.alt || "Expanded image";

      const close = () => {
        overlay.remove();
        document.removeEventListener("keydown", onKey);
      };

      const onKey = (event) => {
        if (event.key === "Escape") close();
      };

      overlay.addEventListener("click", close);
      full.addEventListener("click", close);
      document.addEventListener("keydown", onKey);

      overlay.appendChild(full);
      document.body.appendChild(overlay);
    };

    root.addEventListener("click", (event) => {
      const target = event.target;
      if (!(target instanceof HTMLImageElement)) return;
      openLightbox(target);
    });
  })();
</script>