$(document).on('ready page:load', function(event) {

  var search = function() {
    var searchTerm = $('#search-form').val();
    console.log(searchTerm);
    $.get('/blog.js?query='+searchTerm);
  };

  var searchAndClear = function() {
    search();
    $('#search-form').val('')
  };

    $("input").keypress(function(event) {
    if (event.which == 13) {
      event.preventDefault();
      searchAndClear();
      }
    });

  $('#search-button').click(function() {
      searchAndClear();
    });
  // var findIt = $('search-button').on('click',search);

});
