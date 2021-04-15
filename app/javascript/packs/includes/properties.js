$(function(){
  $("#showPhone").on("click", function(){
    var $button = $(this)
    $button.text( $button.data("phone") )
  });


  $("#toggleDetails").on("click", function(){
    var details = $("#property-details");
    details.toggleClass("open");

    if(details.hasClass("open")){
      $(this).text("Show Less")
    } else {
      $(this).text("Show More")
    }
  })
});

