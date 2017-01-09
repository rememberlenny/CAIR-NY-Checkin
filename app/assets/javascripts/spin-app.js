$(document).ready(function(){

  var opts = {
    lines: 3 // The number of lines to draw
  , length: 0 // The length of each line
  , width: 22 // The line thickness
  , radius: 14 // The radius of the inner circle
  , scale: .5 // Scales overall size of the spinner
  , corners: 0 // Corner roundness (0..1)
  , color: '#000' // #rgb or #rrggbb or array of colors
  , opacity: 0.25 // Opacity of the lines
  , rotate: 33 // The rotation offset
  , direction: -1 // 1: clockwise, -1: counterclockwise
  , speed: 0.7 // Rounds per second
  , trail: 95 // Afterglow percentage
  , fps: 20 // Frames per second when using setTimeout() as a fallback for CSS
  , zIndex: 2e9 // The z-index (defaults to 2000000000)
  , className: 'spinner' // The CSS class to assign to the spinner
  , top: '49%' // Top position relative to parent
  , left: '50%' // Left position relative to parent
  , shadow: true // Whether to render a shadow
  , hwaccel: true // Whether to use hardware acceleration
  , position: 'absolute' // Element positioning
  }
  var target = document.getElementById('loader')
  var spinner = new Spinner(opts).spin(target);

});