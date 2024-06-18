local function giveCigarettesToSmoker(playerIndex, player)

    -- Ensure character has Smoker trait
    if player:HasTrait("Smoker") then

        -- Calculate time survived in minutes
        local timeSurvived = player:getHoursSurvived() * 60

		-- Check if time survived is under 5 minutes
		if timeSurvived < 5 then

            -- Give between 0 and 20 cigarettes
            local cigarettesToGive = ZombRand(21)

            for i = 1, cigarettesToGive do
                local cigarette = InventoryItemFactory.CreateItem("Base.Cigarettes")
                player:getInventory():AddItem(cigarette)
            end
            
            -- Provide a way to light a cigarette with more or less use remaining
            local lighterOrMatch = ZombRand(1, 101)
            
            if lighterOrMatch <= 50 then -- 50% Base Lighter
                local lighterUsed = player:getInventory():AddItem("Base.Lighter")
                lighterUsed:setUsedDelta(ZombRand(1, 11) / 10)
            elseif lighterOrMatch <= 70 then -- 20% Base Matches
                local MatchesUsed = player:getInventory():AddItem("Base.Matches")
                MatchesUsed:setUsedDelta(ZombRand(1, 11) / 10)
            elseif lighterOrMatch <= 85 then -- 15% Refillable Lighter
                local RefillableLighterUsed = player:getInventory():AddItem("Base.RefillableLighter")
                RefillableLighterUsed:setUsedDelta(ZombRand(1, 11) / 10)
            elseif lighterOrMatch <= 95 then -- 10% Empty Lighter
                local EmptyLighter = player:getInventory():AddItem("Base.EmptyLighter")
            else -- 5% Nothing
            end
        end
    end
end

Events.OnCreatePlayer.Add(giveCigarettesToSmoker)