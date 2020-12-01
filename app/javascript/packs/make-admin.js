const makeAdmin = () => {
  const form = document.querySelector(".edit_club_membership");
  if (form) {
    document.querySelector(".admin-toggle").addEventListener("click", function(){
      form.submit();
    });
  }
}

export { makeAdmin }
