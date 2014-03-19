Deck.calculateHMSleft = function() {
  // Calculate how many hours, minutes and seconds left until the end of the day
  var now = new Date(),
    hoursleft = 23 - now.getHours(),
    minutesleft = 59 - now.getMinutes(),
    secondsleft = 59 - now.getSeconds(),
    HTML = '';
  // Format 0 prefixes
  if(hoursleft < 10){
    hoursleft = "0" + hoursleft;}
  if(minutesleft < 10){
    minutesleft = "0" + minutesleft;}
  if(secondsleft < 10){
    secondsleft = "0" + secondsleft;}

  HTML = "<p class='countdown-text'>Whoa! You'd better get going, there's only</p>" + "<div id='countdown-timer'>" + hoursleft + ":" + minutesleft + ":" + secondsleft + "</div>" + "<p class='countdown-text'>hours left to have this adventure today! </p>";

  // Display the countdown in the 'Do It' page
  $('#HMSremaining').html(HTML);

  return false;
};