function autoSearch() {
  const search = document.querySelector('#search-query')

search.addEventListener("keyup", (event) => {
  console.log(event);
  Rails.fire(event.target, 'submit');
});

}

export {autoSearch}
