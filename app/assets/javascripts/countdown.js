Deck.calculateHMSleft = function() {
  // Calculate how many hours, minutes and seconds left until the end of the day
  var now = new Date(),
    hoursleft = 23 - now.getHours(),
    minutesleft = 59 - now.getMinutes(),
    secondsleft = 59 - now.getSeconds();
  // Format 0 prefixes
  if(hoursleft < 10){
    hoursleft = "0" + hoursleft };
  if(minutesleft < 10){
    minutesleft = "0" + minutesleft };
  if(secondsleft < 10){
    secondsleft = "0" + secondsleft };

  // Display the countdown in the 'Do It' page
  $('#HMSremaining').html("Time left until midnight:" + hoursleft + ":" + minutesleft + ":" + secondsleft);
};
