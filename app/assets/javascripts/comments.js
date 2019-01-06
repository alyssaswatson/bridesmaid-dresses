$(document).ready(function () {
    $('#comment-link').click(function(event) {
        $('#comments-section').fadeToggle();
        $('#comment_body').focus()
    });
});