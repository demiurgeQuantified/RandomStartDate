if not isServer() then return end

function RSD_correctDate()
    if not ModData.exists("RandomStartDateChanged") and SandboxVars.RSD.randomiseDate then
        local startMonth = ZombRand(0,12)

        local lastDay = getGameTime():daysInMonth(SandboxVars.StartYear, startMonth)
        local startDay = ZombRand(0, lastDay)

        getGameTime():setMonth(startMonth)
        getGameTime():setDay(startDay)
        getGameTime():setStartMonth(startMonth)
        getGameTime():setStartDay(startDay)
        ModData.create("RandomStartDateChanged")
    end
    RSD_correctDate = nil
end


Events.OnGameTimeLoaded.Add(RSD_correctDate)