function listSize() {
  const selectLoadin = document.querySelector('#loadin_rows')
  const form = document.querySelector('form')


selectLoadin.addEventListener("change", () => {
  console.log(form)
  console.log(selectLoadin)
  Rails.fire(form, 'submit');
});

}

export {listSize}
