import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Book lovers", "Booklore", "Booklub"],
    typeSpeed: 80,
    loop: false,
    showCursor: false,
    smartBackspace: true,
  });
}

export { loadDynamicBannerText };
