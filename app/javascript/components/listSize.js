function listSize() {
  const selectLoadin = document.querySelector('#loadin_rows')
  const form = document.querySelector('#loadin-set-rows-form')

  // à modifier pour que le form soumis soit le bon,
  // trouver un moyen de donner un id ou une classe
  // à un form tag


selectLoadin.addEventListener("change", () => {
  console.log(form)
  console.log(selectLoadin)
  Rails.fire(form, 'submit');
});

}

export {listSize}
