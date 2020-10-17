identifiers = {}
function table.print(o)
	if type(o) == 'table' then
		local s = '{ '
		for k,v in pairs(o) do
			if type(k) ~= 'number' then k = '"'..k..'"' end
				s = s .. '['..k..'] = ' .. table.print(v) .. ','
			end
			return s .. '} '
	else
		return tostring(o)
	end
end

	function table.empty (self)
		for _, _ in pairs(self) do
				return false
		end
		return true
end
RegisterCommand("loadv", function(source, args, rawCommand)
 GetVehPlayerInfo(source)
 GetRankInfo(source)
end, true)

	function identifier(playerId)
		if not identifiers[playerId] then
			for k,v in ipairs(GetPlayerIdentifiers(playerId)) do
				if string.match(v, 'steam:') or string.match(v, 'fivem:') then
					identifiers[playerId] = v
					break
				end
			end    
		end
		
		return identifiers[playerId]
	end
  AddEventHandler('playerDropped', function(reason)
		local playerId = source
		identifiers[playerId] = nil 
  end)


  RegisterNetEvent("LoadVehicleData")
  AddEventHandler("LoadVehicleData", function()
    GetVehPlayerInfo(source)
  end)

  RegisterNetEvent("LoadRank")
  AddEventHandler("LoadRank", function()
    GetRankInfo(source)
  end)

  RegisterNetEvent("CarUnlock")
  AddEventHandler("CarUnlock", function(vehcileList)
    UpdateVehicles(source, vehcileList)
  end)

  RegisterNetEvent("SaveRank")
  AddEventHandler("SaveRank", function(RankID)
    SaveRank(source, RankID)
  end)

  function GetVehPlayerInfo(client)
    local steamId = GetPlayerIdentifier(client,0)
    MySQL.Async.fetchAll('SELECT vehicles FROM vehicles WHERE identifier = @identifier',
    { ['identifier'] = steamId },
    function(result)
      if #result == 0 then
        CreateVehPlayerInDB(client)
      else
      TriggerClientEvent("RecieveVehicleData", client, result[1]['vehicles'])
      end
    end)
  end
  
  function GetRankInfo(client)
    local steamId = GetPlayerIdentifier(client,0)
    MySQL.Async.fetchAll('SELECT users.rank FROM driftmode.users WHERE users.playerid = @identifier',
    { ['identifier'] = steamId },
    function(result)
      if table.empty(result) == true then
        print("rare af")
      else
      TriggerClientEvent("RecieveRank", client, result[1]['rank'])
      end
    end)
  end

  function UpdateVehicles(client, vehcileList)
    local steamid = GetPlayerIdentifier(client,0)
    MySQL.Async.execute('UPDATE vehicles SET vehicles = @vehicles WHERE identifier = @identifier',
    { ['vehicles'] = vehcileList, ['identifier'] = steamid },
      function(affectedRows)	
      end)
    end

    
  function SaveRank(client, RankID)
    local steamid = GetPlayerIdentifier(client,0)
    MySQL.Async.execute('UPDATE driftmode.users SET users.rank = @rank WHERE playerid = @identifier',
    { ['rank'] = tostring(RankID), ['identifier'] = steamid },
      function(affectedRows)
      end)	
    end
    
    function CreateVehPlayerInDB(client)
      local steamId = GetPlayerIdentifier(client,0)
        MySQL.Async.execute('INSERT INTO vehicles (identifier) VALUES (@identifier)',
        { ['identifier'] = steamId},
          function(affectedRows)
            if affectedRows == 1 then
              GetVehPlayerInfo(client)
            end
          end)
    end
