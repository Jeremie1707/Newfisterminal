const clickCloseCreate = () => {
  document.getElementById('in-assignment-form-create-close').querySelector('button').addEventListener('click', (event) => {
    event.preventDefault();
    event.toElement.form.style.display = 'none';
  });
}
const clickCloseEdit = () => {
  document.getElementById('in-assignment-form-edit-close').querySelector('button').addEventListener('click', (event) => {
    event.preventDefault();
    event.toElement.form.style.display = 'none';
  });
}
export {clickCloseCreate, clickCloseEdit }

