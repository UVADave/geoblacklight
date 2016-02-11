Blacklight.onLoad(function() {
  $('[data-map="home"]').each(function(i, element) {

    var geoblacklight = new GeoBlacklight.Viewer.Map(this),
        data = $(this).data();

    geoblacklight.map.addControl(L.control.geosearch({
      baseUrl: data.catalogPath,
      dynamic: false,
      searcher: function() {
        window.location.href = this.getSearchUrl();
      },
      staticButton: '<a class="btn orange darken-2">Search here</a>'
    }));
  });
  show_intro();
  $('.button-collapse').sideNav({
    menuWidth: 450, // Default is 240
    edge: 'left', // Choose the horizontal origin
    closeOnClick: true // Closes side-nav on <a> clicks, useful for Angular/Meteor
  });
  $(".menu-link").click(function(){
      var $this = $(this);
      $this.toggleClass('SeeMore');
      if($this.hasClass('SeeMore')){
          $this.text('Show');
      } else {
          $this.text('Hide');
      }
    $("#menu").toggleClass("active");
    $("#toggle-sidenav").toggleClass("active");
  });

  function show_intro() {
    if (localStorage.getItem('intro_shown')) {
      // already shown
      return
    }
    localStorage.setItem('intro_shown', true);
    introJs().setOption("tooltipPosition", "auto").start();
    }

});
