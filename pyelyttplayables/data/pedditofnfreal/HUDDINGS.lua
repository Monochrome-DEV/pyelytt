
local defaultNoteY = {}
local defaultNoteX = {}

function onCreate()
    makeLuaText('misstx','0',screenWidth,0,550)
    setTextSize('misstx',35)
    setTextBorder('misstx',1,'000000')
    setTextAlignment('misstx','center')
    addLuaText('misstx')
end
function onCreatePost()
    setProperty('scoreTxt.alpha',0)

    for i=0,getProperty("unspawnNotes.length")-1 do --honestly i have no idea how this hides only the opponents notes
        if not getPropertyFromGroup("unspawnNotes", i, "mustPress") then
        setPropertyFromGroup("unspawnNotes", i, "visible", false)
        end
    end
end

function onCountdownTick(counter)
    -- counter = 0 -> "Three"
    -- counter = 1 -> "Two"
    -- counter = 2 -> "One"
    -- counter = 3 -> "Go!"
    -- counter = 4 -> Nothing happens lol, tho it is triggered at the same time as onSongStart i think
    if counter == 3 then
        for i=0,7 do 
            table.insert(defaultNoteY,getPropertyFromGroup('strumLineNotes',i,'y'))
            table.insert(defaultNoteX,getPropertyFromGroup('strumLineNotes',i,'x'))
        end
        debugPrint(defaultNoteY)
        debugPrint(defaultNoteX)
    end
end

function noteBounce(dir, plr, reversBool)
    local noteId = dir
    local noteScale = 0.8
    local rotation = 15
    local yOffs = -5
    if plr then
        noteId = dir+4
    end
    if reversBool then
        noteScale = 0.6
        rotation = 30
        yOffs = 15
    end
    setPropertyFromGroup('strumLineNotes',noteId,'scale.x',noteScale)
    setPropertyFromGroup('strumLineNotes',noteId,'scale.y',noteScale)
    setPropertyFromGroup('strumLineNotes',noteId,'angle',math.random(-rotation,rotation))
    setPropertyFromGroup('strumLineNotes',noteId,'y',defaultNoteY[noteId]+yOffs)
    runTimer('NUnbounce'..noteId,0.2,1)
    noteTweenAngle('NAngleBounce'..noteId,noteId,0,0.4,'expoOut')
    noteTweenY('NYBounce'..noteId,noteId,defaultNoteY[noteId],0.4,'expoOut')
end

function onUpdatePost()

end

function onBeatHit()
    if curBeat == 60 then
        noteTweenX('funnynotetween1',4,92,1.2,'sineInOut')
        noteTweenX('funnynotetween2',5,204,1.4,'sineInOut')
    elseif curBeat == 64 then
        for i=0,3 do
            setPropertyFromGroup("opponentStrums", i, "visible", false)
        end
    elseif curBeat == 124 then
        noteTweenX('funnynotetween1',4,316,1.2,'sineInOut')
        noteTweenX('funnynotetween2',5,428,1.4,'sineInOut')
        noteTweenX('funnynotetween3',6,746,1.4,'sineInOut')
        noteTweenX('funnynotetween4',7,856,1.2,'sineInOut')
    elseif curBeat == 128 then
        setProperty('iconP1.alpha',0)
        setProperty('iconP2.alpha',0)
        setProperty('healthBar.alpha',0)
        setProperty('timeBar.alpha',0)
        setProperty('timeTxt.alpha',0)
    elseif curBeat == 192 then
        setProperty('camHUD.alpha',0)
    end
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
    noteBounce(noteData,true,false)
end

function noteMiss(id, noteData, noteType, isSustainNote)
	-- Called after the note miss calculations
	-- Player missed a note by letting it go offscreen
	setTextString('misstx',misses)
    noteBounce(noteData,true,true)
    setTextColor('misstx','FF0000')
    doTweenColor('missTween','misstx','FFFFFF',0.25,'sineOut')
end

function onTimerCompleted(tag, loops, loopsLeft)
	-- A loop from a timer you called has been completed, value "tag" is it's tag
	-- loops = how many loops it will have done when it ends completely
	-- loopsLeft = how many are remaining
    if tag == 'NUnbounce0' then
        setPropertyFromGroup('strumLineNotes',0,'scale.x',0.7)
        setPropertyFromGroup('strumLineNotes',0,'scale.y',0.7)
    elseif tag == 'NUnbounce1' then
        setPropertyFromGroup('strumLineNotes',1,'scale.x',0.7)
        setPropertyFromGroup('strumLineNotes',1,'scale.y',0.7)
    elseif tag == 'NUnbounce2' then
        setPropertyFromGroup('strumLineNotes',2,'scale.x',0.7)
        setPropertyFromGroup('strumLineNotes',2,'scale.y',0.7)
    elseif tag == 'NUnbounce3' then
        setPropertyFromGroup('strumLineNotes',3,'scale.x',0.7)
        setPropertyFromGroup('strumLineNotes',3,'scale.y',0.7)
    elseif tag == 'NUnbounce4' then
        setPropertyFromGroup('strumLineNotes',4,'scale.x',0.7)
        setPropertyFromGroup('strumLineNotes',4,'scale.y',0.7)
    elseif tag == 'NUnbounce5' then
        setPropertyFromGroup('strumLineNotes',5,'scale.x',0.7)
        setPropertyFromGroup('strumLineNotes',5,'scale.y',0.7)
    elseif tag == 'NUnbounce6' then
        setPropertyFromGroup('strumLineNotes',6,'scale.x',0.7)
        setPropertyFromGroup('strumLineNotes',6,'scale.y',0.7)
    elseif tag == 'NUnbounce7' then
        setPropertyFromGroup('strumLineNotes',7,'scale.x',0.7)
        setPropertyFromGroup('strumLineNotes',7,'scale.y',0.7)  
    end
end