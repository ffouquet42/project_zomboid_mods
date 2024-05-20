--[[
Github: ffouquet42
--]]

local function giveCigarettesToSmoker(playerIndex, player)

	-- Ensure character have Smoker trait
    if player:HasTrait("Smoker") then

		-- Give between 0 and 20 cigarettes
        local cigarettesToGive = ZombRand(21)

        for i = 1, cigarettesToGive do
            local cigarette = InventoryItemFactory.CreateItem("Base.Cigarettes")
            player:getInventory():AddItem(cigarette)
        end
		

		-- Provide a way to light a cigarette (70% - Lighter / 25% - Matches / 5% - Nothing) with more or less use remaining
		local lighterOrMatch = ZombRand(1, 101)
		
		if lighterOrMatch <= 70 then
			local lighterUsed = player:getInventory():AddItem("Base.Lighter")
			lighterUsed:setUsedDelta(ZombRand(1, 11) / 10)
		elseif lighterOrMatch <= 95 then
			local MatchesUsed = player:getInventory():AddItem("Base.Matches")
			MatchesUsed:setUsedDelta(ZombRand(1, 11) / 10)
		else
		end
		
    end

end

-- local function onKeyPressed(key)
-- 	local player = getPlayer()
--     if key == 16 then
-- 		giveCigarettesToSmoker(player:getID(), player)
--     end
-- end

Events.OnCreatePlayer.Add(giveCigarettesToSmoker)
-- Events.OnKeyPressed.Add(onKeyPressed)