$(document).ready(function(){
  $(function() {
    var wtf    = $('.scrollable');
    var height = wtf[0].scrollHeight;
    wtf.scrollTop(height);
  });

  function submitToNumber(message){
    var submitPath = $('#submit-path').data('path');
    $.ajax({
      method: "POST",
      url: submitPath,
      data: { message: message }
    })
      .done(function( msg ) {
        console.log( msg );
      });
  }

  $('#phone-simulator').on('submit', function(e){
    e.preventDefault();
    var field = $('#phone-input');
    var field_value = field.val();
    submitToNumber(field_value);
    field.val('');
  });
})