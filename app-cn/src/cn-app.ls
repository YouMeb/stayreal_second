
init = 	
	login: 0
	voted: 0

game = 
	array:['best' 'better' 'bravo' 'good' 'ok1' 'ok2' 'oops' 'soso']
	go: (r)->
		window.location.href = 'content-cn-'+@array[r]+'.html'
	init: ->
		new Date().getTime()
	play: ->
		maxNum = 7  
		minNum = 0
		n = Math.floor(Math.random() * (maxNum - minNum + 1)) + minNum
		@go(n)

$post = document.getElementById('post')
$login = document.getElementById('login')
$draw = document.getElementById('draw')
$postpic = document.getElementById('postpic')


$year = document.getElementById('year') || ''
$month = document.getElementById('month') || ''
$day = document.getElementById('day') || ''

content-value = document.getElementById('content-value')

loading = document.querySelector('.frloading')
scrolldiv = document.getElementById('scrolldiv')

b1 = document.querySelector('.b1')
b2 = document.querySelector('.b2')
b3 = document.querySelector('.b3')
b4 = document.querySelector('.b4')
b5 = document.querySelector('.b5')


#ga
gfb = document.getElementById('fb')
gweibo = document.getElementById('weibo')
gsgitem = document.getElementById('sgitem')
gsgdress = document.getElementById('sgdress')
gna = document.getElementById('gna')
gns = document.getElementById('gns')
play-again = document.getElementById('play-again')

if(gfb)
	gfb.onclick = ->
		ga('send', 'event', '活動首頁', 'FB button', 'Facebook分享')
if(gweibo)
	gweibo.onclick = ->
		ga('send', 'event', '活動首頁', 'Weibo button', '微博分享')
if(gsgitem)
	gsgitem.onclick = ->
		ga('send', 'event', '活動內頁', 'productlink', '建議小物')
if(gsgdress)
	gsgdress.onclick = ->
		ga('send', 'event', '活動內頁', 'productlink', '建議穿搭')
if(gna)
	gna.onclick = -> 
		ga('send', 'event', '活動內頁', 'eventlink', '一元復始開運金活動')
if(gns)
	gns.onclick = ->
		ga('send', 'event', '活動內頁', 'productlink', '開運商品馬上購買')
if(play-again)
	play-again.onclick= ->
		ga('send', 'event', '活動內頁', 'Play', '再玩一次')

# year = $year.options[$year.selectedIndex].value
# month = $month.options[$month.selectedIndex].value
# day = $day.options[$day.selectedIndex].value

# console.log(year)
# console.log(month)
# console.log(day)

if($login)
	$login.onclick = ->
		ga('send', 'event', '活動首頁', 'Play', '測2014運勢')
		localStorage['played'] = true
		game.play()

if($post)
	$post.onclick = ->
		fb.post()
if($draw)
	$draw.onclick = ->
		fb.draw()
if($postpic)
	$postpic.onclick = ->
		fb.postpic()

if content-value.value == 'content'
	played = localStorage['played'] || false
	if (!played)
		window.location.href="/2014kitty"
	
	loadingfn = ->
		lfn = setTimeout(
			->
				# fb.post() 
				b1.className = b1.className + ' b1c'
				b2.className = b2.className + ' b2c'
				b3.className = b3.className + ' b3c'
				b4.className = b4.className + ' b4c'
				b5.className = b5.className + ' b5c'
				loading.className = loading.className+' loadingclose'
		1000
		)
	closeloading = ->
		cfn = setTimeout(
			!->
				loading.className = loading.className + ' closeit'
				# console.log(scrolldiv.className)
				scrolldiv.className = scrolldiv.className + ' down'
		5000
		)

	myStopFunction = ->
		clearTimeout(lfn)
		clearTimeout(afn)

	loadingfn()
	closeloading()
# console.log navigator.userAgent
