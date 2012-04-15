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
//= require jquery_nested_form

$(document).ready( function() {
  $('a.popup').click(function() {
    $('#modal-dialog').text('').load($(this).attr('href')).dialog({
      title: $(this).text(),
      modal: true,
      resizable:false,
      minWidth: 340,
      draggable:false
    });
    return false;
  });
  $('td.popup').click(function() {
    $('#modal-dialog').text('').load($(this).attr('href')).dialog({
      title: "Create a new assignment",
      modal: true,
      resizable:false,
      minWidth: 340,
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
  $('.course-lst-itm').click(function(event) {
    $('#modal-dialog').text('').load($(this).attr('href')).dialog({
      title: "Create a new assignment",
      modal: true,
      resizable:false,
      minWidth: 340,
      draggable:false
    });
    return false;
  });
});

