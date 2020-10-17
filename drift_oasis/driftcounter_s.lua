local SaveAtEndOfDrift = GetConvar("DriftC_SaveAtEndOfDrift", "true")
local SaveTime = GetConvar("DriftC_SaveTime", 1000) 
local scoreboardData = {}
if SaveAtEndOfDrift == "true" then SaveAtEndOfDrift = true else SaveAtEndOfDrift = false end


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
	
	function identifier(playerId)
		if not identifiers[playerId] then
			for k,v in ipairs(GetPlayerIdentifiers(playerId)) do
				if string.match(v, 'steam:') or string.match(v, 'fivem:') or string.match(v, 'license:') or string.match(v, 'discord:') or string.match(v, 'xbl:') or string.match(v, 'live:') then
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
	Citizen.CreateThread(function()	
		RegisterNetEvent("RequestConfig")
		AddEventHandler("RequestConfig", function()
			TriggerClientEvent("RecieveConfig", source, SaveAtEndOfDrift, SaveTime)
		end)

		RegisterNetEvent("SaveRank")
		AddEventHandler("SaveRank", function(client, rank)	
			local id = GetPlayerIdentifier(client, 0)
			
			if rank == "decent" then
				file = io.open("ranks/"..rank..".cfg", "a")
				io.output(file)
				io.write("add_principal identifier."..id.." group."..rank.."", "\n")
				ExecuteCommand("add_principal identifier."..id.." group."..rank.."")
				io.flush()
			end

			if rank == "pro" then
				file = io.open("ranks/"..rank..".cfg", "a")
				io.output(file)
				io.write("add_principal identifier."..id.." group."..rank.."", "\n")
				ExecuteCommand("add_principal identifier."..id.." group."..rank.."")
				io.flush()
			end

			if rank == "instructor" then
				file = io.open("ranks/"..rank..".cfg", "a")
				io.output(file)
				io.write("add_principal identifier."..id.." group."..rank.."", "\n")
				ExecuteCommand("add_principal identifier."..id.." group."..rank.."")
				io.flush()
			end

			if rank == "legendary" then
				file = io.open("ranks/"..rank..".cfg", "a")
				io.output(file)
				io.write("add_principal identifier."..id.." group."..rank.."", "\n")
				ExecuteCommand("add_principal identifier."..id.." group."..rank.."")
				io.flush()
			end

			if rank == "king" then
				file = io.open("ranks/"..rank..".cfg", "a")
				io.output(file)
				io.write("add_principal identifier."..id.." group."..rank.."", "\n")
				ExecuteCommand("add_principal identifier."..id.." group."..rank.."")
				io.flush()
			end

		end)	

			RegisterNetEvent("SaveScore")
			AddEventHandler("SaveScore", function(client, data)	
			UpdatePlayerInDB(client, data)
			end)
				
				RegisterNetEvent("LoadScoreData")
				AddEventHandler("LoadScoreData", function()
					GetPlayerInfo(source)
				end)

				RegisterNetEvent("LoadDriftPointInfo")
								AddEventHandler("LoadDriftPointInfo", function(client)
								
									local src = source
									local steamId = GetPlayerIdentifier(client, 0)
									MySQL.Async.fetchAll('SELECT playerid, points FROM users WHERE playerid = @playerid',
									{ ['playerid'] = steamId },
									function(result)
										if table.empty(result) == true then
											print("table is empty")
										else
											TriggerClientEvent("LoadDriftPoints", src, result[1]['points'])
										end
									end)
								end)
				
function GetPlayerInfo(client)
	local steamId = GetPlayerIdentifier(client,0)
	MySQL.Async.fetchAll('SELECT playerid, points FROM users WHERE playerid = @playerid',
	{ ['playerid'] = steamId },
	function(result)
		if table.empty(result) == true then
			CreatePlayerInDB(client)
		else
		TriggerClientEvent("LoadScore", client, result[1]['points'])
		end
	end)
end

-- RegisterNetEvent("GetScoreboardDriftInfo")
-- AddEventHandler("GetScoreboardDriftInfo", function(source, client)
-- 	print("in mysql event id:", client)
-- 	local steamId = GetPlayerIdentifier(client,0)
-- 	MySQL.Async.fetchAll('SELECT playerid, points FROM users WHERE playerid = @playerid',
-- 	{ ['playerid'] = steamId },
-- 	function(result)
-- 		if table.empty(result) == false then
-- 			if #scoreboardData == 0 then
-- 			table.insert(scoreboardData, {id = result[1]['playerid'], money = result[1]['points']})
-- 			elseif #scoreboardData > 0 then
-- 				for k, v in pairs(scoreboardData) do
-- 					if tostring(k) == "id" then
-- 						if tonumber(v) == tonumber(result[1]['playerid']) then
-- 							print("player already added")
-- 						else
-- 							table.insert(scoreboardData, {id = result[1]['playerid'], money = result[1]['points']})
-- 						end
-- 					end
-- 				end
-- 			end
-- 		else
-- 			print("table is empty")
-- 		end				
-- 		if tonumber(#scoreboardData) >= 1 then 			
-- 			TriggerClientEvent("LoadDriftData", client, json.encode(scoreboardData))
-- 		end
-- 	end)
-- end)

-- RegisterNetEvent("GetScoreboardDriftInfo")
-- AddEventHandler("GetScoreboardDriftInfo", function(source, client)
-- 	local steamId = GetPlayerIdentifier(client,0)
-- 	MySQL.Async.fetchAll('SELECT users.id, users.name, users.rank, users.points FROM driftmode.users WHERE playerid = @playerid',
-- 	{ ['playerid'] = steamId },
-- 	function(result)
-- 		if result ~= nil then
-- 			return json.encode(result) -- [{"points":186943244,"rank":1,"id":12,"name":"REDRUM"}]
-- 		else
-- 			print("query returned no results")
-- 		end				
-- 	end)
-- end)
local function GetScoreboardDriftInfoCallback(player, target, result)
	-- TODO: Check if player is still an active player
	if(not result or #result == 0) then
			-- either an internal server error occured (potentially - dunno how MySQL.Async internal error handling look like?)
			-- or no results were returned
			print("query returned no results")
			return
	end

	local jsonResult = json.encode(result)

	-- do something with jsonResult here
end

RegisterNetEvent("GetScoreboardDriftInfo")
AddEventHandler("GetScoreboardDriftInfo", function(source, client)
	-- FIX: steam identifier is not guranteed to be at index 0 ...
	local steamId = GetPlayerIdentifier(client,0)

	MySQL.Async.fetchAll(
			"SELECT id, name, rank, points FROM users WHERE playerid = @playerid",
			{ ["playerid"] = steamId },
			function(...) GetScoreboardDriftInfoCallback(source, client, ...) end
	)
end)

RegisterCommand("showactive", function(source, args, rawCommand)
	for k, v in pairs(scoreboardData) do
		for y, z in pairs(v) do
			print(scoreboardData[1]['id'], scoreboardData[1]['money'])
			break
		end
	end
end)

function UpdatePlayerInDB(client, data)
local steamid = GetPlayerIdentifier(client,0)
MySQL.Async.execute('UPDATE users SET points = @points WHERE playerid = @playerid',
{ ['points'] = data.score, ['playerid'] = steamid },
	function(affectedRows)	
	end)
end

function CreatePlayerInDB(client)
	local steamId = GetPlayerIdentifier(client,0)
		MySQL.Async.execute('INSERT INTO users (playerid, name, points) VALUES (@playerid, @name, @points)',
		{ ['playerid'] = steamId, ['name'] = GetPlayerName(client), ['points'] = 0 },
			function(affectedRows)
			end)
		end
end)
