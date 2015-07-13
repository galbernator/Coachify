$(document).ready(function() {

  // $('#nav-button-sm-screen a').click(function(event){
  //   event.preventDefault();
  // });
  //
  // $('#nav-button a').click(function(event){
  //   event.preventDefault();
  // })

  var hamburger = $('#hamburger')

  hamburger.click(function() {
    $('html').toggleClass('menu-dropped');
  })
if ($('#nav-trigger').length != 0 ) {
    var navLinks = new Waypoint({
    element: document.getElementById('nav-trigger'),
    handler: function() {
      $('#navbar').toggleClass('color-change');
      $('#nav-button').toggleClass('white-text');
      $('#hamburger .icon-bar').toggleClass('color-change');
      }
    })

    var scrollDown = function() {
      $('#brand img').attr('src', '/assets/logo-white.png');
      $('.navbar').removeClass('animated fadeInUp');
      $('#nav-button-sm-screen').removeClass('fadeInUp');
      $('.navbar').addClass('animated fadeInDown');
      $('#nav-button-sm-screen').addClass('animated fadeInDown');
    };

    var scrollBackUp = function() {
      $('.navbar').removeClass('animated fadeInDown');
      $('#nav-button-sm-screen').removeClass('animated fadeInDown');
      $('.navbar').addClass('animated fadeInUp');
      $('#nav-button-sm-screen').addClass('animated fadeInUp');
      $('#brand img').attr('src', '/assets/logo-color.png');
    };

    var logoSwitcher = function(direction) {
      if (direction === 'down') {
        scrollDown();
      } else if (direction === 'up') {
        scrollBackUp();
        $(".navbar").html($(".navbar").html());
      }
    };

    var navLogo = new Waypoint({
      element: $('#nav-trigger'),
      handler: function(direction) {
        logoSwitcher(direction);
      }
    });

    // sticky topics on blog page
    var waypoint = new Waypoint({
      element: $('#blog-topics'),
      handler: function(direction) {
        $('#blog-topics').toggleClass('sticky');
        $('#blog-topics').fadeInDown;
      },
      offset: 72
    })
  }

  var employeeButton = $('.subject-button')

  employeeButton.click(function(e){
    e.preventDefault();
    employeeButton.removeClass('selected-subject')
    subject = $(this).attr('id')
    $('#subject-id').val(subject);
    console.log(subject);
    $(this).addClass('selected-subject');
  });

});
