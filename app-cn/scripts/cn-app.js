(function(){
  
  var init, game, $post, $login, $draw, $postpic, $year, $month, $day, contentValue, loading, scrolldiv, b1, b2, b3, b4, b5, gfb, gweibo, gsgitem, gsgdress, gna, gns, playAgain, lasturl, reg, played, loadingfn, closeloading, myStopFunction;
  init = {
    login: 0,
    voted: 0
  };
  game = {
    array: ['best', 'better', 'bravo', 'bravo', 'bravo', 'good', 'ok1', 'ok2', 'oops', 'soso'],
    go: function(r){
      return window.location.href = 'content-cn-' + this.array[r] + '.html';
    },
    init: function(){
      return new Date().getTime();
    },
    play: function(){
      var maxNum, minNum, n;
      maxNum = 9;
      minNum = 0;
      n = Math.floor(Math.random() * (maxNum - minNum + 1)) + minNum;
      return this.go(n);
    }
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
  gfb = document.querySelector('.fbaaa');
  gweibo = document.querySelector('.weiboaaa');
  gsgitem = document.getElementById('sgitem');
  gsgdress = document.getElementById('sgdress');
  gna = document.getElementById('gna');
  gns = document.getElementById('gns');
  playAgain = document.getElementById('play-again');
  if (gfb) {
    gfb.onclick = function(){
      if (contentValue.value === 'content') {
        return ga('send', 'event', '活動內頁', 'FB button', 'Facebook分享');
      } else {
        return ga('send', 'event', '活動首頁', 'FB button', 'Facebook分享');
      }
    };
  }
  if (gweibo) {
    gweibo.onclick = function(){
      if (contentValue.value === 'content') {
        return ga('send', 'event', '活動內頁', 'Weibo button', '微博分享');
      } else {
        return ga('send', 'event', '活動首頁', 'Weibo button', '微博分享');
      }
    };
  }
  if (gsgitem) {
    gsgitem.onclick = function(){
      return ga('send', 'event', '活動內頁', 'productlink', '建議小物');
    };
  }
  if (gsgdress) {
    gsgdress.onclick = function(){
      return ga('send', 'event', '活動內頁', 'productlink', '建議穿搭');
    };
  }
  if (gna) {
    gna.onclick = function(){
      if (contentValue.value === 'content') {
        return ga('send', 'event', '活動內頁', 'eventlink', '一元復始開運金活動');
      } else {
        return ga('send', 'event', '活動首頁', 'eventlink', '一元復始開運金活動');
      }
    };
  }
  if (gns) {
    gns.onclick = function(){
      if (contentValue.value === 'content') {
        return ga('send', 'event', '活動內頁', 'productlink', '開運商品馬上購買');
      } else {
        return ga('send', 'event', '活動首頁', 'productlink', '開運商品馬上購買');
      }
    };
  }
  if (playAgain) {
    playAgain.onclick = function(){
      return ga('send', 'event', '活動內頁', 'Play', '再玩一次');
    };
  }
  if ($login) {
    $login.onclick = function(){
      ga('send', 'event', '活動首頁', 'Play', '測2014運勢');
      localStorage['played'] = true;
      return game.play();
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
    lasturl = document.referrer;
    reg = /(istayreal)|(localhost)/;
    if (!reg.test(lasturl)) {
      window.location.href = '/';
    }
    played = localStorage['played'] || false;
    if (!played) {
      window.location.href = "/2014kitty";
    }
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
    myStopFunction = function(){
      clearTimeout(lfn);
      return clearTimeout(afn);
    };
    loadingfn();
    closeloading();
  }
}).call(this);
