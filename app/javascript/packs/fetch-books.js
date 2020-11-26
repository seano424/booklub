// <%= javascript_pack_tag 'fetch-books' %>

const form = document.querySelector('#city-name');

form.addEventListener('submit', (event) => {
  event.preventDefault(); // <-- to prevent <form>'s native behaviour
  let header = document.querySelector('.primary-header')
  const input = event.currentTarget.querySelector('.form-control');
  console.log(input.value);
  header.textContent = input.value;
  
  fetch(`https://www.googleapis.com/books/v1/volumes?q=harrypotter&key=AIzaSyB3EGuoo3CiEqrXc9DbpG6nU4ieOtR5fio`)
  .then(response => response.json())
  .then((data) => {
    console.log(data);
  });

});
