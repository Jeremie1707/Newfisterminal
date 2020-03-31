const initFlatpickr = () => {
  if(document.querySelectorAll('.datepicker').length > 0) {
    flatpickr(".datepicker", {
      enableTime: true,
      // Select the altvailable meetings dates from groups/show.html.erb file
      // minDate: "today",
      defaultHour: 8,
      altInput: true
    });
  }
}
export { initFlatpickr };
