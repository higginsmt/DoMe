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
  $('#story-submit').click(Deck.createStory);
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
  // Set current card equal to a randomly generated index in the cards array
  this.current_card = Deck.getNextCard();
  console.log(this.current_card);
  $featureSpace.empty();
  cardHTML = Deck.renderCardHTML();
  $featureSpace.append(cardHTML);
  // add an event listener for the DoMe button
  $('#do-it-button').click(Deck.renderDoIt);
};

// Function to generate a random index in the cards array
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
  $('#what-should-i-do-today').empty();
  $('#activity-card').append(Deck.doItHTML());
  Deck.calculateHMSleft();
  setInterval(Deck.calculateHMSleft, 1000);
  // set click listener for the DidIt button
  $('#did-it-button').click(Deck.renderDidIt);
};

Deck.doItHTML = function() {
  var HTML;
  HTML = "<p class='activity-name'>" + Deck.cards[Deck.current_card].name + "</p>"
                  + "<p>" + Deck.cards[Deck.current_card].blurb + "</p>"
                  + "<p> Things you'll need: " + Deck.cards[Deck.current_card].things_needed + "</p>"
                  + "<p><a href="+ Deck.cards[Deck.current_card].url +">" + Deck.cards[Deck.current_card].url + "</a></p>"
                  + "<p id='HMSremaining'></p>"
                  + "<div class='centered'>" + Deck.cards[Deck.current_card].map + "</div>"
                  + "<button id='did-it-button' href='/adventures/new'>I Did It!</button>";
  return HTML;
};

Deck.renderDidIt = function(event) {
  var id = Deck.cards[Deck.current_card].id;
  event.preventDefault();

  $.ajax({
    type: 'POST',
    url: '/adventures/new',
    data: { activity_id: id }
  })
  .done(function(data){
    window.location.href = '/adventures/activity/' + id // send to show page for adventure
  });

  return false;
};

Deck.createStory = function(event) {

  var activity_id = $('#activity-name').attr('data-activity-id'),
      adventure_id = $('#activity-name').attr('data-adventure-id'),
      user_id = $('#user-info').attr('data-user-id'),
      story_body = $('#story-body').val();

  event.preventDefault();

  $.ajax({
    type: 'POST',
    url: '/adventures/activity/' + activity_id,
    data: { activity_id: activity_id, adventure_id: adventure_id, user_id: user_id, story_body: story_body }
  })
  .done(function(data){
      // data is currently the adventure
      var storyHTML = '<li>' + data.story + '</li>';

      // get rid of story form (can only submit one story)
      $('#new-story').empty();

      // append story body to existing stories
      $('#stories').prepend(storyHTML);

  });

  return false;
};

