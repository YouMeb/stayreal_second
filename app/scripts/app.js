(function(){
  var fbAppId, init, game, fb, initfb, loginfb, postfb, $post, $login;
  fbAppId = '219756031530311';
  init = {
    login: 0,
    voted: 0
  };
  game = {
    init: function(){
      return new Date().getTime();
    },
    play: function(){
      return console.log('go!');
    }
  };
  fb = {
    tk: '78c9b51f7ba165e2feaa6ff635b9c2ed',
    at: '',
    init: function(){
      return initfb();
    },
    login: function(){
      return loginfb();
    },
    post: function(){
      return postfb();
    }
  };
  initfb = function(){
    return FB.init({
      appId: fbAppId,
      status: true,
      cookie: true,
      xfbml: true
    });
  };
  loginfb = function(){
    FB.login(function(res){
      if (res.authResponse) {
        return FB.api('/me', function(response){
          init.login = 1;
          return console.log(response);
        });
      }
    }, {
      scope: 'email,photo_upload,publish_actions'
    });
    return false;
  };
  postfb = function(){
    return console.log('123');
  };
  $post = document.getElementById('post');
  $login = document.getElementById('login');
  fb.init();
  $login.onclick = function(){
    return fb.login();
  };
  $post.onclick = function(){
    return fb.post();
  };
}).call(this);
