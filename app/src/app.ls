fbAppId = '219756031530311'

# console.log(window.innerHeight)

init = 	
	login: 0
	voted: 0

game = 
	array:['best' 'better' 'bravo' 'bravo' 'bravo' 'good' 'ok1' 'ok2' 'oops' 'soso']
	go: (r)->
		window.location.href = 'content-'+@array[r]+'.html'
	init: ->
		new Date().getTime()
	play: ->
		maxNum = 9  
		minNum = 0
		n = Math.floor(Math.random() * (maxNum - minNum + 1)) + minNum
		@go(n)
		# console.log n

fb = 
	at:''
	user_id: ''
	init : -> initfb() 
	login : -> loginfb()
	post : -> postfb()
	draw : -> drawfb()
	postpic : -> postpicfb()


const initfb = ->
	FB.init(
		appId:fbAppId
		status:true
		cookie:true
		xfbml:true
	)

const loginfb = ->
	if(FB)
		FB.login((res)->
			if(res.authResponse)
				FB.api('/me', (response) !->
					init.login = 1
					# console.log(response)	
					if(!response.verified)
						alert('很抱歉你的帳號未通過驗證！再試一次')
					FB.getLoginStatus((_resp) ->
						# console.log(_resp)
						if (_resp.status == 'connected') 
							uid = _resp.authResponse.userID
							accessToken = _resp.authResponse.accessToken
							# console.log(accessToken)
							fb.user_id = _resp.authResponse.userID
							fb.at = accessToken
							game.play()
						else
							false
					)	
				)
		,scope:'email,photo_upload,publish_actions'
		)
		false
	else
		game.play()
const postfb = ->
	# desp = document.ge
	# meta[name=description]
	metas = document.getElementsByTagName('meta')
	# console.log(metas)
	for i from 0 to metas.length-1 by 1
		# console.log(metas[i].getAttribute("property"))
		if (metas[i].getAttribute("property") == "og:description") 
			mdesp = metas[i].getAttribute("content")
		if (metas[i].getAttribute("property") == "og:title") 
			mtitle = metas[i].getAttribute("content")
			# console.log(mtitle)		
		if (metas[i].getAttribute("property") == "og:url") 
			murl = metas[i].getAttribute("content")
		if (metas[i].getAttribute("property") == "og:image") 
			mimage = metas[i].getAttribute("content")

	FB.ui(
		method:'feed'
		name: mtitle
		link: murl
		caption: ''
		picture: mimage
		description: mdesp
	)
	# console.log(fb.at)
	# xhr = new XMLHttpRequest()
	# xhr.onload = resp
	# xhr.open(
	# 	'POST'
	# 	'https://graph.facebook.com/me/stayrealxkitty:draw?access_token='+fb.at+'&method=POST&c'
	# 	true
	# )
	# xhr.send()

const postpicfb = ->
	FB.api(
		fb.user_id + '/photos' 
		'post' 
		{
			from: from
			url: url_to_foto 
			message: mess 
			access_token: fb.at 
		}
		(response)-> 
			if (response && !response.error) 
				control.content.PageName.update_post("success", response.post_id)
			else 
				control.content.PageName.update_post("error", "")      
	)


const drawfb = ->
	# console.log(fb.at)
	xhr = new XMLHttpRequest()
	xhr.onload = resp
	xhr.open(
		'POST'
		'https://graph.facebook.com/me/stayrealxkitty:draw?access_token='+fb.at+'&method=POST&lucky_stick=http%3A%2F%2Fsamples.ogp.me%2F220274168145164'
		true
	)
	xhr.send()		


const resp = ->
	console.log(this.responseText)


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
gfb = document.querySelector('.fbaaa')
gweibo = document.querySelector('.weiboaaa')
gsgitem = document.getElementById('sgitem')
gsgdress = document.getElementById('sgdress')
gna = document.getElementById('gna')
gns = document.getElementById('gns')
play-again = document.getElementById('play-again')

if(gfb)
	gfb.onclick = ->
		if content-value.value == 'content'
			ga('send', 'event', '活動內頁2', 'FB button', 'Facebook分享')
		else
			ga('send', 'event', '活動首頁', 'FB button', 'Facebook分享')

if(gweibo)
	gweibo.onclick = ->
		if content-value.value == 'content'
			ga('send', 'event', '活動內頁2', 'Weibo button', '微博分享')
		else 
			ga('send', 'event', '活動首頁', 'Weibo button', '微博分享')
if(gsgitem)
	gsgitem.onclick = ->
		ga('send', 'event', '活動內頁2', 'productlink', '建議小物')
if(gsgdress)
	gsgdress.onclick = ->
		ga('send', 'event', '活動內頁2', 'productlink', '建議穿搭')
if(gna)
	gna.onclick = -> 
		if content-value.value == 'content'
			ga('send', 'event', '活動內頁2', 'eventlink', '一元復始開運金活動')
		else
			ga('send', 'event', '活動首頁', 'eventlink', '一元復始開運金活動')
if(gns)
	gns.onclick = ->
		if content-value.value == 'content'
			ga('send', 'event', '活動內頁2', 'productlink', '開運商品馬上購買')
		else
			ga('send', 'event', '活動首頁', 'productlink', '開運商品馬上購買')
if(play-again)
	play-again.onclick= ->
		ga('send', 'event', '活動內頁2', 'Play', '再玩一次')
# year = $year.options[$year.selectedIndex].value
# month = $month.options[$month.selectedIndex].value
# day = $day.options[$day.selectedIndex].value

# console.log(year)
# console.log(month)
# console.log(day)

fb.init()

if($login)
	$login.onclick = ->
		ga('send', 'event', '活動首頁', 'Play', '測2014運勢')
		fb.login()			

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
	lasturl = document.referrer
	reg = /(istayreal)|(localhost)/
	if (!reg.test(lasturl))
		window.location.href = '/'
	FB.getLoginStatus((_resp) ->
		# console.log(_resp)
		if (_resp.status == 'connected') 
			uid = _resp.authResponse.userID
			accessToken = _resp.authResponse.accessToken
			fb.at = accessToken	
		else
			window.location.href="/2014kitty"
	)
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
	autosharefn = ->
		afn = setTimeout(
			->
				fb.post() 
		5000
		)

	myStopFunction = ->
		clearTimeout(lfn)
		clearTimeout(afn)

	loadingfn()
	autosharefn()
	closeloading()
# console.log navigator.userAgent
