$( document ).ready(function() {
 	$("#img_icon").on("click", function(){
    $("#img_icon").addClass("hidden");
  });

  $("#img_icon").on("click", function(event){
    event.preventDefault();
    $("#pop-up-container").removeClass("hidden");
    $("#img_icon").addClass("hidden");
  });

  $("#pop-up").on("submit", function(event){
  	// var searchTerm = $("#pop-up input:first").val();
  	event.preventDefault();
  	var input = $(this).serialize();
  	// api call
  	$.ajax({
  		method: 'get',
  		url: '/stories/1/images',
  		data: input
  	})
  	.done(function(response){
    
      var root_url = "https://source.unsplash.com/"
      $.each(response, function(index, response) {
        var id = response.attributes.table.id;
        var query = '/800x600';
        url = root_url + id + query;
        //get all the cats
        $("#image-list").append(`<li class="list"><div class="images_div"><img id="${id}", class="images_divs_img" src="${url}" /></div></li>`);
      
          $(".images_divs_img").on("click", function(){
            var selected_id = this.id;
            var selected_url = root_url + this.id;
            $("#story_image_url").val(selected_id);
            $(".image_container").css("background-image", `url(${selected_url})`);
            $("#pop-up-container").addClass("hidden");
            $("#img_icon").removeClass("hidden");
          }); 
      }); 
  	})
  });

  $(".story_form").on("submit", function(event){
    // event.preventDefault();
  });

  $(".submits").on("click", function(){
    $(".story_form").submit();
  });

  $("#cancel").on("click", function(event) {
    event.preventDefault();
    window.location.replace('/');
  }); 

});