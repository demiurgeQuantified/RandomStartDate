old_createWorld = createWorld

function createWorld(args)
	if SandboxVars.RSD.randomiseDate then
		local options = getSandboxOptions()
		local startMonth = options:getOptionByName("StartMonth"):getValue():intValue()
		startMonth = ZombRand(1,13)
		options:set("StartMonth", startMonth)

		local startDay = options:getOptionByName("StartDay"):getValue():intValue()
		local lastDay = getGameTime():daysInMonth(options:getOptionByName("StartYear"):getValue():intValue(), startMonth - 1)
		if startDay > lastDay then
			startDay = ZombRand(0, lastDay)+1
		end
		options:set("StartDay", startDay)

		options:toLua()
	end
	old_createWorld(args)
end