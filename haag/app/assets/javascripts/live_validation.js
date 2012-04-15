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

function validateField(attributeName, attributeValue, field) {
  var postData = { };
  postData['attribute_name'] = attributeName;
  postData['attribute_value'] = attributeValue;

  var postRequestCallback =  function(data) {
    var form = $(field).closest('form');
    var submitButton = form.find('input').last();
    
    if (data.valid) {
        $(field).parent('p').removeClass('fieldWithErrors');
        $(field).removeClass('haag-field-with-errors');
        $(field).next('span').fadeOut(200, function() { $(this).remove(); });
        //submitButton.prop('disabled', false);
    } else {
        $(field).parent('p').addClass('fieldWithErrors');
        $(field).addClass('haag-field-with-errors');
        $(field).next('span').remove();
        $(field).after('<span class="inlineError">' + data[attributeName] + '</span>');
        //submitButton.prop('disabled', true);
    }
  
    var form = $(field).closest('form');
    var anyFieldsBlank = false;
    //$('.validate').each(function(index) {
    form.find('input').each(function(index) {
      if ($(this).val() == '')
        anyFieldsBlank = true;
    });
    
    var submitButton = form.find('input').last();   
    submitButton.prop('disabled', !data.valid || anyFieldsBlank);
  
    //submitButton.prop('disabled', !data.object_valid);
  };

  var controller_name = $(field).selector.match('#([a-z]*)_')[1]
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

    var postDelayCallback = function(field_id) {
      var atributeName = field_id.match(/_(.*)/)[1];
      var field = $("#" + field_id);
      validateField(
        atributeName, 
        field.val(),
        field
      );
    };   
  
  $(".validate").keyup( function() {
    delay(postDelayCallback(this.id), 600);
  });

  $(".validate").bind( 'dateSelected', function() {
    postDelayCallback(this.id);
    alert('yooh');
  });
      
/*  $('.validate').change( function() {    
    var noFieldsBlank = true;
    $('.validate').each(function(index) {
      if ($(this).val() == '')
        noFieldsBlank = false;
    });
    
    var form = $(this).closest('form');
    var submitButton = form.find('input').last();   
    submitButton.prop('disabled', !noFieldsBlank);
  });
  */  
  // Allows for AJAX
  // Taken from http://henrik.nyh.se/2008/05/rails-authenticity-token-with-jquery
  $(document).ajaxSend(function(event, request, settings) {
    if (typeof(AUTH_TOKEN) == "undefined") return;
    // settings.data is a serialized string like "foo=bar&baz=boink" (or null)
    settings.data = settings.data || "";
    settings.data += (settings.data ? "&" : "") + "authenticity_token=" + encodeURIComponent(AUTH_TOKEN);
  });    
}