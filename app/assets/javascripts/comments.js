$(document).ready(function () {
    $('#comment-link').click(function(event) {
        $('#comments-section').toggleClass("hidden unhidden");
        $('#comment_body').focus();

        var url = $(this).data("url")
        $.get(url)
          .done(function( data ) {
              $('#comments').html("");
    
            $.each(data, function(index, value) {
                var newComment = new Comment(value, url);
                
                var commentHtml = newComment.formatDisplay();
                  $('#comments').append(commentHtml)
                });
    
          });
    });
});

function Comment(comment, url) {
	this.id = comment.id
    this.comment = comment.comment
    this.dressId = comment.dress_id
	this.commentUrl = url + '/' + comment.id
};

Building.prototype.formatDisplay = function() {
	var commentHtml = "<li><p><%= comment.comment %></p></li>";
	return commentHtml;
};
