$(document).ready(function(){
  $('#next-activity').click(Deck.renderCard);
})

var Deck = Deck || {};

Deck.renderCard = function(event) {
  $.ajax({
    url: '/',
    type: 'GET',
    dataType: 'json'
  })
  .done(function(data) {
    console.log(data);
    var $featureSpace = $('#feature-space'),
    $cardHTML = $("<p>" + data[1].name + "</p>");

    $featureSpace.empty();
    $featureSpace.append($cardHTML);
  })
  .fail(function() {
    console.log("error");
  })
  .always(function() {
    console.log("complete");
  });

  debugger



  debugger
}