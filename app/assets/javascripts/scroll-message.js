$(function() {
  var wtf    = $('.scrollable');
  var height = wtf[0].scrollHeight;
  wtf.scrollTop(height);
});

$('#phone-simulator').on('submit', function(e){
  e.preventDefault();
  var field = $('#phone-input');
  var field_value = field.val();
  alert(field_value);
  field.val('');
});