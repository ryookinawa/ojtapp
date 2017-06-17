(function(w, $) {
  var View = function(){};

  View.prototype = {
    alert: function(message) {
      $('.alert').css('display', '');
      $('.alert').text(message);
    }
  };


  var Action = function() {};
  Action.prototype = {
    'tweet' : function(tweet, callback) {
      $.ajax({
        method: 'POST',
        url: '/boards/tweet',
        data: tweet,
        success: function(data, dataType) {
          callback(null, '投稿ID=' + data);
        },

        error: function(xhr, status, err) {
          callback(status);
        }
      });
    }
  };


  $(function() {
    var view = new View();
    var action = new Action();
    $('#tweet-btn').click(function() {
      var tweet = $(this).parents('form').serializeArray();
      action.tweet(tweet, function(err, data) {
        if (err) {
          view.alert(err);
        } else {
          view.alert(data);
        }
        setInterval(function() {
          w.location.reload();
        }, 500);
      });
    });
  });

}(window, $));
