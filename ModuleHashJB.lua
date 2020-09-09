local Hashes = {};
local API = {};

local getupvalues = debug.getupvalues or getupvalues;
local getconstants = debug.getconstants or getconstants;
local getupvalue = debug.getupvalue or getupvalue;
local getupvalue = debug.getconstant or getconstant;

for i,v in pairs(getgc(true)) do 
	if typeof(v) == 'function' then 
		if getfenv(v).script == game:GetService('Players').LocalPlayer.PlayerScripts.LocalScript then
			local constants = getconstants(v)
			if table.find(constants, "hems") and #constants == 1 then
				Hashes.All = getupvalue(v, 2)
			end
		end
	end
end

function API:addHash(name,hash)
    if tostring(name) ~= nil and tostring(hash) ~= nil then 
		Hashes[tostring(name)] = tostring(hash);
		return;
    end
end

function API:GetHash(hashName)
    -- // Hash Grabber // --
    if typeof(hashName) == 'string' then 
        for Info,Hash in pairs(Hashes) do 
            if Info and Hash then 
                return (Info == tostring(hashName) and tostring(Hash) or nil);
            end
        end
    end
end

function API:FindHash(hashTable)
	local da = tbl[1]
    local db = tbl[table.maxn(tbl)]
    local Hashes = AllHashes()
    for i,v in pairs(Hashes.All) do 
        if string.find(i,da) and string.find(i, db) and string.match(i,da) and string.match(i,db) then 
            return i
        end
    end
end

-- // Hash List // --
for i,v in pairs(getgc(true)) do 
	if type(v) == "function" then 
		if getfenv(v).script == game:GetService('ReplicatedStorage').Game.GunShop then 
			local Cons = getconstants(v)
			for i2,v2 in pairs(Cons) do 
				if i2 > 4 and table.find(Cons,'CanGrab') and i2 < 6 and table.find(Cons,'FireServer') then 
					API:addHash('GunHash',tostring(v2))
				end
			end
		end
	end
end

local path = getconstants(require(game:GetService('ReplicatedStorage').Game.Item.Taser).Tase)

for i,v in pairs(path) do 
    if i > table.find(path,'GetPlayerFromCharacter') and i < table.find(path,'Name') then 
        API:addHash('TaserHash',tostring(v))
    end
end
return API;
