const makeAdmin = () => {
  const form = document.querySelector(".edit_club_membership");
  document.querySelector(".admin-toggle").addEventListener("click", function(){
    form.submit();
  });
}

export { makeAdmin }
