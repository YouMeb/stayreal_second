(function(){
  var fbAppId, init, game, fb, initfb, loginfb, postfb, postpicfb, drawfb, resp, $post, $login, $draw, $postpic, $year, $month, $day;
  fbAppId = '219756031530311';
  init = {
    login: 0,
    voted: 0
  };
  game = {
    array: ['good1', 'good2', 'nice1', 'nice2', 'nice3', 'oops', 'soso1', 'soso2'],
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
    FB.login(function(res){
      if (res.authResponse) {
        return FB.api('/me', function(response){
          init.login = 1;
          console.log(response);
          if (!response.verified) {
            alert('很抱歉你的帳號未通過驗證！再試一次');
          }
          FB.getLoginStatus(function(_resp){
            var uid, accessToken;
            console.log(_resp);
            if (deepEq$(_resp.status, 'connected', '===')) {
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
  };
  postfb = function(){
    return FB.ui({
      method: 'feed',
      name: '123',
      link: 'https://kktix.com/events/devhappyday',
      caption: '123',
      description: '1232312312312'
    }, function(resp){
      return console.log(resp);
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
    console.log(fb.at);
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
  function deepEq$(x, y, type){
    var toString = {}.toString, hasOwnProperty = {}.hasOwnProperty,
        has = function (obj, key) { return hasOwnProperty.call(obj, key); };
    var first = true;
    return eq(x, y, []);
    function eq(a, b, stack) {
      var className, length, size, result, alength, blength, r, key, ref, sizeB;
      if (a == null || b == null) { return a === b; }
      if (a.__placeholder__ || b.__placeholder__) { return true; }
      if (a === b) { return a !== 0 || 1 / a == 1 / b; }
      className = toString.call(a);
      if (toString.call(b) != className) { return false; }
      switch (className) {
        case '[object String]': return a == String(b);
        case '[object Number]':
          return a != +a ? b != +b : (a == 0 ? 1 / a == 1 / b : a == +b);
        case '[object Date]':
        case '[object Boolean]':
          return +a == +b;
        case '[object RegExp]':
          return a.source == b.source &&
                 a.global == b.global &&
                 a.multiline == b.multiline &&
                 a.ignoreCase == b.ignoreCase;
      }
      if (typeof a != 'object' || typeof b != 'object') { return false; }
      length = stack.length;
      while (length--) { if (stack[length] == a) { return true; } }
      stack.push(a);
      size = 0;
      result = true;
      if (className == '[object Array]') {
        alength = a.length;
        blength = b.length;
        if (first) { 
          switch (type) {
          case '===': result = alength === blength; break;
          case '<==': result = alength <= blength; break;
          case '<<=': result = alength < blength; break;
          }
          size = alength;
          first = false;
        } else {
          result = alength === blength;
          size = alength;
        }
        if (result) {
          while (size--) {
            if (!(result = size in a == size in b && eq(a[size], b[size], stack))){ break; }
          }
        }
      } else {
        if ('constructor' in a != 'constructor' in b || a.constructor != b.constructor) {
          return false;
        }
        for (key in a) {
          if (has(a, key)) {
            size++;
            if (!(result = has(b, key) && eq(a[key], b[key], stack))) { break; }
          }
        }
        if (result) {
          sizeB = 0;
          for (key in b) {
            if (has(b, key)) { ++sizeB; }
          }
          if (first) {
            if (type === '<<=') {
              result = size < sizeB;
            } else if (type === '<==') {
              result = size <= sizeB
            } else {
              result = size === sizeB;
            }
          } else {
            first = false;
            result = size === sizeB;
          }
        }
      }
      stack.pop();
      return result;
    }
  }
}).call(this);
