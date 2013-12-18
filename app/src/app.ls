fbAppId = '219756031530311'

init = 	
	login: 0
	voted: 0

game = 
	init: ->
		new Date().getTime()
	play: ->
		console.log \go!

fb = 
	tk:'78c9b51f7ba165e2feaa6ff635b9c2ed'
	at:''
	init : -> initfb() 
	login : -> loginfb()
	post : -> postfb()

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
			FB.api('/me', (response)->
				init.login = 1
				console.log(response)		

			)
	,scope:'email,photo_upload,publish_actions'
	)
	false

const postfb = ->
	console.log \123

$post = document.getElementById('post')
$login = document.getElementById('login')
fb.init()

$login.onclick = ->
	fb.login()		
$post.onclick = ->
	fb.post()
