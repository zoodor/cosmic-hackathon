$(document).ready(function() {
	$("li, #sign-in").click(function(){
	  window.location=$(this).find("a").attr("href");
	  return false;
	});
});