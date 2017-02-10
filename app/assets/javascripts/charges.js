$(function(d, s, id){
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) {return;}
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.com/en_US/messenger.Extensions.js";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'Messenger'));

$(function() {
  $("#closeButton").click(function() {
    alert("hit me");
    close_window();
    MessengerExtensions.requestCloseBrowser(
      function success() {},
      function error(err) {}
    );
    return false;
  });
});
window.extAsyncInit = function() {
    alert("js sdk finished loading");
};

function close_window(){
    var newWindow = window.open('', '_self', ''); //open the current window
    newWindow.close();
 }

