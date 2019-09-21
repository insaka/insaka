document.addEventListener("DOMContentLoaded", function() {
  var donateButtons = document.querySelectorAll('.donate-button')
  var modal = document.getElementById('donate-modal');
  var close = document.getElementById('close-button');

  for (var i = 0; i < donateButtons.length; i++) {
    donateButtons[i].addEventListener('click', showModal);
  }

  close.addEventListener('click', removeModal);

  function showModal() {
    modal.classList.add('visible');

    document.addEventListener('keydown', escapeModal);
    setTimeout(function() {
      document.querySelector('#donate-form').addEventListener('click', stopPropagation);
      document.querySelector('body').addEventListener('click', removeModal);
    }, 1000);
  }

  function removeModal() {
    modal.classList.remove('visible');
    document.querySelector('body').removeEventListener('click', removeModal);
  }

  function escapeModal(e) {
    if (e.key === 'Escape') {
      removeModal();
    }
  }

  function stopPropagation(e) {
    e.stopPropagation();
  }
});