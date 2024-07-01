//= require calagator

/*
  Handle ariaHidden/data-expandable
*/
window.addEventListener('DOMContentLoaded', (event) => {

  document.addEventListener("keydown", function(event) {
    if(event.key != "Escape") return;
    const menu = document.getElementById('top_menu');
    if(menu.ariaHidden == "false") {
      menu.ariaHidden = "true";
    }
  });

  document.querySelectorAll('*[data-expandable]').forEach(function(controlElement){
    controlElement.addEventListener('click', () => {
      const target = document.getElementById(controlElement.dataset.expandable);
      target.ariaHidden = target.ariaHidden == "true" ? "false" : "true";
    });
  });

  document.querySelectorAll('*[data-collapsable]').forEach(function(controlElement){
    controlElement.addEventListener('click', () => {
      const target = document.getElementById(controlElement.dataset.collapsable);
      target.ariaHidden = (target.ariaHidden == "true") ? "false" : "true";
    });
  });

});
