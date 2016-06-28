

$(document).ready(function(){

  var total = 0;
  var result = $(".result");

  resultColor = function(score, result){
    if (total < 10) {
      result.removeClass("red");
    }
    else {
      result.addClass("red");
    }
  };

  $("#upvote").click(function(){
    console.log("Anything");
    total = total + 1;
    result.text(total);

    resultColor(total, result);

    // if (total > 9) {
    //   result.addClass("red")
    // }
  });

  $("#downvote").click(function(){
    total = total - 1;
    result.text(total);

    resultColor(total, result);

  });

  $("#reset").click(function(){
    now = new Date();
    var date = now.toLocaleDateString();
    var time = now.toLocaleTimeString();

    var savedTotal = total;


    result.removeClass("red");

    if (total !== 0){
      console.log(savedTotal);
      total = 0;
      result.text(total);

      var logEntry = $("<li>");
      logEntry.append("Reset from ");
      logEntry.append($("<span>").text(savedTotal));
      logEntry.append(" has been saved on: " + date + " at " +  time);

      $(".log").append(logEntry);
    }
    else {
      alert("You can't reset 0");
    }

    localStorage.setItem("storedTotal", savedTotal);

    var retrieve = localStorage.getItem("storedTotal");
    console.log(retrieve);
  });

  $("#clear-log").click(function(){
    $(".log").empty();
  });



});
