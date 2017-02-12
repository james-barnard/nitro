$(function(d, s, id){
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) {return;}
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.com/en_US/messenger.Extensions.js";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'Messenger'));

$(function() {
  $("#closeButton").click(function() {
    MessengerExtensions.requestCloseBrowser(
      function success() {
        alert(err);
      },
      function error(err) {
        alert(err);
      }
    );
    return false;
  });
});
window.extAsyncInit = function() {
  $(function() {
    $("#closeButton").click(function() {
      MessengerExtensions.requestCloseBrowser(
        function success() {
        alert(err);
      },
        function error(err) {
          alert(err);
        }
      );
      return false;
    });
  });
};
