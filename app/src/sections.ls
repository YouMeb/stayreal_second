
page = window.page = sections.create()

# console.log pages
page.section 0, (section) !->
	# console.log(section)
	# console.log \123

	luckyballtop = document.querySelector '.lucky-ball-up'
	bg_3 = document.querySelector '.bg_3'
	bg_2 = document.querySelector '.bg_2'

	section.transitions [
		{
			key: 'top'
			start: 0
			end: 150 
			from: 120 
			to: -200 
			format: '%spx' 
			target: luckyballtop
		}
		{
			key: 'top'
			start: 100
			end: 150 
			from: 0
			to: -500
			format: '%spx' 
			target: bg_3
		}
		{
			key: 'opacity'
			start: 140
			end: 150 
			from: \.8
			to: 0
			format: '%s' 
			target: bg_3
		}
		{
			key: 'top'
			start: 0
			end: 150 
			from: 0
			to: 1600
			format: '%spx' 
			target: bg_2
		}
	]
page.section 1, (section) !->
	# console.log(section)
	# console.log \123
	# console.log(section)
	item = document.querySelector '.suggest-item'
	cloth = document.querySelector '.suggest-cloth'
	lucky = document.querySelector '.lucky-result-div'
	n-acti = document.querySelector '.n-acti'
	n-shop = document.querySelector '.n-shop'
	bg_2 = document.querySelector '.bg_2'
	
	section.transitions [
		{
			key: 'left'
			start: 0
			end: 120 
			from: -1000 
			to: 40 
			format: '%spx' 
			target: item
		}
		{
			key: 'opacity'
			start: 80
			end: 120 
			from: 0.3 
			to: 1 
			format: '%s' 
			target: item
			prefix: true
		}
		{
			key: 'transform'
			start: 0
			end: 120 
			from: 0
			to: 720
			format: 'rotateY(%sdeg)' 
			target: cloth
			prefix: true
		}
		{
			key: '-webkit-transform'
			start: 0
			end: 120 
			from: 1
			to: 1.1
			format: 'scale(%s)' 
			target: lucky
			prefix: true
		}
		{
			key: 'transform'
			start: 0
			end: 120 
			from: 1
			to: 1.1
			format: 'scale(%s)' 
			target: lucky
			prefix: true
		}
		{
			key: '-ms-transform'
			start: 0
			end: 120 
			from: 0
			to: 720
			format: 'rotateY(%sdeg)' 
			target: cloth
			prefix: true
		}
		{
			key: '-webkit-transform'
			start: 0
			end: 120 
			from: 0
			to: 720
			format: 'rotateY(%sdeg)' 
			target: cloth
			prefix: true
		}
		{
			key: 'right'
			start: 0
			end: 120 
			from: -1000 
			to: 52
			format: '%spx' 
			target: cloth
			
		}
		{
			key: 'opacity'
			start: 80
			end: 120 
			from: 0.3
			to: 1 
			format: '%s' 
			target: cloth
			prefix: true
		} 
		{
			key: '-webkit-transform'
			start: 0
			end: 120 
			from: 0
			to: 720
			format: 'rotateY(%sdeg)' 
			target: item
			prefix: true
		}
		{
			key: '-ms-transform'
			start: 0
			end: 120 
			from: 0
			to: 720
			format: 'rotateY(%sdeg)' 
			target: item
			prefix: true
		}
		{
			key: 'transform'
			start: 0
			end: 120 
			from: 0
			to: 720
			format: 'rotateY(%sdeg)' 
			target: item
			prefix: true
		} 
		{
			key: 'opacity'
			start: 80
			end: 120 
			from: 0.3
			to: 1 
			format: '%s' 
			target: n-acti
			prefix: true
		}
		{
			key: 'top'
			start: 100
			end: 150 
			from: 1600
			to: 1300
			format: '%spx' 
			target: bg_2
		}
		{
			key: '-webkit-transform'
			start: 100
			end: 150 
			from: 1
			to: 1.1
			format: 'scale(%s)' 
			target: bg_2
		}

	]

window.onload = -> 
	page.init()
