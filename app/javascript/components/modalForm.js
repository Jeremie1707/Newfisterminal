const inAssignmentClickCloseCreate = () => {
  document.getElementById('in-assignment-form-create-close').querySelector('button').addEventListener('click', (event) => {
    event.preventDefault();
    event.toElement.form.style.display = 'none';
  });
}
const inAssignmentClickCloseEdit = () => {
  document.getElementById('in-assignment-form-edit-close').querySelector('button').addEventListener('click', (event) => {
    event.preventDefault();
    event.toElement.form.style.display = 'none';
  });
}

const loadinClickCloseEdit = () => {
  document.getElementById('loadin-form-edit-close').querySelector('button').addEventListener('click', (event) => {
    event.preventDefault();
    event.toElement.form.style.display = 'none';
  });
}


export {inAssignmentClickCloseCreate, inAssignmentClickCloseEdit, loadinClickCloseEdit }

