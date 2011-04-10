/* Author: Bart Olsthoorn
 open is 37 and closed is -121
*/

//jQuery.easing.def = "swing";

var open = false;
var slideduration = 200;
//slideBar();


$("#arrow").click(slideBar);
function slideBar() {
	if (open) {
		open = false;
		var barbottom = "-121px";
		var wrapperpadding = "70px";
	} else {
		open = true;
		var barbottom = "37px";
		var wrapperpadding = "228px";
	}
	$("#wrapper").css("paddingBottom", wrapperpadding);
	$("#bar").animate( { bottom:barbottom }, { queue:false, duration:slideduration, easing: "linear" } );
}

/* HTML 5 placeholders */
$('[placeholder]').focus(function() {
  var input = $(this);
  if (input.val() == input.attr('placeholder')) {
    input.val('');
    input.removeClass('placeholder');
  }
}).blur(function() {
  var input = $(this);
  if (input.val() == '' || input.val() == input.attr('placeholder')) {
    input.addClass('placeholder');
    input.val(input.attr('placeholder'));
  }
}).blur();
/* HTML 5 placeholders, make sure it doesn't get submitted */
$('[placeholder]').parents('form').submit(function() {
  $(this).find('[placeholder]').each(function() {
    var input = $(this);
    if (input.val() == input.attr('placeholder')) {
      input.val('');
    }
  })
});

/*
 * Calculate the x,y coordinate of the given element
 */
jQuery.fn.elementlocation = function() {
  var curleft = 0;
  var curtop = 0;
  
  var obj = this;
  
  do {
	curleft += obj.attr('offsetLeft');
	curtop += obj.attr('offsetTop');
	
	obj = obj.offsetParent();
  } while ( obj.attr('tagName') != 'BODY' );
  
  
  return ( {x:curleft, y:curtop} );
};


$("div.work-item").mousemove(function(e){
	var pageCoords = "( " + e.pageX + ", " + e.pageY + " )";
	var clientCoords = "( " + e.clientX + ", " + e.clientY + " )";
	//$("div.d1").text("( e.pageX, e.pageY ) - " + pageCoords);
	//$("div.d2").text("( e.clientX, e.clientY ) - " + clientCoords);
	//alert(this);
	var l = this.offsetLeft; 
	var t = this.offsetTop;
	var cimage = $(this).find("img").length;
	var p = (220/(cimage-1));
	var rx = (e.pageX-l);
	var ry = (e.pageY-t);
	
	var c = Math.round(rx/p);
	
	$(this).find(".work-content").css("marginLeft", (-220*c)+"px");
	
	//$("div.d1").text(rx+","+ry);
	//$("div.d3").text(l+","+t);
});

$("div.work-categories a").hover(
  function () {
		$(".works .work-item:not(."+$(this).attr('category')+")").animate({"opacity": "0.4"}, { queue: false, duration: 200 });
  }, 
  function () {
    $(".work-item").animate({"opacity": "1"}, { queue: false, duration: 150 });
  }
);

$("div.work-categories a").click(function() {
	if ($(this).hasClass("current") == false) {
		$("div.work-categories a").removeClass("current");
		$(this).addClass("current");
		$(".work-item").hide();
		$("."+$(this).attr("category")).show();
	} else {
		$("div.work-categories a").removeClass("current");
		$(".work-item").show();
		$(".work-item").animate({"opacity": "1"}, { queue: false, duration: 150 });
	}
	return false;
});