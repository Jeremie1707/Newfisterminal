const inAssignmentClickCloseCreate = () => {
  document.getElementById('in-assignment-form-create-close').querySelector('button').addEventListener('click', (event) => {
    event.preventDefault();
    event.toElement.form.style.display = 'none';
  });
}
const inAssignmentClickCloseEdit = () => {
  document.getElementById('in-assignment-form-edit-close').querySelector('button').addEventListener('click', (event) => {
    console.log(event);
    event.preventDefault();
    event.toElement.form.style.display = 'none';
  });
}

const loadinClickClose = (element, replaceBy) => {
  document.getElementById(element).querySelector('button').addEventListener('click', (event) => {
    event.preventDefault();
    replaceElement('.divLoadin', replaceBy);
  });
}


export {inAssignmentClickCloseCreate, inAssignmentClickCloseEdit, loadinClickClose }

