fbAppId = '219756031530311'

init = 	
	login: 0
	voted: 0

game = 
	array:['good1' 'good2' 'nice1' 'nice2' 'nice3' 'oops' 'soso1' 'soso2']
	go: (r)->
		window.location.href = '/content-'+@array[r]+'.html'
	init: ->
		new Date().getTime()
	play: ->
		maxNum = 7  
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
	FB.login((res)->
		if(res.authResponse)
			FB.api('/me', (response) !->
				init.login = 1
				console.log(response)	
				if(!response.verified)
					alert('很抱歉你的帳號未通過驗證！再試一次')
				FB.getLoginStatus((_resp) ->
					console.log(_resp)
					if (_resp.status === 'connected') 
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

const postfb = ->
	FB.ui(
		method:'feed'
		name: '123'
		link: 'https://kktix.com/events/devhappyday'
		caption: '123'
		description: '1232312312312'		
	(resp)->
		console.log(resp)
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
	console.log(fb.at)
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


# year = $year.options[$year.selectedIndex].value
# month = $month.options[$month.selectedIndex].value
# day = $day.options[$day.selectedIndex].value

# console.log(year)
# console.log(month)
# console.log(day)

fb.init()

if($login)
	$login.onclick = ->
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