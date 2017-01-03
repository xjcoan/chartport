$(document).ready(function() {
  $('.namelink').each(function() {
    $(this).hover(function() {
      $(this).find('.popup').css("display", "inline");
    }, function() {
      $(this).find('.popup').css("display", "none");
    });
  });
});
