local Hashes = {};

local getupvalues = debug.getupvalues or getupvalues;
local getconstants = debug.getconstants or getconstants;
local getupvalue = debug.getupvalue or getupvalue;
local getconstant = debug.getconstant or getconstant;

AllHashes = {};
for i,v in pairs(getgc(true)) do 
	if typeof(v) == 'function' then 
		if getfenv(v).script == game:GetService('Players').LocalPlayer.PlayerScripts.LocalScript then
			local constants = getconstants(v)
			if table.find(constants, "hems") and #constants == 1 then
				AllHashes = getupvalue(v, 2)
			end
		end
	end
end

-- // Hash List // --
for i,v in pairs(getgc(true)) do 
	if type(v) == "function" then 
		if getfenv(v).script == game:GetService('ReplicatedStorage').Game.GunShop then 
			local cons = getconstants(v)
			for i2,v2 in pairs(cons) do 
				if i2 > 4 and table.find(cons,'CanGrab') and i2 < 6 and table.find(cons,'FireServer') then 
					Hashes.GunHash = tostring(v2)
				end
			end
		elseif getfenv(v).script == localScript then 
			local cons = getconstants(v)
			for i2,v2 in pairs(cons) do
				if table.find(cons,'Breakout') and i2 > 1 and i2 < 3 then 
					Hashes.BreakOut = tostring(v2)
				end
			end
		end
	end
end

local path = getconstants(require(game:GetService('ReplicatedStorage').Game.Item.Taser).Tase)
for i,v in pairs(path) do 
	if i > table.find(path,'GetPlayerFromCharacter') and i < table.find(path,'Name') then 
        Hashes.Taser = tostring(v)
    end
end

return Hashes;
