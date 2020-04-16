function showModal() {
  $('#my-modal').modal('show');
};


function destroyModal() {
  $(document).on('hidden.bs.modal', '.modal', function () {
  $(this).removeData('bs.modal');
  });
};


export {showModal, destroyModal};

