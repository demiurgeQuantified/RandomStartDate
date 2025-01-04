if isClient() then return end

local RAND = newrandom()

local RandomStartDate = {}

---Randomises the start date and sets the current date to it.
RandomStartDate.randomiseStartDate = function()
    local gameTime = getGameTime()

    local startMonth = RAND:random(12) - 1

    local daysInMonth = gameTime:daysInMonth(SandboxVars.StartYear, startMonth)
    local startDay = RAND:random(0, daysInMonth) - 1

    gameTime:setMonth(startMonth)
    gameTime:setDay(startDay)
    gameTime:setStartMonth(startMonth)
    gameTime:setStartDay(startDay)
end

---Called during the loading process.
---@param isNewGame boolean Whether it is a new game.
RandomStartDate.onWorldLoaded = function(isNewGame)
    if isNewGame and SandboxVars.RandomStartDate.randomiseDate then
        RandomStartDate.randomiseStartDate()
    end
end

Events.OnInitGlobalModData.Add(RandomStartDate.onWorldLoaded)

return RandomStartDate