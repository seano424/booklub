// <%= javascript_pack_tag 'card-hide' %>

const coverContent = document.querySelector('.cover-content');

coverContent.addEventListener('mouseover', (event) => {
  // event.target.classList.toggle('card-cover')
  console.log('over me');
})
