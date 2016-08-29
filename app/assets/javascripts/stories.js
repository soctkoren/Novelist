$('.notify-btn').click(function(e){
    e.preventDefault();
    e.stopPropagation();
    var link = $(this).attr('href')
    bootbox.confirm("Alert?", function(result){
      if(result){
        window.location = link;
        return true;
      } else {
        return false;
      }
    });
  });