$(document).ready(function() {

  $("#img_icon").on("click", function(event){
    event.preventDefault();
    console.log("clicked on image icon")
    $("#pop-up-container").removeClass("hidden");
    $("#pop-up-container").addClass("bounceIn");
  });
  
  $("#pop-up").on("submit", function(event){
  	var searchTerm = $("#pop-up input:first").val();
  	event.preventDefault();
  	
    var input = $(this).serialize();

  	var request = $.ajax({
  		method: 'get',
  		url: '/stories/1/images',
  		data: input
  	})

  	request.done(function(response){
    
      var root_url = "https://source.unsplash.com/"
      $.each(response, function(index, response) {
        var id = response.attributes.table.id;
        var query = '/800x600';
        var my_url = root_url + id + query;
        // $("#image-list").append(`<li class="list"><div class="images_div"><img id="${id}", class="images_divs_img" src="${my_url}" /></div></li>`);
        // `<li class="list"><div class="images_div"><img id="${id}", class="images_divs_img" src="${my_url}" /></div></li>`)
      }); 
  	})
  });

  $("#image_pop_up_container").on("click", '.images_divs_img', function(){
    var selected_id = this.id;
    $("#story_image_url").val(selected_id);
    $(".image_container").css("background-image", "url(" + this.src + ")");
 
      $("#pop-up-container").addClass("bounceOut");

      setTimeout( function(){ 
        $("#pop-up-container").removeClass("bounceOut");
        $("#pop-up-container").removeClass("bounceIn");
        $("#pop-up-container").addClass("hidden");
      }  , 1000 );  
  });

  // $(".submits").on("click", function(event){
  //   // $(".story_form").submit();
  // });

  $("#cancel").on("click", function(event) {
    event.preventDefault();
    window.location.replace('/');
  }); 

  //up 
  $(".up").on("click", function(){
    var input = $(this).attr("value");
    input = JSON.parse(input);
    url = '/segments/1/up';
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
    url = '/segments/1/down';
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


  // favorite
  $("#favs").on("click", ".favorites", function() {

      var that = $(this)
      var classes = that.attr('class');
      var substring = "unfavorite";
      
      if (classes.indexOf(substring) !== -1) {
        var input = that.attr("value");
        input = JSON.parse(input);
        url = '/stories/1/favorite';
        
        var request = $.ajax({
          method: 'post',
          url: url,
          data: input
        })

        request.done(function(response){
          that.css("color", "#c34b3d");;
          that.addClass('favorite');
          that.removeClass('unfavorite');
        });

      } else {
        var input = that.attr("value");
        input = JSON.parse(input);
        url = '/stories/1/unfavorite';
        var request = $.ajax({
          method: 'post',
          url: url,
          data: input
        })

        request.done(function(response){
            that.css("color", "#A9A9A9");;
            that.addClass('unfavorite');
            that.removeClass('favorite'); 
        });
      }
  });


  $(document).ready(function(){
    $('.bxslider').bxSlider({
      // adaptiveHeight: true,
      pagerType: 'short',
      responsive : false,
    });

    $('.bx-pager').css("font-family", 'Quicksand');
  });


  // Get the modal
  var modal = document.getElementById('myModal');
  // Get the button that opens the modal
  var btn = document.getElementById("myBtn");
  // Get the <span> element that closes the modal
  var span = document.getElementsByClassName("close")[0];
  // When the user clicks the button, open the modal
  btn.onclick = function() {
      modal.style.display = "block";
      $(".bx-prev").hide();
      $(".bx-next").hide();

  }
  // When the user clicks on <span> (x), close the modal
  span.onclick = function() {
      modal.style.display = "none";
      $(".bx-prev").show();
      $(".bx-next").show();
  }
  // When the user clicks anywhere outside of the modal, close it
  window.onclick = function(event) {
      if (event.target == modal) {
          modal.style.display = "none";
          $(".bx-prev").show();
          $(".bx-next").show();
      }
  }

  function splitString(stringToSplit, separator) {
    var arrayOfStrings = stringToSplit.split(separator);
  }
});


