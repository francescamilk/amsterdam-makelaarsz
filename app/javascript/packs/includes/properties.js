// buttons settings (show phone & show more text)

$(function(){
  $("#showPhone").on("click", function(){
    var $button = $(this);

    $button.find("span").text( $button.data("phone") )
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


// email settings (show modal & trigger send)

$('#mailModal').on('show.bs.modal', function (event) {
  var recipient = button.data('mail');
  var modal = $(this);
});

$("#sendMessageToAgent").on("click", function(){
  var agent_id = $("#agent_id").val(),
    first_name = $("#message-first-name").val(),
    last_name = $("#message-last-name").val(),
    email = $("#message-email").val(),
    message = $("#message-text").val();

  $.ajax({
    url: "/agent/message",
    method: "POST",
    dataType: "json",
    data: {
      agent_id: agent_id,
      first_name: first_name,
      last_name: last_name,    
      email: email,
      message: message
    },
    success: function(data){
      console.log(data);
    }
  })
});