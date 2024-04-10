local evile = 0

function onCreatePost()
    setProperty('health', 0.25)
end

function onUpdatePost()
    if evile == 1 then
        setProperty('health', getProperty('health')-0.0001)
    elseif evile == 2 then
        setProperty('health', getProperty('health')-0.0005)
    end
end

function onStepHit()
    if curStep == 256 then
        evile = 1
    elseif curStep == 512 then
        evile = 2
    end
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
    if evile > 0 then
        if not isSustainNote then
            setProperty('health',getProperty('health')-0.02)
        end
    end
end

function noteMiss(id, noteData, noteType, isSustainNote)
	-- Called after the note miss calculations
	-- Player missed a note by letting it go offscreen
end