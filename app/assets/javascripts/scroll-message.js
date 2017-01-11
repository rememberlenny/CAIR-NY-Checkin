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
        renderResponse(msg, "out");
        console.log( "Replying with: ", msg );
      });
  }

  function renderResponse(message, direction){
    if (direction == "in"){
      $('#phone-messages').append('<p><b>Prehave:</b> '+ message +'</p>')
    } else {
      $('#phone-messages').append('<p><b>You:</b> '+ message +'</p>')
    }
  }

  $('#phone-simulator').on('submit', function(e){
    e.preventDefault();
    var field = $('#phone-input');
    var field_value = field.val();
    renderResponse(field_value, "in");
    console.log( "Received: ", field_value );
    submitToNumber(field_value);
    field.val('');
  });
})