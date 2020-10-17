local score = 0
local screenScore = 0
local tick
local idleTime
local driftTime
local tablemultiplier = {350,1400,4200,11200}
local mult = 0.2
local previous = 0
local total = 0
local curAlpha = 0
local ddata = 0
local SaveAtEndOfDrift = nil
local SaveTime = nil

-- Rank pricing -- 
local decentPrice = 50000
local proPrice = 500000
local driftinstructorPrice = 5000000
local legendaryPrice = 50000000
local driftkingPrice = 500000000
local noclip = false
local noclip_speed = 1.0
local noclip_start = 0

function getPosition()
  local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1),true))
  return x,y,z
end



function getCamDirection()
  local heading = GetGameplayCamRelativeHeading()+GetEntityHeading(GetPlayerPed(-1))
  local pitch = GetGameplayCamRelativePitch()

  local x = -math.sin(heading*math.pi/180.0)
  local y = math.cos(heading*math.pi/180.0)
  local z = math.sin(pitch*math.pi/180.0)

  -- normalize
  local len = math.sqrt(x*x+y*y+z*z)
  if len ~= 0 then
    x = x/len
    y = y/len
    z = z/len
  end

  return x,y,z
end

-- GetGameDirection(in lokale heading BLYAT)
  
function TimeDiff(time)
	CurrentTime = GetGameTimer()
	timediff = (CurrentTime - time)
	return timediff
end 

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if(noclip)then
		local ped = GetPlayerPed(-1)
        local x,y,z = getPosition()
        local dx,dy,dz = getCamDirection()
				local speed = noclip_speed
				local CurrentTimeDiff = TimeDiff(noclip_start)
				if CurrentTimeDiff >= 10000 then
					TriggerEvent("es_admin:noclip", -1)

				else
					local timeleft = 10000-tonumber(CurrentTimeDiff)
					local secleft = tonumber(timeleft) / 1000
					DrawHudText("You have "..round(secleft).." seconds of no-clip left.", {255,191,0,200},0.4,0.0,0.4,0.4)
				end
		SetEntityVisible(GetPlayerPed(-1), false, false)
		SetEntityInvincible(GetPlayerPed(-1), true)

      -- reset velocity
      SetEntityVelocity(ped, 0.0001, 0.0001, 0.0001)
      if IsControlPressed(0, 21) then
      	speed = speed + 3
      	end
      if IsControlPressed(0, 19) then
      	speed = speed - 0.5
      end
      -- forward
             if IsControlPressed(0,32) then -- MOVE UP
        	  x = x+speed*dx
        	  y = y+speed*dy
        	  z = z+speed*dz
      	     end

      -- backward
      	     if IsControlPressed(0,269) then -- MOVE DOWN
        	  x = x-speed*dx
        	  y = y-speed*dy
        	  z = z-speed*dz
      	     end
        SetEntityCoordsNoOffset(ped,x,y,z,true,true,true)
      	  else
      	  SetEntityVisible(GetPlayerPed(-1), true, false)
      	  SetEntityInvincible(GetPlayerPed(-1), false)

	     end
	end
end)

RegisterNetEvent("es_admin:noclip")
AddEventHandler("es_admin:noclip", function(t)
	noclip_start = GetGameTimer()
	local msg = "disabled"
	if(noclip == false)then
	end

	noclip = not noclip

	if(noclip)then
		msg = "enabled"
	end
end)

RegisterCommand("venoclip", function(source, args, rawCommand)
	TriggerEvent("es_admin:noclip", source)
end)
Citizen.CreateThread( function()

	-- Save/Load functions -- 
	TriggerServerEvent("RequestConfig")
	
	function SaveScore()
		_,PlayerScore = StatGetInt("MP0_DRIFT_SCORE", -1)
		TriggerServerEvent("SaveScore", PlayerScore)
		SetTimeout(SaveTime, SaveScore)		
	end	
		
	RegisterNetEvent("RecieveConfig")
	AddEventHandler("RecieveConfig", function(SaveAtEndOfDriftS, SaveTimeS)
		SaveAtEndOfDrift = SaveAtEndOfDriftS
		SaveTime = SaveTimeS
		if not SaveAtEndOfDrift then
			SetTimeout(SaveTime, SaveScore)
		end
	end)
	
	RegisterNetEvent("LoadScore")
	AddEventHandler("LoadScore", function(PlayerSavedScore)
		StatSetInt("MP0_DRIFT_SCORE", PlayerSavedScore, true)
		data = {score = PlayerSavedScore}
		data2 = {score = PlayerSavedScore, id = GetPlayerServerId(PlayerId())}
		TriggerServerEvent("SaveScore", GetPlayerServerId(PlayerId()), data)
		TriggerEvent("LoadDriftData", GetPlayerServerId(PlayerId()), json.encode(data2))
	end)	

	RegisterCommand("buyrank", function(source, args, rawCommand)

		if args[1] == "decent" then
			local	_,driftpoints = StatGetInt("MP0_DRIFT_SCORE",-1)
			if tonumber(driftpoints) > decentPrice then
				local newDriftPoints = tonumber(driftpoints)-decentPrice
				TriggerServerEvent("SaveRank", GetPlayerServerId(PlayerId()), args[1])
				StatSetInt("MP0_DRIFT_SCORE", newDriftPoints, true)
				data = {score = newDriftPoints}
				TriggerServerEvent("SaveScore", GetPlayerServerId(PlayerId()), data)
				DrawLabel("You have bought the "..args[1].." rank.")
			else
				local misbalance = decentPrice-driftpoints
					DrawLabel("You need $"..format_int(misbalance).." more to buy this.")
			end
		end

			if args[1] == "pro" then
				local	_,driftpoints = StatGetInt("MP0_DRIFT_SCORE",-1)
				if tonumber(driftpoints) > proPrice then
					local newDriftPoints = tonumber(driftpoints)-proPrice
					TriggerServerEvent("SaveRank", GetPlayerServerId(PlayerId()), args[1])
					StatSetInt("MP0_DRIFT_SCORE", newDriftPoints, true)
					data = {score = newDriftPoints}
					TriggerServerEvent("SaveScore", GetPlayerServerId(PlayerId()), data)
					DrawLabel("You have bought the "..args[1].." rank.")
				else
					local misbalance = proPrice-driftpoints
					DrawLabel("You need $"..format_int(misbalance).." more to buy this. ")
				end
			end

				if args[1] == "instructor" then
					local	_,driftpoints = StatGetInt("MP0_DRIFT_SCORE",-1)
					if tonumber(driftpoints) > driftinstructorPrice then
						local newDriftPoints = tonumber(driftpoints)-driftinstructorPrice
						TriggerServerEvent("SaveRank", GetPlayerServerId(PlayerId()), args[1])
						StatSetInt("MP0_DRIFT_SCORE", newDriftPoints, true)
						data = {score = newDriftPoints}
						TriggerServerEvent("SaveScore", GetPlayerServerId(PlayerId()), data)
						DrawLabel("You have bought the "..args[1].." rank.")
					else
						local misbalance = driftinstructorPrice-driftpoints
						DrawLabel("You need $"..format_int(misbalance).." more to buy this.")
					end
			end
					
				if args[1] == "legendary" then
					local	_,driftpoints = StatGetInt("MP0_DRIFT_SCORE",-1)
					if tonumber(driftpoints) > legendaryPrice then
						local newDriftPoints = tonumber(driftpoints)-legendaryPrice
						TriggerServerEvent("SaveRank", GetPlayerServerId(PlayerId()), args[1])
						StatSetInt("MP0_DRIFT_SCORE", newDriftPoints, true)
						data = {score = newDriftPoints}
						TriggerServerEvent("SaveScore", GetPlayerServerId(PlayerId()), data)
						DrawLabel("You have bought the "..args[1].." rank.")
					else
						local misbalance = legendaryPrice-driftpoints
						DrawLabel("You need $"..format_int(misbalance).." more to buy this.")
					end
			end

				if args[1] == "king" then
					local	_,driftpoints = StatGetInt("MP0_DRIFT_SCORE",-1)
					if tonumber(driftpoints) > driftkingPrice then
						local newDriftPoints = tonumber(driftpoints)-driftkingPrice
						TriggerServerEvent("SaveRank", GetPlayerServerId(PlayerId()), args[1])
						StatSetInt("MP0_DRIFT_SCORE", newDriftPoints, true)
						data = {score = newDriftPoints}
						TriggerServerEvent("SaveScore", GetPlayerServerId(PlayerId()), data)
						DrawLabel("You have bought the "..args[1].." rank.")
					else
						local misbalance = driftkingPrice-driftpoints
						DrawLabel("You need $"..format_int(misbalance).." more to buy this.")
					end
			end

end, false)

	local FirstTime = true
	AddEventHandler("playerSpawned", function()
		if FirstTime then
			TriggerServerEvent("LoadScoreData", source)
			FirstTime = false
		end
	end)
	
	-- PREP FUNCTIONS --
	function DrawLabel(text)
	BeginTextCommandDisplayHelp("STRING")
	AddTextComponentSubstringPlayerName(text)
	EndTextCommandDisplayHelp(0, 0, 1, 2100)
	end
	function DrawChatLabel(text)
		BeginTextCommandDisplayHelp("STRING")
		AddTextComponentSubstringPlayerName(text)
		EndTextCommandDisplayHelp(0, 0, 0, 50)
		EndTextCommandDisplayText(10, 0)
		end
	function format_int(number)
  local i, j, minus, int, fraction = tostring(number):find('([-]?)(%d+)([.]?%d*)')
  int = int:reverse():gsub("(%d%d%d)", "%1,")
  return minus .. int:reverse():gsub("^,", "") .. fraction
end

	function round(number)
		number = tonumber(number)
		number = math.floor(number)
		
		if number < 0.01 then
			number = 0
		elseif number > 999999999 then
			number = 999999999
		end
		return number
	end
	
	function calculateBonus(previous)
		local points = previous
		local points = round(points)
		return points or 0
	end
	function math.precentage(a,b)
		return (a*3)/b
	end
	
	function angle(veh)
		if not veh then return false end
		local vx,vy,vz = table.unpack(GetEntityVelocity(veh))
		local modV = math.sqrt(vx*vx + vy*vy)
		
		
		local rx,ry,rz = table.unpack(GetEntityRotation(veh,0))
		local sn,cs = -math.sin(math.rad(rz)), math.cos(math.rad(rz))
		
		if GetEntitySpeed(veh)* 3.6 < 30 or GetVehicleCurrentGear(veh) == 0 then return 0,modV end --speed over 30 km/h
		
		local cosX = (sn*vx + cs*vy)/modV
		if cosX > 0.966 or cosX < 0 then return 0,modV end
		return math.deg(math.acos(cosX))*0.5, modV
	end

	function DrawHudText(text,colour,coordsx,coordsy,scalex,scaley)
		SetTextFont(7)
		SetTextProportional(7)
		SetTextScale(scalex, scaley)
		local colourr,colourg,colourb,coloura = table.unpack(colour)
		SetTextColour(colourr,colourg,colourb, coloura)
		SetTextDropshadow(0, 0, 0, 0, coloura)
		SetTextEdge(1, 0, 0, 0, coloura)
		SetTextDropShadow()
		SetTextOutline()
		SetTextEntry("STRING")
		AddTextComponentString(text)
		EndTextCommandDisplayText(coordsx,coordsy)
	end
	
	-- END PREP FUNCTIONS --
	
	RegisterNetEvent("SetPlayerNativeMoney")
	AddEventHandler("SetPlayerNativeMoney", function(money)
		local _,pm = StatGetInt( "MP0_WALLET_BALANCE", -1)
		StatSetInt("MP0_WALLET_BALANCE", pm+money, true)
	end)
	hitpause = false
	
	while true and hitpause == false do
		Citizen.Wait(1)
		PlayerPed = PlayerPedId()
		tick = GetGameTimer()
	
		if not IsPedDeadOrDying(PlayerPed, 1) and GetVehiclePedIsUsing(PlayerPed) and GetPedInVehicleSeat(GetVehiclePedIsUsing(PlayerPed), -1) == PlayerPed and IsVehicleOnAllWheels(GetVehiclePedIsUsing(PlayerPed)) and not IsPedInFlyingVehicle(PlayerPed) then
			PlayerVeh = GetVehiclePedIsIn(PlayerPed,false)
			CurrentVehicleHealth = GetVehicleBodyHealth(PlayerVeh)
			local angle,velocity = angle(PlayerVeh)
			local tempBool = tick - (idleTime or 0) < 1850	
			if not tempBool and score ~= 0 and not (CurrentVehicleHealth < OldVehicleHealth) then
				previous = score
				previous = calculateBonus(previous)
				
				total = total+previous
				cash = previous/400
				cash = round(cash)
				TriggerServerEvent("driftcounter:payDrift", cash )
				TriggerEvent("driftcounter:DriftFinished", previous)
				_,oldScore = StatGetInt("MP0_DRIFT_SCORE",-1)
				StatSetInt("MP0_DRIFT_SCORE", oldScore+previous, true)
				_,newScore = StatGetInt("MP0_DRIFT_SCORE",-1)
				local data = {score = newScore}
				TriggerServerEvent("SaveScore", GetPlayerServerId(PlayerId()), data)
				score = 0
				drifting = false
			end
			
			if CurrentVehicleHealth < OldVehicleHealth and drifting == true and score > 0 then
				DrawLabel("~r~You lost ~h~$"..format_int(round(score)).."~h~.")
				Citizen.Wait(5)
				hitpause = true
				score = 0
			end
			
			
			if angle ~= 0 then
				if score == 0 then
					drifting = true
					driftTime = tick
				end
				if tempBool then
					score = score + math.floor(angle+velocity)*mult
				else
					score = math.floor(angle+velocity)*mult
				end
				screenScore = calculateBonus(score)
				idleTime = tick	
				OldVehicleHealth = CurrentVehicleHealth
			end
		else
			CurrentVehicleHealth = 0
			OldVehicleHealth = 0
			drifting = false
		end
		
		
		if tick - (idleTime or 0) < 3000 then
			if curAlpha < 255 and curAlpha+10 < 255 then
				curAlpha = curAlpha+10
			elseif curAlpha > 255 then
				curAlpha = 255
			elseif curAlpha == 255 then
				curAlpha = 255
			elseif curAlpha == 250 then
				curAlpha = 255
			end
		else
			if curAlpha > 0 and curAlpha-10 > 0 then
				curAlpha = curAlpha-10			
			elseif curAlpha < 0 then
				curAlpha = 0
			elseif curAlpha == 5 then
				curAlpha = 0
			end
		end
		if not screenScore then screenScore = 0 end
		if hitpause == false then
		_,newScore = StatGetInt("MP0_DRIFT_SCORE",-1)
		DrawHudText(string.format("\n+%s",tostring(screenScore)), {255,191,0,curAlpha},0.5,0.0,0.7,0.7)
		DrawHudText(string.format("$"..format_int(newScore)), {112, 160, 80,curAlpha}, 0.9,0.0,0.4,0.4)
		end
		hitpause = false
	end
end)
