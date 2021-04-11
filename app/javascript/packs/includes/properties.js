$(function(){
  $("#toggleDetails").on("click", function(){
    var details = $("#property-details");

    details.toggleClass("open");
  })
});
