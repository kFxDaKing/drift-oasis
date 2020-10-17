--RegisterNetEvent('serverVehWipe')
RegisterNetEvent('dvExtra')
--RegisterNetEvent('updateIndicators')
RegisterNetEvent('VehicleSpawn')
RegisterNetEvent('deleteVehicle')
RegisterNetEvent('fixVehicle')
RegisterNetEvent('cleanVehicle')
local localPlayerId = PlayerId()
local serverId = GetPlayerServerId(localPlayerId)
local serverPlayerId = GetPlayerFromServerId(playerServerId)
--local IndicatorL = false
--local IndicatorR = false
disableallweapons = false --IF TRUE ALL WEAPONS WILL BE DISABLED INCLUDING FISTS
defaultpedmodel = "A_M_O_TRAMP_01"
local distanceToCheck = 15.0 --THE DISTANCE TO CHECK IN FRONT OF THE PLAYER FOR A VEHICLE
servername = "Drift Oasis"
discordlink = "https://discord.gg/924Kze6"
offset = {x = 0.0145, y = 0.981}
discordoffset = {x = 0.0852, y = 0.981}
rgb = {r = 255, g = 255, b = 255}
alpha = 175
scale = 0.3
font = 4
bringontherainbows = true

--BLACKLISTED VEHICLE MODELS
carblacklist = {
	"BLIMP2", "SAVAGE", "SUPERVOLITO", "SWIFT",
	"SWIFT2", "VALKYRIE", "VALKYRIE2", "VOLATUS",
	"JET", "NIMBUS", "LAZER", "STUNT",
	"MAMMATUS", "LUXOR2", "LUXOR", "HYDRA",
	"DUSTER", "CUBAN800", "CARGOPLANE", "BESRA",
	"MILJET", "SHAMAL", "TITAN", "VELUM",
	"VESTRA", "TUG", "TORO", "SPEEDER",
	"TROPIC", "SUNTRAP", "SQUALO", "SEASHARK",
	"PREDATOR", "MARQUIS", "JETMAX", "DINGHY3",
	"DINGHY4", "SUBMERSIBLE", "SUBMERSIBLE2", "GUARDIAN",
	"BULLDOZE", "DUMP", "FLATBED", "CUTTER",
	"HANDLER", "RUBBLE", "MIXER2", "TIPTRUCK2",
	"TIPTRUCK", "BARRACKS", "BARRACKS2", "CRUSADER",
	"RHINO", "PBUS", "AMBULANCE", "FIRETRUK",
	"POUNDER", "PHANTOM", "PHANTOM2", "PACKER",
	"MULE3", "MULE", "HAULER", "BIFF",
	"BENSON", "BRICKADE", "AIRBUS", "BUS",
	"COACH", "TRASH2", "TRASH", "TOURBUS",
	"WASTELANDER", "TRACTOR2", "FORKLIFT", "AIRTUG",
	"DOCKTUG", "SADLER", "RIPLEY", "SCRAP",
	"UTILTRUC", "UTILTRUC2", "UTILTRUC3", "TOWTRUCK2",
	"TOWTRUCK", "TRACTOR", "JOURNEY", "INSURGENT",
	"INSURGENT", "INSURGENT2", "FIXTER", "BMX",
	"CRUISER", "SCORCHER", "TRIBIKE", "TRIBIKE2",
	"TRIBIKE3", "BUZZARD", "BUZZARD2", "SUPERVOLITO2",
	"FROGGER", "FROGGER2", "MAVERICK", "POLMAV",
	"VELUM", "VELUM2", "RENTALBUS", "UTILLITRUCK",
	"UTILLITRUCK2", "UTILLITRUCK3", "TANKER2", "BOXVILLE",
	"BOXVILLE2", "BOXVILLE3", "BOXVILLE4", "BOXVILLE5",
	"GBURRITO2", "GBURRITO", "BOBCATXL", "CAMPER",
	"BISON", "BISON2", "BISON3", "BURRITO",
	"BURRITO2", "BURRITO3", "BURRITO4", "BURRITO5",
	"RUMPO", "RUMPO2", "RUMPO3", "PARADISE",
	"PONY", "PONY2", "SURFER", "SURFER2",
	"TACO", "SPEEDO", "SPEEDO2", "YOUGA",
	"YOUGA2", "RIOT", "RALLYTRUCK", "DODO",
	"STOCKADE", "MIXER", "MULE2", "PROPTRAILER",
	"APC", "CADDY", "CADDY2", "MOWER",
	"POLICEOLD2", "FBI", "CRUSADER", "FBI2",
	"LGUARD", "PRANGER", "POLICEOLD1", "POLICET",
	"SHERIFF2", "POLICE2", "POLICE", "POLICE3",
	"SHERIFF", "POLICE4", "POLICEB", "POLICEB/SOVEREIGN",
	"DUBSTA3", "LIMO2", "TECHNICAL", "TECHNICAL2",
	"TECHNICAL3", "MONSTER", "MARSHALL"
}
--BLACKLISTED PED MODELS
pedblacklist = {
	"A_C_BOAR", "A_C_CAT_01", "A_C_CHIMP", "A_C_CHOP",
	"A_C_CORMORANT", "A_C_COW", "A_C_COYOTE", "A_C_CROW",
	"A_C_DEER", "A_C_DOLPHIN", "A_C_FISH", "A_C_SHEPHERD",
	"A_C_SHARKHAMMER", "A_C_CHICKENHAWK", "A_C_HEN", "A_C_HUMPBACK",
	"A_C_HUSKY", "A_C_KILLERWHALE", "A_C_MTLION", "A_C_PIG",
	"A_C_PIGEON", "A_C_POODLE", "A_C_PUG", "A_C_RABBIT_01",
	"A_C_RAT", "A_C_RETRIEVER", "A_C_RHESUS", "A_C_ROTTWEILER",
	"A_C_SEAGULL", "A_C_STINGRAY", "A_C_SHARKTIGER", "A_C_WESTY"
}
--BLACKLISTED WEAPON MODELS(NOT WORKING PROPERLY)
weaponblacklist = {
	"WEAPON_KNIFE", "WEAPON_KNUCKLE", "WEAPON_NIGHTSTICK", "WEAPON_HAMMER",
	"WEAPON_BAT", "WEAPON_GOLFCLUB", "WEAPON_CROWBAR", "WEAPON_BOTTLE",
	"WEAPON_DAGGER", "WEAPON_HATCHET", "WEAPON_MACHETE", "WEAPON_FLASHLIGHT",
	"WEAPON_SWITCHBLADE", "WEAPON_PISTOL", "WEAPON_COMBATPISTOL", "WEAPON_APPISTOL",
	"WEAPON_PISTOL50", "WEAPON_SNSPISTOL", "WEAPON_HEAVYPISTOL", "WEAPON_VINTAGEPISTOL",
	"WEAPON_STUNGUN", "WEAPON_FLAREGUN", "WEAPON_MARKSMANPISTOL", "WEAPON_REVOLVER",
	"WEAPON_MICROSMG", "WEAPON_SMG", "WEAPON_ASSAULTSMG", "WEAPON_MG",
	"WEAPON_COMBATMG", "WEAPON_COMBATPDW", "WEAPON_GUSENBERG", "WEAPON_MACHINEPISTOL",
	"WEAPON_ASSAULTRIFLE", "WEAPON_CARBINERIFLE", "WEAPON_ADVANCEDRIFLE", "WEAPON_SPECIALCARBINE",
	"WEAPON_BULLPUPRIFLE", "WEAPON_COMPACTRIFLE", "WEAPON_PUMPSHOTGUN", "WEAPON_SAWNOFFSHOTGUN",
	"WEAPON_BULLPUPSHOTGUN", "WEAPON_ASSAULTSHOTGUN", "WEAPON_MUSKET", "WEAPON_HEAVYSHOTGUN",
	"WEAPON_DBSHOTGUN", "WEAPON_SNIPERRIFLE", "WEAPON_HEAVYSNIPER", "WEAPON_MARKSMANRIFLE",
	"WEAPON_GRENADELAUNCHER", "WEAPON_RPG", "WEAPON_STINGER", "WEAPON_MINIGUN",
	"WEAPON_FIREWORK", "WEAPON_RAILGUN", "WEAPON_HOMINGLAUNCHER", "WEAPON_GRENADE",
	"WEAPON_STICKYBOMB", "WEAPON_PROXMINE", "WEAPON_BZGAS", "WEAPON_SMOKEGRENADE",
	"WEAPON_MOLOTOV", "WEAPON_FIREEXTINGUISHER", "WEAPON_PETROLCAN", "WEAPON_SNOWBALL",
	"WEAPON_FLARE", "WEAPON_BALL"
}

--REMOVE PLAYERS LAST USED VEHICLE
--[[Citizen.CreateThread(function()
	while true do
	Citizen.Wait(0)
		if pedOnFoot then
			Citizen.Wait(300000) -- 150000 = roughly 2 minutes and a half before last vehicle used gets deleted. 300000 because of issues.
			TriggerEvent('prevVehUsed')
        end
	end
end)]]--

--NATIVES TO REMOVE GENERATED SPAWNS
Citizen.CreateThread(function()
	while true do
	Citizen.Wait(0)
		local playerPed = GetPlayerPed(-1)
		local pos = GetEntityCoords(playerPed)
		if playerPed then
			SetVehicleDensityMultiplierThisFrame(0.0)
			SetPedDensityMultiplierThisFrame(0.0)
			SetRandomVehicleDensityMultiplierThisFrame(0.0)
			SetParkedVehicleDensityMultiplierThisFrame(0.0)
			SetScenarioPedDensityMultiplierThisFrame(0.0, 0.0)
			RemoveVehiclesFromGeneratorsInArea(pos['x'] - 500.0, pos['y'] - 500.0, pos['z'] - 500.0, pos['x'] + 500.0, pos['y'] + 500.0, pos['z'] + 500.0);
			SetGarbageTrucks(0)
			SetRandomBoats(0)
		end
	end
end)

--BLACKLIST CODE
Citizen.CreateThread(function()
	while true do
	Citizen.Wait(0)
		local playerPed = GetPlayerPed(-1)
		local playerPos = GetEntityCoords( playerPed, 1 )
        local inFrontOfPlayer = GetOffsetFromEntityInWorldCoords( playerPed, 0.0, distanceToCheck, 0.0 )
		
		if playerPed then
			--VEHICLES
			checkCar(GetVehicleInDirection(playerPos, inFrontOfPlayer))
            checkCar(GetVehiclePedIsIn(playerPed, false))
		
			--PLAYER MODELS
			playerModel = GetEntityModel(playerPed)
			if not playerModel then
				SetPlayerModel(PlayerId(), GetHashKey(defaultpedmodel))
			end
			if not prevPlayerModel then
				if isPedBlacklisted(prevPlayerModel) then
					SetPlayerModel(PlayerId(), GetHashKey(defaultpedmodel))
				else
					prevPlayerModel = playerModel
				end
			else
				if isPedBlacklisted(playerModel) then
					SetPlayerModel(PlayerId(), prevPlayerModel)
					sendForbiddenMessage("This ped model is blacklisted!")
				end

				prevPlayerModel = playerModel
			end
			
			--WEAPONS
			nothing, weapon = GetCurrentPedWeapon(playerPed, true)
			if disableallweapons then
				RemoveAllPedWeapons(playerPed, true)
			else
				if isWeaponBlacklisted(weapon) then
					RemoveWeaponFromPed(playerPed, weapon)
					sendForbiddenMessage("This weapon is blacklisted!")
				end
			end
			
		end
	end
end)

--INDICATORS
--[[RegisterCommand('hazardindicator', function()
	if IsPedInAnyVehicle(GetPlayerPed(-1), true) then
		TriggerEvent('Indicator', 'right')
		TriggerEvent('Indicator', 'left')
	end
end, false)
RegisterKeyMapping('hazardindicator', 'Hazard Indicator', 'keyboard', 'down')

RegisterCommand('leftindicator', function()
	if IsPedInAnyVehicle(GetPlayerPed(-1), true) then
		TriggerEvent('Indicator', 'left')
	end
end, false)
RegisterKeyMapping('leftindicator', 'Left Indicator', 'keyboard', 'left')

RegisterCommand('rightindicator', function()
	if IsPedInAnyVehicle(GetPlayerPed(-1), true) then
		TriggerEvent('Indicator', 'right')
	end
end, false)
RegisterKeyMapping('rightindicator', 'Right Indicator', 'keyboard', 'right')]]--

--MISC
Citizen.CreateThread(function()
	while true do
	Citizen.Wait(0)
		--ALWAYS NEVER WANTED
		if GetPlayerWantedLevel(PlayerId()) ~= 0 then
            SetPlayerWantedLevel(PlayerId(), 0, false)
            SetPlayerWantedLevelNow(PlayerId(), false)
        end
		--ALWAYS GODMODE
		--[[if GetPlayerInvincible(PlayerId()) ~= 0 then
            SetPlayerInvincible(PlayerId(), true)
        end]]--
		--ALWAYS FULL STAMINA
		if pedOnFoot then
			ResetPlayerStamina(PlayerId())
		end
	end
end)

--WATERMARK
local function RGBRainbow( frequency )
	local result = {}
	local curtime = GetGameTimer() / 1000

	result.r = math.floor( math.sin( curtime * frequency + 0 ) * 127 + 128 )
	result.g = math.floor( math.sin( curtime * frequency + 2 ) * 127 + 128 )
	result.b = math.floor( math.sin( curtime * frequency + 4 ) * 127 + 128 )
	
	return result
end

Citizen.CreateThread( function()
	while true do
		Wait( 0 )
		PlayerVeh = GetVehiclePedIsIn(PlayerPed,false)
		PlayerPed = PlayerPedId()
		local currKmh = GetEntitySpeed(PlayerPed)*3.6
		if (currKmh > 99) then
			rainbow = RGBRainbow(1)
		
		else
			if currKmh < 99 or currKmh == 0 then
				rainbow = {r = 255, g = 255, b = 255}
			end

		end
		SetTextColour( rainbow.r, rainbow.g, rainbow.b, 255 )
		SetTextFont( 4 )
		SetTextScale( 0.3, 0.3 )
		SetTextOutline()
		SetTextEntry( "STRING" )
		AddTextComponentString( servername )
		DrawText( offset.x, offset.y )
	end
end )

Citizen.CreateThread( function()
	while true do
		Wait( 0 )
		PlayerVeh = GetVehiclePedIsIn(PlayerPed,false)
		PlayerPed = PlayerPedId()
		local currKmh = GetEntitySpeed(PlayerPed)*3.6
		if (currKmh > 99) then
			rainbow = RGBRainbow(1)
		
		else
			if currKmh < 99 or currKmh == 0 then
				rainbow = {r = 255, g = 255, b = 255}
			end

		end
		SetTextColour( rainbow.r, rainbow.g, rainbow.b, 255 )
		SetTextFont( 4 )
		SetTextScale( 0.3, 0.3 )
		SetTextOutline()
		SetTextEntry( "STRING" )
		AddTextComponentString( discordlink )
		DrawText( discordoffset.x, discordoffset.y )
	end
end )

--EVENTHANDLERS START HERE----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("playerSpawned", function(spawn)
	SetPedRandomComponentVariation(GetPlayerPed(-1), false)
	SetCanAttackFriendly(GetPlayerPed(-1), false, false)
	NetworkSetFriendlyFireOption(false)
	SetNotificationTextEntry("STRING")
	AddTextComponentString("~y~Type ~r~/help ~y~to get started~n~~n~Click ~r~M~y~ to use the your menu.")
	SetNotificationMessage("CHAR_SOCIAL_CLUB", "CHAR_SOCIAL_CLUB", true, 4, "Drift Oasis", "")
	DrawNotification(false, true);
	SetPlayerInvincible(PlayerId(), true)
end)

--[[AddEventHandler('Indicator', function(dir)
	Citizen.CreateThread(function()
		local Ped = GetPlayerPed(-1)
		if IsPedInAnyVehicle(Ped, true) then
			local Veh = GetVehiclePedIsIn(Ped, false)
			if GetPedInVehicleSeat(Veh, -1) == Ped then
				if dir == 'left' then
					IndicatorL = not IndicatorL
					TriggerServerEvent('IndicatorL', IndicatorL)
				elseif dir == 'right' then
					IndicatorR = not IndicatorR
					TriggerServerEvent('IndicatorR', IndicatorR)
				end
			end
		end
	end)
end)
AddEventHandler('updateIndicators', function(PID, dir, Toggle)
	--if isPlayerOnline(PID) then
		local Veh = GetVehiclePedIsIn(GetPlayerPed(GetPlayerFromServerId(PID)), false)
		if dir == 'left' then
			SetVehicleIndicatorLights(Veh, 1, Toggle)
		elseif dir == 'right' then
			SetVehicleIndicatorLights(Veh, 0, Toggle)
		end
	--end
end)]]--

--[[AddEventHandler('prevVehUsed', function()
	local playerLastVehUsed = GetPlayersLastVehicle()
	local playerLastVehUsedSeatIsFree = IsVehicleSeatFree(playerLastVehUsed, -1)
	if playerLastVehUsedSeatIsFree then
		SetEntityAsMissionEntity(playerLastVehUsed, true, true)
		DeleteVehicle(playerLastVehUsed)
	end
	CancelEvent()
end)]]--

AddEventHandler('fixVehicle', function()
    local ped = GetPlayerPed(-1)
	local cartofix = GetVehiclePedIsIn(ped, false)
	local checkpedveh = IsPedSittingInVehicle(ped, cartofix)
	if checkpedveh then
		SetVehicleOnGroundProperly(cartofix)
		SetVehicleFixed(cartofix)
		SetVehicleDeformationFixed(cartofix)
		SetVehiclePetrolTankHealth(cartofix, 999.0)
		SetVehicleBodyHealth(cartofix, 999.0)
		SetVehicleEngineHealth(cartofix, 999.0)
		ResetVehicleWheels(cartofix, true)
	end
end)

AddEventHandler('cleanVehicle', function()
	local ped = GetPlayerPed(-1)
	local cartoclean = GetVehiclePedIsIn(ped, false)
	local checkpedveh = IsPedSittingInVehicle(ped, cartoclean)
	if checkpedveh then
		SetVehicleDirtLevel(cartoclean, 0.0)
	end
end)

AddEventHandler( 'deleteVehicle', function()
    local ped = GetPlayerPed( -1 )

    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
        local pos = GetEntityCoords( ped )
        -- log( "Player is at:\nX: " .. pos.x .. " Y: " .. pos.y .. " Z: " .. pos.z )
        -- log( "Found vehicle?: " .. tostring( DoesEntityExist( vehicle ) ) )

        if ( IsPedSittingInAnyVehicle( ped ) ) then 
            local vehicle = GetVehiclePedIsIn( ped, false )

            if ( GetPedInVehicleSeat( vehicle, -1 ) == ped ) then 
                ShowNotification( "Vehicle deleted." )
                SetEntityAsMissionEntity( vehicle, true, true )
                deleteCar( vehicle )
            else 
                ShowNotification( "You must be in the driver's seat!" )
            end 
        else
            local playerPos = GetEntityCoords( ped, 1 )
            local inFrontOfPlayer = GetOffsetFromEntityInWorldCoords( ped, 0.0, distanceToCheck, 0.0 )
            local vehicle = GetVehicleInDirection( playerPos, inFrontOfPlayer )

            if ( DoesEntityExist( vehicle ) ) then 
                -- log( "Distance between ped and vehicle: " .. tostring( GetDistanceBetween( ped, vehicle ) ) )
                ShowNotification( "Vehicle deleted." )
                SetEntityAsMissionEntity( vehicle, true, true )
                deleteCar( vehicle )
            else 
                ShowNotification( "You must be in or near a vehicle to delete it." )
            end 
        end 
    end 
end)
AddEventHandler("dvExtra", function()
	local playerPed = GetPlayerPed(-1)
	local pedPos = GetEntityCoords(playerPed, true)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 5.0, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
end)

AddEventHandler('VehicleSpawn', function(vehicleName)
  local myPed = GetPlayerPed(-1)
  local vehicle = GetHashKey(vehicleName)
  RequestModel(vehicle)
  while not HasModelLoaded(vehicle) do
    Citizen.Wait(1)
  end
  local prevVeh = GetVehiclePedIsIn(GetPlayerPed(-1), true)
  local coords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0, 5.0, 0)
  local spawned_car = CreateVehicle(vehicle, coords, GetEntityHeading(myPed), true, false)
  if prevVeh then
	SetEntityAsMissionEntity(prevVeh, true, true)
	DeleteVehicle(prevVeh)
  end
  SetVehicleOnGroundProperly(spawned_car)
  SetVehicleNumberPlateText(spawned_car, "OASIS")
  SetPedIntoVehicle(myPed, spawned_car, -1)
end)

--FUNCTIONS START HERE---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function checkCar(car)
    if car then
        local carModel = GetEntityModel(car)
        local carName = GetDisplayNameFromVehicleModel(carModel)
		
        if isCarBlacklisted(carModel) then
            SetEntityAsMissionEntity(car, true, true)
			DeleteVehicle(car)
            --sendForbiddenMessage("This vehicle is blacklisted!")
        end
    end
end

function sendForbiddenMessage(message)
	TriggerEvent("chatMessage", "", {0, 0, 0}, "^1" .. message)
end

function isCarBlacklisted(model)
    for _, blacklistedCar in pairs(carblacklist) do
        if model == GetHashKey(blacklistedCar) then
           return true
        end
    end
    return false
end

function isPedBlacklisted(model)
	for _, blacklistedPed in pairs(pedblacklist) do
		if model == GetHashKey(blacklistedPed) then
			return true
		end
	end

	return false
end

function isWeaponBlacklisted(model)
	for _, blacklistedWeapon in pairs(weaponblacklist) do
		if model == GetHashKey(blacklistedWeapon) then
			return true
		end
	end
	return false
end

function deleteCar( entity )
    Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(entity))
	Citizen.InvokeNative(0xB736A491E64A32CF, Citizen.PointerValueIntInitialized(entity))
	Citizen.InvokeNative(0xAE3CBE5BF394C9C9, Citizen.PointerValueIntInitialized(entity))
end

function GetVehicleInDirection( coordFrom, coordTo )
    local rayHandle = CastRayPointToPoint( coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 10, GetPlayerPed( -1 ), 0 )
    local _, _, _, _, vehicle = GetRaycastResult( rayHandle )
    return vehicle
end

function ShowNotification( text )
    SetNotificationTextEntry( "STRING" )
    AddTextComponentString( text )
    DrawNotification( false, false )
end

function log( msg )
    Citizen.Trace( "\n[DEBUG]: " .. msg )
end

function AddTextEntry(key, value)
	Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), key, value)
end
Citizen.CreateThread(function()
  AddTextEntry('FE_THDR_GTAO', "Drift Oasis")
end)
--VEHICLE CLEAN UP/FLOOD PREVENTION-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--[[AddEventHandler("serverVehWipe", function()
	local playerPed = GetPlayerPed(-1)
	local pedPos = GetEntityCoords(playerPed, true)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	local ranVehToDel = GetRandomVehicleInSphere(pedPos.x, pedPos.y, pedPos.z, 9998.9, 0, 2)
		SetVehicleHasBeenOwnedByPlayer(ranVehToDel, false)
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	CancelEvent()
end)

Citizen.CreateThread(function()
	while true do
	Citizen.Wait(900000) -- 1800000 ROUGHLY 30 MINUTES, 900000 ROUGHLY 15 MINUTES
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
		ranVehToDel = GetRandomVehicleInSphere(2666, -361, 31, 9998.9, 0, 2)
		Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(ranVehToDel))
		SetEntityAsMissionEntity(ranVehToDel, true, true)
		DeleteVehicle(ranVehToDel)
	end
end)]]--