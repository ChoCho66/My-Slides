document.addEventListener("DOMContentLoaded", function () {
  document.querySelectorAll('.fragment').forEach(function (element) {
    element.classList.add('custom');
    if (element.closest('.agenda')) {
      element.className = "agenda list";
    }
  });
});