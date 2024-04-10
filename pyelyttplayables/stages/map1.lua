function onCreate()
	-- background shit
	makeLuaSprite('bg', 'doom2map1', -620, -50)
	addLuaSprite('bg', false)
	setProperty('bg.alpha', 1)

	makeLuaSprite('peppibg', 'PEPPITO', -262.5, 0)
	addLuaSprite('peppibg', false)
	setProperty('peppibg.alpha', 0)

	setObjectCamera('peppibg','hud')
	scaleObject('peppibg',4,4)

	makeAnimatedLuaSprite('handstrans','handz',-250,0)
	addAnimationByPrefix('handstrans','transition','handing',12,false)

	makeAnimatedLuaSprite('transNeck','neckbrokelma',-250,0)
	addAnimationByPrefix('transNeck','estrogen','break',35,false)

	setObjectCamera('handstrans','hud')
	setObjectCamera('transNeck','hud')
	
	scaleObject('handstrans',4,4)
	scaleObject('transNeck',4,4)
	
	setProperty('handstrans.alpha', 0)
	setProperty('transNeck.alpha', 0)

	addLuaSprite('handstrans', false)
	addLuaSprite('transNeck', false)

	setProperty('bg.antialiasing', false)
	setProperty('peppibg.antialiasing', false)
	setProperty('handstrans.antialiasing', false)
	setProperty('transNeck.antialiasing', false)



	makeLuaSprite('cover', 'milk', -100, -100)
	setObjectCamera('cover','hud')
	scaleObject('cover',4,4)
	setProperty('cover.alpha', 0)
	addLuaSprite('cover', false)
end

function onSongStart()
	triggerEvent('Camera Follow Pos',158,310)
end

function onStepHit()
	if curStep == 244 then
		setProperty('cover.color',0xFF0000)
		if not flashingLights then
			doTweenAlpha('redIn','cover',1,1,'linear')
		end
	elseif curStep == 256 then
		setProperty('cover.alpha', 1)
		doTweenAlpha('redflash','cover',0,1,'linear')

		setProperty('bg.alpha', 0)
		setProperty('peppibg.alpha', 1)
		setProperty('handstrans.alpha', 0)

		setProperty('boyfriend.alpha',0)
		setProperty('dad.alpha',0)
	elseif curStep == 512 then
		setProperty('peppibg.alpha', 0)
		setProperty('transNeck.alpha', 0)
	end
end

function onEvent(name, value1, value2, strumTime)
	-- event note triggered
	-- triggerEvent() does not call this function!!

	-- print('Event triggered: ', name, value1, value2, strumTime);
	
	if flashingLights then
		if name == 'transition' then
			if value1 == 'hands' then
				setProperty('handstrans.alpha', 1)
				objectPlayAnimation('handstrans','transition',true)
			elseif value1 == 'break' then
				setProperty('transNeck.alpha', 1)
				objectPlayAnimation('transNeck','estrogen',true)
			end
		end
	end
end