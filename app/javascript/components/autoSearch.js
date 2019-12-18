function autoSearch() {
  const query = document.querySelector('#query')

query.addEventListener("keyup", () => {
  Rails.fire(query.parentElement, 'submit');
});

}

export {autoSearch}
