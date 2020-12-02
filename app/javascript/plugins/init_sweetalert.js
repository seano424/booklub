import swal from 'sweetalert'

const initSweetalert = (selector, options = {}) => {
  const swalButton = document.querySelector(selector);
  if (swalButton) { // protect other pages
    swalButton.addEventListener('click', () => {
      swal(options);
    });
  }
};



initSweetalert('#signed-up', {
  title: "",
  text: "Welcome to Booklub! 📚🤓",
  icon: "success"
});


export { initSweetalert };
