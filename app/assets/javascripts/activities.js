$(document).ready(function(){
  $.ajax({
    url: '/',
    type: 'GET',
    dataType: 'json'
  })
  .done(function(data) {
    Deck.storeData(data);
  });
  $('#next-activity').click(Deck.renderCard.bind(Deck));
})

var Deck = Deck || {
  current_card: 0,
  cards: []
};

Deck.storeData = function(data) {
  Deck.cards = data;
}

Deck.renderCard = function(e) {
  var $featureSpace = $('#feature-space'),
      $cardHTML = $("<p>" + this.cards[this.current_card].name + "</p>");

  $cardHTML.text = this.card;
  console.log(this.current_card);
  this.current_card++;
  $featureSpace.empty();
  $featureSpace.append($cardHTML);
}