$(document).ready(function(){
  $.ajax({
    url: '/',
    type: 'GET',
    dataType: 'json'
  })
  .done(function(data) {
    Deck.storeData(data);
  });

  // event listeners
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
      cardHTML = Deck.renderCardHTML();

  console.log(Deck.current_card);
  if (Deck.current_card === Deck.cards.length - 1) {
    Deck.current_card = -1;
  };
  Deck.current_card++;
  $featureSpace.empty();
  $featureSpace.append(cardHTML);

  // add an event listener for the DoMe button
  $('#do-it-button').click(Deck.renderDoIt);
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
  // set click listener for the DidIt button
  $('#did-it-button').click(Deck.renderDidIt);
};

Deck.doItHTML = function() {
  var HTML;

  // this is kind of a hack to undo the incrementing counter at the end of Deck.renderCard()
  Deck.current_card = Deck.current_card - 1;

  HTML = "<p class='activity-name'>" + Deck.cards[Deck.current_card].name + "</p>"
                  + "<p>" + Deck.cards[Deck.current_card].blurb + "</p>"
                  + "<p> Things you'll need: " + Deck.cards[Deck.current_card].things_needed + "</p>"
                  + "<p><a href="+ Deck.cards[Deck.current_card].url +">" + Deck.cards[Deck.current_card].url + "</a></p>"
                  + "<p> countdown timer goes here! </p>"
                  + "<button id='did-it-button'>I Did It!</button>";
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
      $('#stories').append(storyHTML);

  });

  return false;
};
