// http://www.emersonlackey.com/article/rails-ajax-validations-jquery

// To add live validation to a model:
//
// 1) Create a method named 'validate' in controller with the following line:
//    render :json => ModelName.validate_field(params[:field], params[:value])
//
// 2) Add the corresponding route:
//    resources :model_name_in_plural do
//      collection { post :validate }
//    end
//
// 3) Add CSS class 'validate' to input fields
//
// 4) In the view, include a call to script_for_live_validation:
//    <%= script_for_live_validation %>  
//

function validateField(name, value, field) {
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
  
  var controller_name = field.selector.match('#([a-z]*)_')[1]
  var postUrl = '/' + controller_name + 's/validate';
  $.post(postUrl, postData, postRequestCallback, 'json');
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
  $(".validate").keyup( function() {
    var postDelayCallback = function(field_id) {
      var atribute_name = field_id.match(/_(.*)/)[1];
      field = $("#" + field_id);
      validateField(
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