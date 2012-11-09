$(window).scroll(function () { 
	setGrayscales();
});

$(window).resize(function() {
	setGrayscales();
});

$(document).ready(function() {
	setGrayscales();
});



function setGrayscales() {
	$("figure").each(function(index) {
		var halfHeight = $(window).height()/2;
		var relativeY = $(this).offset().top - window.pageYOffset;
		var halfFigure = $(this).height()/2;
		
		//console.log(index+": "+relativeY);
			
		var p = (Math.abs(relativeY+halfFigure-halfHeight)/halfHeight)*120;
		if (p > 100) { p = 100; }
		setGrayscale(this, p);
	});
}
function setGrayscale(elem, value) {
	var g = "grayscale("+value+"%)";
	$(elem).css("filter", g);
	$(elem).css("-webkit-filter", g);
	$(elem).css("-moz-filter", g);
	$(elem).css("-ms-filter", g);
	$(elem).css("-o-filter", g);
}