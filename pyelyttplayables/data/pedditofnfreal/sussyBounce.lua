local bfsX = 0
local bfsY = 0

local dadsX = 0
local dadsY = 0

local beat = 0

local bfsing = false
local dadsing = false

function onSongStart()
	bfsX = getProperty('boyfriend.x')
	bfsY = getProperty('boyfriend.y')
	
	dadsX = getProperty('dad.x')
	dadsY = getProperty('dad.y')
	
end

function onBeatHit()
	beat = beat + 1
	if getProperty('boyfriend') and beat == 2 and not bfsing then
		setProperty('boyfriend.y',bfsY+20)
		setProperty('boyfriend.x',bfsX-20)
		setProperty('boyfriend.angle',-20)
		doTweenY('wifjwiuuf2','boyfriend',bfsY,0.36,'linear')
		doTweenX('wifjwiuuf2X','boyfriend',bfsX,0.36,'quadIn')
		doTweenAngle('wifjwiuuf2A','boyfriend',-10,0.36,'quadIn')
	end
	
	if beat == 2 then 
		beat = 0
	end
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
	-- Function called when you hit a note (after note hit calculations)
	-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
	-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
	-- noteType: The note type string/tag
	-- isSustainNote: If it's a hold note, can be either true or false
	cancelTimer('singOffBF')
	bfsing = true
	runTimer('singOffBF', 0.3, 1)
	
	if isSustainNote == false then
		if noteData	== 0 or noteData == 3 then
			cancelTween('bfTweenX')
			cancelTween('bfTweenXB')
			doTweenX('bfTweenXB', 'boyfriend', bfsX, 0.3, 'cubeOut')
		elseif noteData == 1 or noteData == 2 then
			cancelTween('bfTweenY')
			cancelTween('bfTweenYB')
			doTweenY('bfTweenYB', 'boyfriend', bfsY, 0.3, 'cubeOut')
		end
		cancelTween('bfTweenA')

		if noteData == 0 then
			setProperty('boyfriend.x',bfsX-80)
			setProperty('boyfriend.angle',-40)
			doTweenAngle('bfTweenA','boyfriend',-20,0.3,'cubeOut')
		end
		if noteData == 1 then
			setProperty('boyfriend.y',bfsY+40)
			setProperty('boyfriend.angle',-30)
			doTweenAngle('bfTweenA','boyfriend',-20,0.3,'cubeOut')
		end	
		if noteData == 2 then
			setProperty('boyfriend.y',bfsY-120)
			setProperty('boyfriend.angle',40)
			doTweenAngle('bfTweenA','boyfriend',20,0.3,'cubeOut')
		end
		if noteData == 3 then
			setProperty('boyfriend.x',bfsX+80)
			setProperty('boyfriend.angle',60)
			doTweenAngle('bfTweenA','boyfriend',30,0.3,'cubeOut')
		end
	end
end

function opponentNoteHit(id, noteData, noteType, isSustainNote)
	-- Function called when you hit a note (after note hit calculations)
	-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
	-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
	-- noteType: The note type string/tag
	-- isSustainNote: If it's a hold note, can be either true or false
	cancelTimer('singOffDad')
	dadsing = true
	runTimer('singOffDad', 0.06, 1)
	
	if isSustainNote == false and EVIL == true then
		if noteData	== 0 or noteData == 3 then
			cancelTween('dadTweenX')
			cancelTween('dadTweenXB')
			doTweenX('dadTweenXB', 'dad', dadsXX, 0.3, 'cubeOut')
		elseif noteData == 1 or noteData == 2 then
			cancelTween('bfTweenY')
			cancelTween('bfTweenYB')
			doTweenY('dadTweenYB', 'dad', dadsY, 0.3, 'cubeOut')
		end
		
		if noteData == 0 then
			setProperty('boyfriend.x',bfsX-80)
			setProperty('boyfriend.angle',-40)
			doTweenAngle('bfTweenA','boyfriend',-20,0.3,'cubeOut')
		end
		if noteData == 1 then
			setProperty('boyfriend.y',bfsY+40)
			setProperty('boyfriend.angle',-30)
			doTweenAngle('bfTweenA','boyfriend',-20,0.3,'cubeOut')
		end	
		if noteData == 2 then
			setProperty('boyfriend.y',bfsY-120)
			setProperty('boyfriend.angle',40)
			doTweenAngle('bfTweenA','boyfriend',20,0.3,'cubeOut')
		end
		if noteData == 3 then
			setProperty('boyfriend.x',bfsX+80)
			setProperty('boyfriend.angle',60)
			doTweenAngle('bfTweenA','boyfriend',30,0.3,'cubeOut')
		end
	end
end

function noteMiss(id, direction, noteType, isSustainNote)
	-- Called after the note miss calculations
	-- Player missed a note by letting it go offscreen
	
end

function onTimerCompleted(tag, loops, loopsLeft)
	-- A loop from a timer you called has been completed, value "tag" is it's tag
	-- loops = how many loops it will have done when it ends completely
	-- loopsLeft = how many are remaining
	if tag == 'singOffBF' then
		bfsing = false
	end
	if tag == 'singOffDad' then
		dadsing = false
	end
	
end