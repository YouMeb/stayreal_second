
fbAppId = '219756031530311'
fb = 
	at:''
	init : -> initfb() 
	login : -> loginfb()
	post : -> postfb()

FB.init(
	appId:fbAppId
	status:true
	cookie:true
	xfbml:true
)
FB.getLoginStatus((_resp) ->
	console.log(_resp)
	if (_resp.status === 'connected') 
		uid = _resp.authResponse.userID
		accessToken = _resp.authResponse.accessToken
		console.log(accessToken)
		fb.at = accessToken
		# window.location.href= '/content.html'
	else
		false
)	

