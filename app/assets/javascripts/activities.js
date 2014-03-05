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

});

var Deck = Deck || {
  current_card: 0,
  cards: []
};

Deck.storeData = function(data) {
  Deck.cards = data;
};

Deck.renderCard = function(e) {
  var $featureSpace = $('#activity-card'),
      cardHTML;

  this.current_card = Deck.getNextCard();
  console.log(this.current_card);
  $featureSpace.empty();
  cardHTML = Deck.renderCardHTML();
  $featureSpace.append(cardHTML);
  // add an event listener for the DoMe button
  $('#do-it-button').click(Deck.renderDoIt);
};

Deck.getNextCard = function() {
  return Math.floor(Math.random() * ((Deck.cards.length - 1) + 1) + 0);
};

Deck.renderCardHTML = function() {
  var HTML = "<p class='activity-name'>" + Deck.cards[Deck.current_card].name + "</p>"
                  + "<p>" + Deck.cards[Deck.current_card].blurb + "</p>"
                  + "<p><a href="+ Deck.cards[Deck.current_card].url +">" + Deck.cards[Deck.current_card].url + "</a></p>"
                  + "<button id='do-it-button'>Do me!</button>";
  return HTML;
};

Deck.renderDoIt = function(event) {
  // emptying the div and redisplaying info is optional
  // but may be useful if we want to display different info here
  $('#activity-card').empty();
  $('#activity-card').append(Deck.doItHTML());
  Deck.calculateHMSleft();
  setInterval(Deck.calculateHMSleft, 1000);
  // set click listener for the DidIt button
  $('#did-it-button').click(Deck.renderDidIt);
};

Deck.doItHTML = function() {
  var HTML;

  // this is kind of a hack to undo the incrementing counter at the end of Deck.renderCard()

  HTML = "<p class='activity-name'>" + Deck.cards[Deck.current_card].name + "</p>"
                  + "<p>" + Deck.cards[Deck.current_card].blurb + "</p>"
                  + "<p> Things you'll need: " + Deck.cards[Deck.current_card].things_needed + "</p>"
                  + "<p><a href="+ Deck.cards[Deck.current_card].url +">" + Deck.cards[Deck.current_card].url + "</a></p>"
                  + "<p id='HMSremaining'></p>"
                  + "<button id='did-it-button' href='/adventures/new'>I Did It!</button>";
  return HTML;
};

Deck.renderDidIt = function(event) {
  // Deck.createAdventure();
  location.href=$('#did-it-button').attr('href'); // redirects to /adventure/new, which triggers controller
};

// // only saves if user is logged in, else display something like "login to save your adventure"
// Deck.createAdventure = function() {
//   var user_id = 2 || nil, // change this later! maybe this happens in the rails controller
//       activity_id = Deck.cards[Deck.current_card].id
// };

Deck.calculateHMSleft = function() {
  // calculate
  var now = new Date(),
    hoursleft = 23 - now.getHours(),
    minutesleft = 59 - now.getMinutes(),
    secondsleft = 59 - now.getSeconds();
  //format 0 prefixes
  if(hoursleft < 10){
    hoursleft = "0" + hoursleft };
  if(minutesleft < 10){
    minutesleft = "0" + minutesleft };
  if(secondsleft < 10){
    secondsleft = "0" + secondsleft };

  //display
  $('#HMSremaining').html("Time left until midnight:" + hoursleft + ":" + minutesleft + ":" + secondsleft);
}
