$(document).ready(function() {

  var search = function() {
    var searchTerm = $('#search-form').val();
    $.get('/blog.js?query=' + searchTerm);
  };

  var blah = $('search-button').on('click', search);



});
