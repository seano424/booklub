const changePlaceholder = () => {
  const input = document.getElementById("search-field");

  input.addEventListener("focusin", () => {
    input.placeholder = " ";
  });

  input.addEventListener("focusin", (event) => {
    setTimeout(function () {
      input.placeholder = "Search for clubs 🔭";
    }, 400);
  });

  input.addEventListener("focusout", () => {
    input.placeholder = "🔍";
  });
};

export { changePlaceholder };
