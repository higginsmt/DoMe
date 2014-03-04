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
  current_card: 1,
  cards: []
};

Deck.storeData = function(data) {
  Deck.cards = data;
}

Deck.renderCard = function(e) {
  var $featureSpace = $('#feature-space'),
      $cardHTML = $("<p>" + this.cards[this.current_card].name + "</p>");

  console.log(this.current_card);
  if (Deck.current_card === Deck.cards.length - 1) {
    Deck.current_card = 0;
  }
  this.current_card++;
  $featureSpace.empty();
  $featureSpace.append($cardHTML);
}