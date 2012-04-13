cal = {}

cal.newAssignmentPopup = function(event) {
  var day = event.target.getAttribute('day');
  var month = event.target.getAttribute('month');
  window.console.log('here')
  $('<div />').appendTo('body').load($(event.target).attr('href')).dialog({
    title: "New assignment"
  });
};
