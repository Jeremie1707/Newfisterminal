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

const loadinClickClose = (element, replaceBy) => {
  document.getElementById(element).querySelector('button').addEventListener('click', (event) => {
    event.preventDefault();
    replaceElement('.div-load_in', replaceBy);
  });
}

const outAssignmentClickCloseCreate = () => {
  document.getElementById('out-assignment-form-create-close').querySelector('button').addEventListener('click', (event) => {
    event.preventDefault();
    event.toElement.form.style.display = 'none';
  });
}
const outAssignmentClickCloseEdit = () => {
  document.getElementById('out-assignment-form-edit-close').querySelector('button').addEventListener('click', (event) => {
    event.preventDefault();
    event.toElement.form.style.display = 'none';
  });
}

const loadoutClickClose = (element, replaceBy) => {
  document.getElementById(element).querySelector('button').addEventListener('click', (event) => {
    event.preventDefault();
    replaceElement('.div-load_out', replaceBy);
  });
}

export {inAssignmentClickCloseCreate, inAssignmentClickCloseEdit, loadinClickClose, outAssignmentClickCloseCreate, outAssignmentClickCloseEdit, loadoutClickClose  }

