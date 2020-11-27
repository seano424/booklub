const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar-lewagon');
  if (navbar) {
    window.addEventListener('scroll', () => {
      console.log("window.scrollY "+window.scrollY);
      console.log("window.innerHeight "+window.innerHeight);
      if (window.scrollY >= 30) {
        navbar.classList.add('navbar-black');
      } else {
        navbar.classList.remove('navbar-black');
      }
    });
  }
}

export { initUpdateNavbarOnScroll };
