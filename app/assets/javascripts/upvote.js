

$(document).ready(function(){
  $(".ajax-upvote").click(function(){
    console.log("Upvote click");

    var clicked = $(this);
    var messageId = clicked.data("message-id");
    var roomId = clicked.data("room-id");
    console.log(messageId);
    console.log(roomId);

    $.ajax("/rooms/" + roomId + "/messages/" + messageId + "/vote", {
      method: "POST",
      data: { vote: "up"},
      error: function() { alert("Something went wrong!")},

      success: function() {
        // alert("Vote should have saved");
        clicked.closest("tr").find(".orange").removeClass("orange")
        clicked.addClass("orange")
      }
    })

  }); // End


  $(".ajax-downvote").click(function(){
    console.log("Downvote click");

    var clicked = $(this);
    var messageId = clicked.data("message-id");
    var roomId = clicked.data("room-id");

    console.log(messageId);
    console.log(roomId);

    $.ajax("/rooms/" + roomId + "/messages/" + messageId + "/vote", {
      method: "POST",
      data: { vote: "down"},
      error: function() { alert("Something went wrong!")},

      success: function() {
        clicked.closest("tr").find(".orange").removeClass("orange")
        clicked.addClass("orange")
      }
    })

    $.ajax("/rooms/" + roomId + "/messages/" + messageId + "/vote", {
      method: "POST",
      data: { vote: "down"},
      error: function() { alert("Something went wrong!")},

      success: function() {
        clicked.closest("tr").find(".orange").removeClass("orange")
        clicked.addClass("orange")
      }
    })




  }); // End

});
