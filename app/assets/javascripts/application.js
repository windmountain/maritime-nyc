//= require calagator

/*
  Handle ariaHidden/data-expandable
*/
window.addEventListener('DOMContentLoaded', (event) => {
  document.querySelectorAll('*[data-expandable]').forEach(function(controlElement){
    controlElement.addEventListener('click', () => {
      const target = document.getElementById(controlElement.dataset.expandable);
      target.ariaHidden = target.ariaHidden == "true" ? "false" : "true";
    });
  });
});
