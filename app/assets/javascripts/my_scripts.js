$(document).ready(function() {

  var hamburger = $('#hamburger')

  hamburger.click(function() {
    $('html').toggleClass('menu-dropped');
  })

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
    $('#nav-button-sm-screen').removeClass('animated fadeInUp');
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

  // var $window = $(window),
  //     $changedEl1 = $('#navbar')
  //     $changedEl2 = $('.navbar-fixed-top .navbar-toggle .icon-bar')
  //     $changedEl3 = $('#brand img')
  //     $triggerEl = $('#header-done'),
  //     elTop = $triggerEl.offset().top -28;
  //
  // var scrollChange = function() {
  //   $window.scroll(function() {
  //        $changedEl1.toggleClass('color-change', $window.scrollTop() > elTop);
  //        $changedEl2.toggleClass('color-change', $window.scrollTop() > elTop);
  //    });
  //  }
  //
  // scrollChange();
  //
  // $(window).resize(function() {
  //   scrollChange();
  //    });


});
