$(function(d, s, id){
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) {return;}
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.com/en_US/messenger.Extensions.js";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'Messenger'));

window.extAsyncInit = function() {
  $(function() {
    $("#closeButton").click(function() {
      MessengerExtensions.requestCloseBrowser(
        function success() { },
        function error(err) { }
      );
      return false;
    });
  });
};
