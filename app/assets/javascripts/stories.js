$( document ).ready(function() {

  $("#img_icon").on("click", function(event){
    event.preventDefault();
    console.log("clicked on image icon")
    $("#pop-up-container").removeClass("hidden");
    $("#img_icon").addClass("hidden");
  });

  $("#img_icon").on("submit", function(event){
    event.preventDefault();
    console.log("whattt?")
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
        let my_url = root_url + id + query;
        //get all the cats
        $("#image-list").append(`<li class="list"><div class="images_div"><img id="${id}", class="images_divs_img" src="${my_url}" /></div></li>`);
      
        $(".images_divs_img").on("click", function(){
          var selected_id = this.id;
          $("#story_image_url").val(selected_id);
          $(".image_container").css("background-image", `url(${this.src})`);
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

  //up 
  $(".up").on("click", function(){
    var input = $(this).attr("value");
    input = JSON.parse(input);
    url = `/segments/1/up`;
    $.ajax({
      method: 'post',
      url: url,
      data: input
    })
    .done(function(response){

        console.log(response);

        var selector = "#vote" + response["segment_id"]
        console.log(selector);
        $(selector).html(response["count"]).css("color", "#c34b3d");
    })

  //down

  });

  $(".down").on("click", function(){
    var input = $(this).attr("value");
    input = JSON.parse(input);
    url = `/segments/1/down`;
    $.ajax({
      method: 'post',
      url: url,
      data: input
    })
    .done(function(response){
   
        var selector = "#vote" + response["segment_id"];
        $(selector).html(response["count"]).css("color", "#c34b3d");;
    })


  });

  $(document).ready(function(){
    $('.bxslider').bxSlider({
      // adaptiveHeight: true,
      pagerType: 'short',
      responsive : false,
    });

    $('.bx-pager').css("font-family", 'Quicksand');
  });

});


