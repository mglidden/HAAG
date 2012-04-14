// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .

$(document).ready( function() {
  $('a.popup').click(function() {
    $('#modal-dialog').text('').load($(this).attr('href')).dialog({
      title: $(this).text(),
      modal: true,
      resizable:false,
      draggable:false
    });
    return false;
  });
  $('td.popup').click(function() {
    $('#modal-dialog').text('').load($(this).attr('href')).dialog({
      title: "Create a new assignment",
      modal: true,
      resizable:false,
      draggable:false
    });
    return false;
  });
  $('.cal-assignment').click(function(event) {
    $.ajax($(this).attr('href'));
    $(this).addClass('cal-completed-assignment');
    $(this).removeClass('cal-unfinished-assignment');
    return false;
  });
});








// http://www.emersonlackey.com/article/rails-ajax-validations-jquery



function validate_field(name, value, field) {
        var postData = { };
        postData['field'] = name;
        postData['value'] = value;
        $.post('/courses/validate', postData, function(data) {

          //$('#course_short_name').removeClass('haag-field-with-errors');

          // if(data.valid==false) {
          if (data[name].length > 0) {
                        $(field).parent('p').addClass('fieldWithErrors');
                        
                        $(field).addClass('haag-field-with-errors');
                        
                        $(field).next('span').remove();
                        $(field).after('<span class="inlineError">'+ data[name] +'</span>');
                }else{
                        $(field).parent('p').removeClass('fieldWithErrors');
                        $(field).removeClass('haag-field-with-errors');
                        $(field).next('span').fadeOut(200, function() { $(this).remove(); });                        
                }                                                        
        }, 'json');        
}

// General delay function, used to watch keyups,
// Taken from: http://stackoverflow.com/questions/1909441/jquery-keyup-delay
var delay = (function(){
  var timer = 0;
  return function(callback, ms){
    clearTimeout (timer);
    timer = setTimeout(callback, ms);
  };
})();

// Checks an array for a passed value
Array.prototype.in_array = function(p_val) {
        for(var i = 0, l = this.length; i < l; i++) {
                if(this[i] == p_val) {
                        return true;
                }
        }
        return false;
}

// Allows for AJAX
// Taken from http://henrik.nyh.se/2008/05/rails-authenticity-token-with-jquery
$(document).ajaxSend(function(event, request, settings) {
  if (typeof(AUTH_TOKEN) == "undefined") return;
  // settings.data is a serialized string like "foo=bar&baz=boink" (or null)
  settings.data = settings.data || "";
  settings.data += (settings.data ? "&" : "") + "authenticity_token=" + encodeURIComponent(AUTH_TOKEN);
});








