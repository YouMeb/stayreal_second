
page = window.page = sections.create()

console.log page
page.section 0, (section) !->
	console.log(section)
	console.log \123

	luckyballtop = document.querySelector '.lucky-ball-up'

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
	]
page.section 1, (section) !->
	console.log(section)
	console.log \123
	item = document.querySelector '.suggest-item'
	cloth = document.querySelector '.suggest-cloth'
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
			from: 0.8 
			to: 1 
			format: '%s' 
			target: item
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
			from: 0.8 
			to: 1 
			format: '%s' 
			target: cloth
			prefix: true
		}    
	]

window.onload = -> 
	page.init()
