ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local injail, checked = false, false 

CreateThread(function() --Thread to countdown
    while true do
    Wait(0)
        if injail == true then 
            Wait(60000)
            TriggerServerEvent('timeremoval')
        end
    end
end)

CreateThread(function() --Thread for tp back
    while true do
        Wait(0)
        while injail do 
            Wait(0)
            if GetDistanceBetweenCoords(vector3(1723.37,2525.76,45.56),GetEntityCoords(PlayerPedId())) > 100 then 
                SetEntityCoords(PlayerPedId(),1723.37,2525.76,45.56,true,false,false,false)
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
        SetEntityCoords(GetPlayerPed(-1),1723.37,2525.76,45.56,true,false,false,false)
        injail = true 
    end 
end)

RegisterNetEvent('outofjail')
AddEventHandler('outofjail',function()
    Wait(2000)
    SetEntityCoords(GetPlayerPed(-1),1857.53,2601.89,45.67,true,false,false,false)
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
