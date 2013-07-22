makeAction = (name, change, action) ->
	ret = 
		action: "note#{action}"
		noteName: name,

	if change?
		ret.change = change
	ret

makeOff = (name) ->
	makeAction(name, null, 'Off')

makeOn = (name, freq) ->
	change = 
		'carrier.freq': freq
	makeAction(name, change, 'On')

randElement = (arr) ->
	arr[Math.floor(Math.random() * arr.length)]

generateScore = (length, nums, denoms, fundamental, entropy) ->
	score = []
	for i in [0..length]
		name = "benton#{i}"
		frequency = fundamental * (randElement(nums) / randElement(denoms))
		score.push makeOn(name, frequency)
		score.push makeOff(name)
	console.log(JSON.stringify(score))

generateScore(10, [1..7], [1..3], 200)