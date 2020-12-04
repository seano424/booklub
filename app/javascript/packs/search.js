

const changePlaceholder = () => {
  const input = document.getElementById('search-field');

  input.addEventListener('focus', (event) => {
    input.placeholder = "Search for clubs 🔭"
  })

  input.addEventListener('focusout', ()=> {
    input.placeholder = "🔍"
  })

}

export { changePlaceholder };
