ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

local injail, checked = false, false 

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
	ESX.PlayerLoaded = true
end)

RegisterNetEvent('esx:onPlayerLogout')
AddEventHandler('esx:onPlayerLogout', function()
	ESX.PlayerLoaded = false
	ESX.PlayerData = {}
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

CreateThread(function() --Thread to countdown
    while true do
    Wait(0)
        if injail == true then 
            Wait(60 * 1000)
            TriggerServerEvent('timeremoval')
        end
    end
end)

CreateThread(function() --Thread for tp back
    while true do
        Wait(0)
        while injail do 
            Wait(0)
            if #(GetEntityCoords(PlayerPedId()) - Config.Location) > 100 then 
                ESX.Game.Teleport(PlayerPedId(), Config.Location)
            end     
        end
    end
end)

CreateThread(function() -- Check if player injail or not
    while true do
        Wait(0)
        if checked == false then 
            TriggerServerEvent('test')
            checked = true 
        end
    end
end)

RegisterNetEvent('tpprison')  -- TP's to prison when command executed
AddEventHandler('tpprison',function(id,time) --tp to the jail and starts timer 
    a = tonumber(id)
    b = tonumber(time)
    if GetPlayerServerId(PlayerId()) == a then 
        ESX.Game.Teleport(PlayerPedId(), Config.Location)
        injail = true 

		RemoveAllPedWeapons(PlayerPedId(), true)
        SetPedArmour(PlayerPedId(), 0)
    end 
end)

RegisterNetEvent('outofjail')
AddEventHandler('outofjail',function()
    Wait(2000)
    ESX.Game.Teleport(PlayerPedId(), Config.ReleaseLocation)
end)

RegisterNetEvent('injail') -- From server if he is injail or not
AddEventHandler('injail',function(bool)
    injail = bool
end)

function DrawHudText(text,colour,coordsx,coordsy,scalex,scaley) --courtesy of driftcounter
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
    DrawText(coordsx,coordsy)
end


RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    TriggerServerEvent('test')
end)
