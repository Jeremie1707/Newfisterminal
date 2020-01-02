function showModal() {
  $('#my-modal').modal('show');
  console.log("hello Modal");

};


function destroyModal() {
  $(document).on('hidden.bs.modal', '.modal', function () {
  $(this).removeData('bs.modal');
  console.log("byebye Modal");
  });
};


export {showModal, destroyModal};

