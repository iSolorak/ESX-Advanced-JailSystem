ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


local player = {}
local jailtime = {}






RegisterServerEvent('timeremoval') -- Remove 1 minute every 1 minute 
AddEventHandler('timeremoval',function()
  local _source = source
  local jailremain
  local id = id()
  MySQL.query('SELECT jailtime FROM users WHERE identifier = @id  ', {['@id']=id},function(result) 
  if result[1].jailtime > 0 then
    jailremain = result[1].jailtime-1
    MySQL.query('UPDATE users SET jailtime = @jailtime WHERE identifier = @id  ', {['@jailtime']=jailremain,['@id']=id})
    TriggerClientEvent('esx:showNotification', _source, 'You got time in jail: '..jailremain.." minutes")
  end
    if result[1].jailtime == 1 then
      TriggerClientEvent('injail',_source,false) 
      TriggerClientEvent('outofjail',_source)
      MySQL.query('UPDATE users SET jailtime = @jailtime WHERE identifier = @id  ', {['@jailtime']=0,['@id']=id})
    end


    
  end)
 

end)




function id() --Function to get the license 

  for k,v in pairs(GetPlayerIdentifiers(source))do
    --print(v)
        
      if string.sub(v, 1, string.len("license:")) == "license:" then
        license = v
        local identifier = string.gsub(license, 'license:', '')
      -- print(identifier)
    
        return identifier
      end
    end
    
end




function ExtractIdentifiers(source) --Function to get the license 

  for k,v in pairs(GetPlayerIdentifiers(source))do
    --print(v)
        
      if string.sub(v, 1, string.len("license:")) == "license:" then
        license = v
        local identifier = string.gsub(license, 'license:', '')
      -- print(identifier)

        return identifier
      end
    end
    
end





RegisterServerEvent('test')
AddEventHandler('test',function()  -- Checks the time
  local tt = id()
  local _source = source
  idn = table.unpack(GetPlayers(_source))
  MySQL.query('SELECT jailtime from users WHERE identifier=@id' , {['id']=tt}, function(result) 
    
  
  if result[1].jailtime > 0 then 
  
  
    TriggerClientEvent('injail',_source,true) 
  end
    
      end)


end)




RegisterCommand("jail", function(source, args, rawCommand)


  local _source = source
  local xPlayer = ESX.GetPlayerFromId(_source)
  time = args[2]

  person = args[1]  
  
 

  if xPlayer.getJob().name == "police" then 
  for _, playerId in ipairs(GetPlayers()) do
    
    local identifier = ExtractIdentifiers(source)
    
    if playerId == person then 
      
      TriggerClientEvent('tpprison',playerId,playerId,args[2])
      TriggerClientEvent('esx:showNotification', playerId, 'You have been jailed for: '..args[2].." minutes")
      --TriggerClientEvent('injail',_source,true)
     MySQL.query('UPDATE users SET jailtime = @jailtime WHERE identifier = @id  ', {['@jailtime']=args[2],['@id']=identifier})
      
    end

  end

end

end, false --[[this command is not restricted, everyone can use this.]])
