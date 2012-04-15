// http://www.emersonlackey.com/article/rails-ajax-validations-jquery

function validate_field(name, value, field) {
  var postData = { };
  postData['field'] = name;
  postData['value'] = value;

  var postRequestCallback =  function(data) {
    // if array has any contents it should be an error message
    var dataValid = (data[name].length == 0); 

    if (dataValid) {
        $(field).parent('p').removeClass('fieldWithErrors');
        $(field).removeClass('haag-field-with-errors');
        $(field).next('span').fadeOut(200, function() { $(this).remove(); });
    } else {
        $(field).parent('p').addClass('fieldWithErrors');
        $(field).addClass('haag-field-with-errors');
        $(field).next('span').remove();
        $(field).after('<span class="inlineError">' + data[name] + '</span>');
    }
  };

  $.post('/courses/validate', postData, postRequestCallback, 'json');
}

// General delay function, used to watch keyups,
// Taken from: http://stackoverflow.com/questions/1909441/jquery-keyup-delay
var delay = (function() {
  var timer = 0;
  return function(callback, ms) {
    clearTimeout(timer);
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

function activateLiveValidation() {
  $(".live-validatable").keyup( function() {
    var postDelayCallback = function(field_id) {
      var atribute_name = field_id.match(/_(.*)/)[1];
      field = $("#" + field_id);
      validate_field(
        atribute_name, 
        field.val(),
        field
      );
    };   
    delay(postDelayCallback(this.id), 600);
  });
    
  // Allows for AJAX
  // Taken from http://henrik.nyh.se/2008/05/rails-authenticity-token-with-jquery
  $(document).ajaxSend(function(event, request, settings) {
    if (typeof(AUTH_TOKEN) == "undefined") return;
    // settings.data is a serialized string like "foo=bar&baz=boink" (or null)
    settings.data = settings.data || "";
    settings.data += (settings.data ? "&" : "") + "authenticity_token=" + encodeURIComponent(AUTH_TOKEN);
  });    
}