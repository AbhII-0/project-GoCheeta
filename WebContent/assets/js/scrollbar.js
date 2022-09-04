$(window).on("load", function() {

	var body = $("body");
	var html = $("html");

	body.css({
		overflow : "overlay"
	});

	html.addClass("scorllbar-custom");
	html.addClass("scrollbar-track-custom");
	html.addClass("scrollbar-thumb-custom");
	html.addClass("scrollbar-hover-custom");

	setTimeout(function() {
		html.removeClass("scrollbar-thumb-custom ");
		$("html").addClass("scrollbar-fadeout");
	}, 2000);

	// html.addClass("scrollbar-hover-custom ");

});