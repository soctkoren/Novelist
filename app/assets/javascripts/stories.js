$( document ).ready(function() {
 	$("#img_icon").on("click", function(){
  	console.log("grab an image ajaxy")

  		$("#img_icon").addClass("hidden");
  		
  		
  });

  $("#new_story").on("submit", function(event){
  	console.log('story');
  	event.preventDefault();
  });

   
});