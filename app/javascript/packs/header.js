import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  const banner = document.getElementById("banner-typed-text")
  if (banner) {
    new Typed('#banner-typed-text', {
      strings: ["Book lovers &#129299;", "Booklore &#128218;", "Booklub"],
      typeSpeed: 80,
      loop: false,
      showCursor: false,
      smartBackspace: true,
    });
  }
}

export { loadDynamicBannerText };
