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
  cards: [],
  previous_card: 0,
  next_card: null
};

Deck.storeData = function(data) {
  Deck.cards = data;
};

Deck.renderCard = function(e) {
  var $featureSpace = $('#activity-card'),
      cardHTML;
  // Get the index of the card that previously displayed
  this.previous_card = this.current_card;
  // Set Deck.next_card to a random index
  Deck.getNextCard();
  // Keep running Deck.getNextCard until next_card is not equal to previous_card
  while(this.previous_card === this.next_card) {
    Deck.getNextCard();
  };
  // Set current_card equal to next_card
  this.current_card = this.next_card;
  console.log(this.current_card);
  $featureSpace.empty();
  cardHTML = Deck.renderCardHTML();
  $featureSpace.append(cardHTML);
  // add an event listener for the DoMe button
  $('#do-it-button').click(Deck.renderDoIt);
};

// Function to generate a random index in the cards array
Deck.getNextCard = function() {
  Deck.next_card = Math.floor(Math.random() * ((Deck.cards.length - 1) + 1) + 0);
};

Deck.renderCardHTML = function() {
  var HTML = "<h2 class='activity-name'>" + Deck.cards[Deck.current_card].name + "</h2>"
              + "<p id='blurb'>" + Deck.cards[Deck.current_card].blurb + "</p>"
              + "<p id='url'>More info: <a href="+ Deck.cards[Deck.current_card].url +">" + Deck.cards[Deck.current_card].url + "</a></p>"
              + "<div class='text-center' id='do-it'>"
                + "<button id='do-it-button' class='btn btn-md'>Do me!</button>"
              + "</div>";
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
  HTML = "<h2 class='activity-name'>" + Deck.cards[Deck.current_card].name + "</h2>"
          + "<p id='blurb'>" + Deck.cards[Deck.current_card].blurb + "</p>"
          + "<p id='url'>More info: <a href="+ Deck.cards[Deck.current_card].url +">" + Deck.cards[Deck.current_card].url + "</a></p>"
          + "<div id='HMSremaining'></div>"
          + "<div id='google-map' class='text-center'>" + Deck.cards[Deck.current_card].map + "</div>"
          + "<div id='did-it' class='text-center'>"
            + "<button id='did-it-button' class='btn btn-lg btn-success' href='/adventures/new'>I Did It!</button>"
          + "</div>";
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
      var storyHTML = '<p>' + data.story + '</p>';

      // get rid of story form (can only submit one story)
      $('#new-story').empty();

      // append story body to existing stories
      $('#no-stories-yet').empty();
      $('#stories').prepend(storyHTML);

  });

  return false;
};

