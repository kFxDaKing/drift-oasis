--RegisterServerEvent('IndicatorL')
--RegisterServerEvent('IndicatorR')
RegisterServerEvent('serverlog')
--local playerIndicators = {}{}
--KEEP ABOVE COMMENT COMMENTED

--SERVER EVENTHANDLERS START HERE-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("refreshranks", function(source, rawCommand)
  ExecuteCommand("restart discord_aceperms")
  ExecuteCommand("restart discord_chatroles")
  ExecuteCommand("restart discord_perms")
end)

AddEventHandler('chatMessage', function(source, n, msg)

    msg = string.lower( msg )
    
    -- CHECK TO SEE IF A CLIENT TYPED IN /DV
    if (msg == "/dv" or msg == "/delete" or msg == "/remove" or msg == "/rv" or msg == "/trash" or msg == "/delveh") then
    
        -- CANCEL THE CHAT MESSAGE EVENT (STOP THE SERVER FROM POSTING THE MESSAGE)
        CancelEvent()

        -- TRIGGER THE CLIENT EVENT
        TriggerClientEvent('deleteVehicle', source)
    end
end)

--[[AddEventHandler('IndicatorL', function(IndicatorL)
	local netID = source
	TriggerClientEvent('updateIndicators', -1, netID, 'left', IndicatorL)
	--playerIndicators[netID][left] = IndicatorL
	--print(netID .. "Indicator left")
end)

AddEventHandler('IndicatorR', function(IndicatorR)
	local netID = source
	TriggerClientEvent('updateIndicators', -1, netID, 'right', IndicatorR)
	--playerIndicators[netID][right] = IndicatorR
	--print(netID .. "Indicator right")
end)]]--

AddEventHandler('serverlog', function(text)
	local gt = os.date('*t')
	local f,err = io.open("serverlog.log","a")
	if not f then return print(err) end
	local y = gt['year'] if y < 10 then y = "0"..y end
	local mo = gt['month'] if mo < 10 then mo = "0"..mo end
	local d = gt['day'] if d < 10 then d = "0"..d end
	local h = gt['hour'] if h < 10 then h = "0"..h end
	local m = gt['min'] if m < 10 then m = "0"..m end
	local s = gt['sec'] if s < 10 then s = "0"..s end
	local formattedlog = string.format("[Date: %s/%s/%s, Time: %s:%s:%s] %s\n",y,mo,d,h,m,s,text)
	f:write(formattedlog)
	f:close()
	-- UNCOMMENT LINE BELOW, IF YOU NEED (TO SHOW ALL LOGS IN CONSOLE ALSO)
	--print(formattedlog)
end)
AddEventHandler('onGameTypeStart', function(driftgametype)
	TriggerEvent("serverlog", ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>SERVER STARTED<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<")
end)
AddEventHandler('playerDropped', function(reason)
	local pname = GetPlayerName(source)
	local pid = GetPlayerIdentifiers(source)
	for _, showpid in ipairs(pid) do
		TriggerEvent("serverlog", pname.."("..showpid..") left the server with reason ("..reason..")")
	end
end)
AddEventHandler('playerConnecting', function()
	local pname = GetPlayerName(source)
	local pid = GetPlayerIdentifiers(source)
	for _, showpid in ipairs(pid) do
		TriggerEvent("serverlog", pname.."("..showpid..") joined the server")
	end
end)

AddEventHandler('chatMessage', function(source, name, msg)
	if msg == '/cars' or msg == '/car' or msg == '/carlist' or msg == '/vehlist' or msg == '/vehicles' or msg == '/CARS' or msg == '/CAR' or msg == '/CARLIST' or msg == '/VEHLIST' or msg == '/VEHICLES' then
		TriggerClientEvent('chatMessage', source, "Grip cars", {187, 235, 42}, "")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1caravan - Dodge Caravan SXT")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "xbow - 2007 KTM XBow")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1evo6 - Mitsubishi EvoVI TME")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "evo9 - Lancer Evolution IX")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1hctr - Honda Civic Type-R")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "mlex - Mitsubishi Lancer Evolution X FQ-400")
		TriggerClientEvent('chatMessage', source, "Drift cars", {187, 235, 42}, "")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1dukes - Imponte Dukes")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "sultan - Karin Sultan")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1sultanrs - Karin Sultan RS")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "hotknife - Vapid Hotknife")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1blista - Dinka Blista")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "blista2 - Dinka Blista Compact")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1banshee - Bravado Banshee")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "banshee2 - Bravado Banshee 900R")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1buffalo - Bravado Buffalo")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "buffalo2 - Bravado Buffalo S")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1buffalo3 - Bravado Sprunk Buffalo")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "gauntlet - Bravado Gauntlet")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1gauntlet2 - N.O.O.S.E")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "stalion - Declasse Stallion")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1stalion2 - Declasse Burger Shot Stallion")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "coquette - Invetero Coquette")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1coquette2 - Invetero Coquette Classic")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "coquette3 - Invetero Coquette BlackFin")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1furoregt - Lampadati Furore GT")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "comet2 - Pfister Comet")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1comet3 - Pfister Comet Retro Custom")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "warrener - Vulcan Warrener")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1glendale - Benefactor Glendale")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "panto - Benefactor Panto")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1pigalle - Lampadati Pigalle")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "elegy - Annis Elegy Retro Custom")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1faction - Willard Faction")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "faction3 - Willard Faction Custom Donk")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1minivan2 - Vapid Minivan Custom")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "slamvan - Vapid Slamvan")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1slamvan2 - Vapid Lost Slamvan")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "slamvan3 - Vapid Slamvan Custom")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1sabregt2 - Declasse Sabre Turbo Custom")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "virgo - Albany Virgo")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1virgo2 - Dundreary Virgo Classic Custom")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "virgo3 - Dundreary Virgo Classic")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1buccaneer2 - Albany Buccaneer Custom")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "chino - Vapid Chino")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1chino2 - Vapid Chino Custom")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "primo - Albany Primo")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1primo2 - Albany Primo Custom")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "voodoo - Declasse Voodoo Custom")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1seven70 - Dewbauchee Seven-70")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "bestiagts - Grotti Bestia GTS")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1reaper - Pegassi Reaper")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "verlierer2 - Bravado Verlierer")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1nightshade - Imponte Nightshade")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "schafter3 - Benefactor Schafter V12")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1schafter4 - Benefactor Schafter LWB")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "mamba - Declasse Mamba")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1windsor - Enus Windsor")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "ratloader2 - Bravado Rat-Truck")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1jester2 - Dinka Jester (DriftCar)")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "massacro2 - Dewbauchee Massacro (Driftcar)")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1trophytruck - Vapid Trophy Truck")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "trophytruck2 - Vapid Desert Raid")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1omnis - Obey Omnis")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "tropos - Lampadati Tropos Rallye")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1brioso - Grotti Brioso R/A")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "lynx - Ocelot Lynx")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1sheava - Emperor ETR1")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "specter - Dewbauchee Specter")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1specter2 - Dewbauchee Specter Custom")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "ae86 - Trueno AE86")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1180sx - Nissan 180sx")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "180sxrb - Nissan 180sx Rocket Bunny")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1tampa3 - Drift Tampa")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "tampa4 - Drift Tampa")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1fordh - Ford Hoonicorn")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "blze30 - BMW e30 325i")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1amm3 - 2010 Mazda3")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "e34 - 1995 BMW M5 E34")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1m3e36 - BMW M3 E36")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "supra2 - Toyota Supra Stock")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1gt86 - Toyota GT86")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "gt86rb - Toyota GT86 Rocket Bunny")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1gtr32rb - Nissan GTR R32 Rocket Bunny")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "gtr32rbcam - Nissan GTR R32 Rocket Bunny Cambered")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1r33 - Nissan Skyline GTR R33")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "bmdrift - BMW Drift(Placeholder)")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1bmwrace - BMW Race(Placeholder)")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "quattros - Audi Quattro")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1s14kouki - Nissan S14 Kouki")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "s15tex - Nissan S15 Vortex")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1s15 - Nissan S15")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "rx7rb - Mazda RX7 Rocket Bunny")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1rx7asuka - Mazda RX7")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "fc3s - Mazda RX7 FC3S")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1sil80 - Sileighty")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "r30rsx - Nissan R30 RS X")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1f82 - BMW M4 F82")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "f82hs - BMW M4 F82")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1f82lw - BMW M4 F82")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "f82duke - BMW M4 F82")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1f824slw - BMW M4 F82")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "fordgt - Ford Mustang GT")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1jzx100 - Toyota Chaser")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "warrener3 - Warrener Pickup")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1eclipse - Mitsubishi Eclipse")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "vivio - Subaru Vivio")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1rcf - Lexus RC F")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "gs350 - Lexus GS350")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1brzrbv3 - Subaru BRZ Rocket Bunny")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "350zrb - Nissan 350Z Rocket Bunny")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1ps30 - 1969 Pandem Nissan S30")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "na6 - Mazda MX-5 Miata NA6")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1cresta - Toyota Cresta")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "ruinerfd - Ruiner FD Spec")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1s2k - Honda S2000")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "180typex - Nissan 180sx Type-X")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1e36dm - BMW E36 Drift Missile")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "e36dmcam - BMW E36 Drift Missile Cambered")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1rx7 - Mazda RX7")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "rx72 - Mazda RX7")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1ns13 - Nissan S13")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "tico - Daewoo Tico")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1lexy - Lexus SC300 Lexy")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "sc300 - Lexus SC300")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1PageUp/PageDown on keyboard while chat is open to scroll")
		CancelEvent()
	end
end)

AddEventHandler('chatMessage', function(source, name, msg)
	if msg == '/help' or msg == '/h' or msg == '/commands' or msg == '/cmd' or msg == '/cmds' or msg == '/HELP' or msg == '/H' or msg == '/COMMANDS' or msg == '/CMD' or msg == '/CMDS' then
		TriggerClientEvent('chatMessage', source, "Helpful information", {187, 235, 42}, "")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^0You can use vMenu by clicking '^1F1^0'.")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^0You can use the main menu by clicking '^1M^0'.")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^0vStancer by clicking '^1F6^0'.")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^0Handling Editor by clicking '^1F7^0'.")
		TriggerClientEvent('chatMessage', source, "Useful commands", {187, 235, 42}, "")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1/dv ^7Usage: Stand near a vehicle or enter a vehicle then type /dv")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1/cars ^7Usage: Shows a list of vehicles you can use to drift.")
		CancelEvent()
	end
end)

AddEventHandler('chatMessage', function(source, name, msg)
	if msg == '/blacklist' then
		TriggerClientEvent('chatMessage', source, "Blacklisted vehicles", {255, 0, 0}, "")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "rhino")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1cargoplane")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "shamal")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1luxor")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "buzzard")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1blimp")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "mammatus")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1velum")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "jet")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1titan")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "docktrailer")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1lazer")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "annihilator")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1duster")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "cuban800")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1stunt")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "skylift")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1dump")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "tractor2")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1tractor3")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "predator")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1squalo")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "benson")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1freight")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "freightcar")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1freightcont1")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "freightcont2")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1freightgrain")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "tanker")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1cabelcar")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "tankercar")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1tr3")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "stockade3")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1bulldozer")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "cutter")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1suntrap")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "metrotrain")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1handler")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "trflat")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1boattrailer")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "tropic")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1marquis")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "jetmax")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1dinghy")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "dinghy2")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1forklift")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "trailers2")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1trailers3")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "armytanker")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1seashark")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "seashark2")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1armytrailer")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "armytrailer2")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1tvtrailer")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "baletrailer")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1freighttrailer")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "graintrailer")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1cargobob")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "cargobob2")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1cargobob3")
		TriggerClientEvent('chatMessage', source, "", {0, 0, 0}, "^1PageUp/PageDown on keyboard while chat is open to scroll")
		CancelEvent()
	end
end)

AddEventHandler('chatMessage', function(source, name, msg)
	if msg == '/fix' or msg == '/fv' or msg == '/repair' or msg == '/r' or msg == '/FIX' or msg == '/FV' or msg == '/REPAIR' or msg == '/R' then
		TriggerClientEvent('fixVehicle', source)
		CancelEvent()
	end
end)

AddEventHandler('chatMessage', function(source, name, msg)
	if msg == '/clean' or msg == '/wash' or msg == '/c' or msg == '/CLEAN' or msg == '/WASH' or msg == '/C' then
		TriggerClientEvent('cleanVehicle', source)
		CancelEvent()
	end
end)

AddEventHandler('chatMessage', function(source, name, msg)
	if msg == '/dv' then
		TriggerClientEvent('dvExtra', source)
		CancelEvent()
	end
end)

--[[AddEventHandler('chatMessage', function(source, name, msg)
	if msg == '~80085' then
		TriggerClientEvent('serverVehWipe', source)
		CancelEvent()
	end
end)]]--

--SERVER FUNCTIONS START HERE---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function stringsplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end

function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end