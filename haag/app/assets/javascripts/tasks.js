tasks = {}

tasks.finishClick = function() {
    $.ajax($(this).attr('href'));
    $(this).addClass('cal-completed-assignment');
    $(this).removeClass('cal-unfinished-assignment');
    $(this).unbind();
    $(this).click(tasks.unfinishClick);
    $(this).css('background-color', $(this).attr('finishedColor'));
    return false;
}

tasks.unfinishClick = function() {
    $.ajax($(this).attr('href'));
    $(this).addClass('cal-unfinished-assignment');
    $(this).removeClass('cal-completed-assignment');
    $(this).unbind();
    $(this).click(tasks.finishClick);
    $(this).css('background-color', $(this).attr('color'));
    return false;
}
