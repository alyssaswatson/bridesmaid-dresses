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


class Dress {
    constructor(dressJson) {
        this.id = dressJson.id;
        this.link = dressJson.link;
        this.material = dressJson.material;
        this.length = dressJson.length;
    };
};

function getDresses() {
    let dressList = document.querySelector("#listArea");
    let dressUl = document.createElement("ul");
    dressUl.setAttribute("id", "dressList");
    dressList.innerHTML = "<h4>All Dresses</h4>";
    dressList.appendChild(dressUl);

    const requestUrl = "/dresses";
    const request = new XMLHttpRequest();

    request.open('GET', requestUrl);
    request.responseType = 'json';
    request.send();
    request.onload = function() {
        request.response.forEach(function(item) {
            let dress = new Dress(item);
            let dressLi = document.createElement("li");
            dressLi.innerHTML = '<a href="/dresses/' + dress.id + '">' + dress.formalTitle() + '</a>';
            dressUl.appendChild(dressLi);
        });
    };
};
