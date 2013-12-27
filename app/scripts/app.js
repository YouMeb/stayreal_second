(function(){
  var fbAppId, init, game, fb, initfb, loginfb, postfb, postpicfb, drawfb, resp, $post, $login, $draw, $postpic, $year, $month, $day, contentValue, loading, scrolldiv, b1, b2, b3, b4, b5, loadingfn, closeloading, autosharefn, myStopFunction;
  fbAppId = '219756031530311';
  init = {
    login: 0,
    voted: 0
  };
  game = {
    array: ['best', 'better', 'bravo', 'good', 'ok1', 'ok2', 'oops', 'soso'],
    go: function(r){
      return window.location.href = 'content-' + this.array[r] + '.html';
    },
    init: function(){
      return new Date().getTime();
    },
    play: function(){
      var maxNum, minNum, n;
      maxNum = 7;
      minNum = 0;
      n = Math.floor(Math.random() * (maxNum - minNum + 1)) + minNum;
      return this.go(n);
    }
  };
  fb = {
    at: '',
    user_id: '',
    init: function(){
      return initfb();
    },
    login: function(){
      return loginfb();
    },
    post: function(){
      return postfb();
    },
    draw: function(){
      return drawfb();
    },
    postpic: function(){
      return postpicfb();
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
    if (FB) {
      FB.login(function(res){
        if (res.authResponse) {
          return FB.api('/me', function(response){
            init.login = 1;
            if (!response.verified) {
              alert('很抱歉你的帳號未通過驗證！再試一次');
            }
            FB.getLoginStatus(function(_resp){
              var uid, accessToken;
              if (_resp.status === 'connected') {
                uid = _resp.authResponse.userID;
                accessToken = _resp.authResponse.accessToken;
                fb.user_id = _resp.authResponse.userID;
                fb.at = accessToken;
                return game.play();
              } else {
                return false;
              }
            });
          });
        }
      }, {
        scope: 'email,photo_upload,publish_actions'
      });
      return false;
    } else {
      return game.play();
    }
  };
  postfb = function(){
    var metas, i$, to$, i, mdesp, mtitle, murl, mimage;
    metas = document.getElementsByTagName('meta');
    for (i$ = 0, to$ = metas.length - 1; i$ <= to$; ++i$) {
      i = i$;
      if (metas[i].getAttribute("property") === "og:description") {
        mdesp = metas[i].getAttribute("content");
      }
      if (metas[i].getAttribute("property") === "og:title") {
        mtitle = metas[i].getAttribute("content");
      }
      if (metas[i].getAttribute("property") === "og:url") {
        murl = metas[i].getAttribute("content");
      }
      if (metas[i].getAttribute("property") === "og:image") {
        mimage = metas[i].getAttribute("content");
      }
    }
    return FB.ui({
      method: 'feed',
      name: mtitle,
      link: murl,
      caption: '',
      picture: mimage,
      description: mdesp
    });
  };
  postpicfb = function(){
    return FB.api(fb.user_id + '/photos', 'post', {
      from: from,
      url: url_to_foto,
      message: mess,
      access_token: fb.at
    }, function(response){
      if (response && !response.error) {
        return control.content.PageName.update_post("success", response.post_id);
      } else {
        return control.content.PageName.update_post("error", "");
      }
    });
  };
  drawfb = function(){
    var xhr;
    xhr = new XMLHttpRequest();
    xhr.onload = resp;
    xhr.open('POST', 'https://graph.facebook.com/me/stayrealxkitty:draw?access_token=' + fb.at + '&method=POST&lucky_stick=http%3A%2F%2Fsamples.ogp.me%2F220274168145164', true);
    return xhr.send();
  };
  resp = function(){
    return console.log(this.responseText);
  };
  $post = document.getElementById('post');
  $login = document.getElementById('login');
  $draw = document.getElementById('draw');
  $postpic = document.getElementById('postpic');
  $year = document.getElementById('year') || '';
  $month = document.getElementById('month') || '';
  $day = document.getElementById('day') || '';
  contentValue = document.getElementById('content-value');
  loading = document.querySelector('.frloading');
  scrolldiv = document.getElementById('scrolldiv');
  b1 = document.querySelector('.b1');
  b2 = document.querySelector('.b2');
  b3 = document.querySelector('.b3');
  b4 = document.querySelector('.b4');
  b5 = document.querySelector('.b5');
  fb.init();
  if ($login) {
    $login.onclick = function(){
      return fb.login();
    };
  }
  if ($post) {
    $post.onclick = function(){
      return fb.post();
    };
  }
  if ($draw) {
    $draw.onclick = function(){
      return fb.draw();
    };
  }
  if ($postpic) {
    $postpic.onclick = function(){
      return fb.postpic();
    };
  }
  if (contentValue.value === 'content') {
    FB.getLoginStatus(function(_resp){
      var uid, accessToken;
      if (_resp.status === 'connected') {
        uid = _resp.authResponse.userID;
        accessToken = _resp.authResponse.accessToken;
        return fb.at = accessToken;
      } else {
        return window.location.href = "/2014kitty";
      }
    });
    loadingfn = function(){
      var lfn;
      return lfn = setTimeout(function(){
        b1.className = b1.className + ' b1c';
        b2.className = b2.className + ' b2c';
        b3.className = b3.className + ' b3c';
        b4.className = b4.className + ' b4c';
        b5.className = b5.className + ' b5c';
        return loading.className = loading.className + ' loadingclose';
      }, 1000);
    };
    closeloading = function(){
      var cfn;
      return cfn = setTimeout(function(){
        loading.className = loading.className + ' closeit';
        scrolldiv.className = scrolldiv.className + ' down';
      }, 5000);
    };
    autosharefn = function(){
      var afn;
      return afn = setTimeout(function(){}, 5000);
    };
    myStopFunction = function(){
      clearTimeout(lfn);
      return clearTimeout(afn);
    };
    loadingfn();
    autosharefn();
    closeloading();
  }
}).call(this);
