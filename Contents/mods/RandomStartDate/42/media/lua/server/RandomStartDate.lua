if isClient() then
    return
end

local RAND = newrandom()


local RandomStartDate = {}


---Randomises the start date and sets the current date to it.
function RandomStartDate.randomiseStartDate()
    local gameTime = getGameTime()

    local startMonth = RAND:random(12) - 1

    local daysInMonth = gameTime:daysInMonth(SandboxVars.StartYear, startMonth)
    local startDay = RAND:random(0, daysInMonth) - 1

    gameTime:setMonth(startMonth)
    gameTime:setDay(startDay)
    gameTime:setStartMonth(startMonth)
    gameTime:setStartDay(startDay)
end


Events.OnLoadRadioScripts.Add(function(_, isNewGame)
    ---@diagnostic disable-next-line: undefined-field
    if isNewGame and SandboxVars.RandomStartDate.randomiseDate then
        RandomStartDate.randomiseStartDate()
    end
end)


return RandomStartDate