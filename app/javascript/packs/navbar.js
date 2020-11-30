const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar-lewagon');
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= 45) {
        navbar.classList.add('navbar-black');
      } else {
        navbar.classList.remove('navbar-black');
      }
    });
  }
}

export { initUpdateNavbarOnScroll };
