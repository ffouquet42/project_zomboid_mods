--[[ 
Ultimate Smoker 41.78.16 stable
This mod may be not compatible with other smokers mods
SP : OK
MP : TD
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
		

		-- Provide a way to light a cigarette with more or less use remaining
		local lighterOrMatch = ZombRand(1, 101)
		
		if lighterOrMatch <= 50 then
			local lighterUsed = player:getInventory():AddItem("Base.Lighter")
			lighterUsed:setUsedDelta(ZombRand(1, 11) / 10)
		elseif lighterOrMatch <= 65 then
			local MatchesUsed = player:getInventory():AddItem("Base.Matches")
			MatchesUsed:setUsedDelta(ZombRand(1, 11) / 10)
		elseif lighterOrMatch <= 85 then
			local RefillableLighterUsed = player:getInventory():AddItem("Base.RefillableLighter")
			RefillableLighterUsed:setUsedDelta(ZombRand(1, 11) / 10)
		elseif lighterOrMatch <= 95 then
			local EmptyLighter = player:getInventory():AddItem("Base.EmptyLighter")
		else -- useless?
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