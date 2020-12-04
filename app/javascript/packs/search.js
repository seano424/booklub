const changePlaceholder = () => {
  const input = document.getElementById("search-field");

  window.addEventListener("load", () => {
    input.value = "";
    input.placeholder = "🔍";
  });

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

  input.addEventListener("keypress", (e) => {
    if (e.key === "Enter") {
    }
  });
};

export { changePlaceholder };
