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
  var $featureSpace = $('#activity-card'),
      $cardHTML = $("<p class='activity-name'>" + this.cards[this.current_card].name + "</p>"
                  + "<p>" + this.cards[this.current_card].blurb + "</p>"
                  + "<p> Things you'll need: " + this.cards[this.current_card].things_needed + "</p>"
                  + "<p><a href="+ this.cards[this.current_card].url +">" + this.cards[this.current_card].url + "</a></p>"
                  + "<p> <button id='do-it-button'> Do me! </button>"

        );

  console.log(this.current_card);
  if (Deck.current_card === Deck.cards.length - 1) {
    Deck.current_card = -1;
  }
  this.current_card++;
  $featureSpace.empty();
  $featureSpace.append($cardHTML);
}