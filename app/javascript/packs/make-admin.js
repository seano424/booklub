const makeAdmin = () => {
  const forms = document.querySelectorAll(".edit_club_membership");
  if (forms.length > 0) {
    forms.forEach((form) => {
      form.querySelector(".admin-toggle").addEventListener("click", function(){
        form.submit();
      });
    });
  }
}

export { makeAdmin }
