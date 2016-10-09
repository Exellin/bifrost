/*global $*/
$(document).ready(function() {
  
  $('#nav-toggle').click(function() {
    $('.link-container ul').slideToggle();
    this.classList.toggle('active');
  });
  
});