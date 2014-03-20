$(document).ready(function(){
  $.ajax({
    url: '/',
    type: 'GET',
    dataType: 'json'
  })
  .done(function(data) {
    Activities.storeData(data);
  });

  $('#next-activity').click(Activities.renderActivity);
  $('#story-submit').click(Activities.createStory);

});

var Activities = Activities || {
  current_activity: 0,
  all_activities: [],
  previous_activity: 0,
  next_activity: null
};

Activities.storeData = function(data) {
  Activities.all_activities = data;
};

Activities.renderActivity = function(event) {
  var $featureSpace = $('#this-activity'),
      activityHTML;
  event.preventDefault();
  // Get the index of the activity that previously displayed
  Activities.previous_activity = Activities.current_activity;
  // Set Activities.next_activity to a random index
  Activities.getNextActivity();
  // Keep running Activities.getNextActivity until next_activity is not equal to previous_activity
  while(Activities.previous_activity === Activities.next_activity) {
    Activities.getNextActivity();
  }
  // Set current_activity equal to next_activity
  Activities.current_activity = Activities.next_activity;
  $featureSpace.empty();
  activityHTML = Activities.renderActivityHTML();
  $featureSpace.append(activityHTML);
  // add an event listener for the DoMe button
  $('#do-it-button').click(Activities.renderDoIt);
  return false;
};

// Function to generate a random index in the all_activities array
Activities.getNextActivity = function() {
  Activities.next_activity = Math.floor(Math.random() * ((Activities.all_activities.length - 1) + 1) + 0);
};

Activities.renderActivityHTML = function() {
  var HTML = "<h2 class='activity-name'>" + Activities.all_activities[Activities.current_activity].name + "</h2>"
              + "<p id='blurb'>" + Activities.all_activities[Activities.current_activity].blurb + "</p>"
              + "<p id='url'>More info: <a href="+ Activities.all_activities[Activities.current_activity].url +">" + Activities.all_activities[Activities.current_activity].url + "</a></p>"
              + "<div class='centered' id='do-it'>"
                + "<br>"
                + "<button id='do-it-button' class='btn btn-md'>Do me!</button>"
              + "</div>";
  console.log("Current activity: " + this.current_activity);
  return HTML;
};

Activities.renderDoIt = function(event) {
  // emptying the div and redisplaying info is optional
  // but may be useful if we want to display different info here
  $('#activity-activity').empty();
  $('#what-should-i-do-today').empty();
  $('#activity-activity').append(Activities.doItHTML());
  Activities.calculateHMSleft();
  setInterval(Activities.calculateHMSleft, 1000);
  // set click listener for the DidIt button
  $('#did-it-button').click(Activities.renderDidIt);
};

Activities.doItHTML = function() {
  var HTML;
  HTML = "<h2 class='activity-name'>" + Activities.all_activities[Activities.current_activity].name + "</h2>"
          + "<p id='blurb'>" + Activities.all_activities[Activities.current_activity].blurb + "</p>"
          + "<p id='url'>More info: <a href='"+ Activities.all_activities[Activities.current_activity].url +"'>" + Activities.all_activities[Activities.current_activity].url + "</a></p>"
          + "<div id='HMSremaining'></div>"
          + "<div id='google-map' class='text-center'>" + Activities.all_activities[Activities.current_activity].map + "</div>"
          + "<div id='did-it' class='centered'>"
            + "<br>"
            + "<button id='did-it-button' class='btn btn-md' href='/adventures/new'>I Did It!</button>"
          + "</div>";
  return HTML;
};

Activities.renderDidIt = function(event) {
  var id = Activities.all_activities[Activities.current_activity].id;
  event.preventDefault();

  $.ajax({
    type: 'POST',
    url: '/adventures/new',
    data: { activity_id: id }
  })
  .success(function(data){
    window.location.href = '/adventures/activity/' + id // send to show page for adventure
  })
  .fail(function(data) {
    window.location.href = '/adventures/new/' + id
  }); // end ajax

  return false;
};

Activities.createStory = function(event) {

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

