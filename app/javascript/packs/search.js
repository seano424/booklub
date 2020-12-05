const changePlaceholder = () => {
  const input = document.getElementById("search-field");
  window.addEventListener("load", () => {
    input.value = "";
  });
};

export { changePlaceholder };
