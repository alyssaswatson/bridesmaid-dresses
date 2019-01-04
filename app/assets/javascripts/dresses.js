$(document).ready(function () {

	$('button#loadDresses').click(function(event) {
		var url = $(this).data("url")
	$.get(url)
	  .done(function( data ) {
	  	$('#dresses').html("");

	    $.each(data, function(index, value) {
	    	var newDress = new Dress(value, url);
	    	
	    	var dressHtml = newDress.formatDisplay();
			  $('#dresses').append(dressHtml)
			});

	  });
	});	
});


function Dress(dress, url) {
        this.id = dress.id;
        this.link = dress.link;
        this.material = dress.material;
        this.length = dress.length;
};
