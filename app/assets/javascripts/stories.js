$( document ).ready(function() {
 	$("#img_icon").on("click", function(){
  	console.log("grab an image ajaxy")
  		$("#img_icon").addClass("hidden");
  });

  $("#new_story").on("submit", function(event){
  	console.log('story');
  	event.preventDefault();
  });


  $("#pop-up").on("submit", function(event){
  	// var searchTerm = $("#pop-up input:first").val();
  	event.preventDefault();
    console.log("whats");
  	var input = $(this).serialize();
  	// api call
  	$.ajax({
  		method: 'get',
  		url: '/stories/1/images',
  		data: input
  	})
  	.done(function(response){
  		console.log(response);
  	})

  });
   
});