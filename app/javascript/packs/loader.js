const loader = () => {
  const search = document.querySelector(".api-call")
  if (search) {
    search.addEventListener("submit", (event) => {
      document.getElementById("loader").classList.toggle("d-none");
    });
  }
}

export { loader }
