local Hashes = {};

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

function Hashes:addHash(name,properties)
    -- // Hash Adder // --
    local hash = properties.Hash;

    if tostring(name) ~= nil and tostring(hash) ~= nil then 
        Hashes[#Hashes + 1] = {HashInfo = tostring(name), HashString = hash};
        return;
    end
end

function Hashes:removeHash(name)
    -- // Hash Remover // --
    if typeof(name) == "string" then 
        for k,v in next, Hashes do 
            if v.HashInfo == tostring(name) then 
                 table.remove(Hashes,k)
            end
        end
    end
end

function Hashes:GetHash(hashName)
    -- // Hash Grabber // --
    if typeof(hashName) == 'string' then 
        for _,Info in pairs(Hashes) do 
            if Info.HashInfo and Info.HashString then 
                return (Info.HashInfo == tostring(hashName) and tostring(Info.HashString) or nil);
            end
        end
    end
end

function Hashes:FindHash(hashTable)
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
					Hashes:addHash('GunHash',{Hash = tostring(v2)})
				end
			end
		end
	end
end

local path = getconstants(require(game:GetService('ReplicatedStorage').Game.Item.Taser).Tase)

for i,v in pairs(path) do 
    if i > table.find(path,'GetPlayerFromCharacter') and i < table.find(path,'Name') then 
        Hashes:addHash('TaserHash',{Hash = tostring(v)})
    end
end

return Hashes
