local Hashes = {};

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

-- // Gun Hash // --
for i,v in pairs(getgc(true)) do 
	if type(v) == "function" and getfenv(v).script == game:GetService('ReplicatedStorage').Game.GunShop then 
		local Cons = getconstants(v)
		for i2,v2 in pairs(Cons) do 
			if i2 > 4 and table.find(Cons,'CanGrab') and i2 < 6 and table.find(Cons,'FireServer') then 
				addHash('GunHash',{Hash = tostring(v2)})
			end
		end
	end
end

return Hashes
