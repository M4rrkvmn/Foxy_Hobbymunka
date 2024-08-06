ESX = exports['es_extended']:getSharedObject()
lib.locale()

lib.callback.register('Foxy_Hobbymunka:server:LogApple', function (source,xPlayer)
    local xPlayer = ESX.GetPlayerFromId(source)
    local Reward1 = locale('Apple')

    if not xPlayer then
        return
    end

    logToDiscord(xPlayer.name ..'Leszedett egy', Reward1) 
end)

lib.callback.register('Foxy_Hobbymunka:server:Logbanana', function (source,xPlayer)
    local xPlayer = ESX.GetPlayerFromId(source)
    local Reward2 = locale('Banan')

    if not xPlayer then
        return
    end

    logToDiscord(xPlayer.name ..'Leszedett egy', Reward2) 
end)

lib.callback.register('Foxy_Hobbymunka:server:LogSellApple', function (source,xPlayer)
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then
        return
    end

    logToDiscord(xPlayer.name ..'Eladót egy', Reward1)    
end)

lib.callback.register('Foxy_Hobbymunka:server:LogSellBanana', function (source,xPlayer)
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then
        return
    end

    logToDiscord(xPlayer.name ..'Eladót egy', Reward2)
end)

AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        if ped then
            DeleteEntity(ped)
        end
    end
end)

RegisterNetEvent('Foxy_Hobbymunka:Cashgiveitem')
AddEventHandler('Foxy_Hobbymunka:Cashgiveitem', function (source,xPlayer)
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if not xPlayer then
        return
    end

    xPlayer.addInventoryItem(Config.Reward.item, Config.Reward.cash)
end)

RegisterNetEvent('Foxy_Hobbymunka:Appleremoveitem')
AddEventHandler('Foxy_Hobbymunka:Appleremoveitem', function (source,xPlayer)
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then
        return
    end

    xPlayer.removeInventoryItem(Config.Fruit.Apple, Config.Fruit.number2)
end)

RegisterNetEvent('Foxy_Hobbymunka:Applegiveitem')
AddEventHandler('Foxy_Hobbymunka:Applegiveitem', function (source,xPlayer)
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then
        return
    end

    xPlayer.AddInventoryItem(Config.Fruit.Apple, Config.Fruit.number2)
end)

RegisterNetEvent('Foxy_Hobbymunka:Bananaremoveitem')
AddEventHandler('Foxy_Hobbymunka:Bananaremoveitem', function (source,xPlayer)
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then
        return
    end

    xPlayer.removeInventoryItem(Config.Fruit.Banana, Config.Fruit.number1)
end)

RegisterNetEvent('Foxy_Hobbymunka:Bananagiveitem')
AddEventHandler('Foxy_Hobbymunka:Bananagiveitem', function (source,xPlayer)
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then
        return
    end

    xPlayer.AddInventoryItem(Config.Fruit.Banana, Config.Fruit.number1)
end)

RegisterNetEvent('Foxy_Hobbymunka:BananaSell')
AddEventHandler('Foxy_Hobbymunka:BananaSell', function (xPlayer,source)
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then
        return
    end
        if xPlayer.hasItem('apple') >= 1 then
            TriggerServerEvent('Foxy_Hobbymunka:Cashgiveitem')
           TriggerServerEvent('Foxy_Hobbymunka:Appleremoveitem')
           lib.callback('Foxy_Hobbymunka:server:LogSellApple')
           else
            ESX.ShowNotification(locale('DontHaveitBanana'))
        end
end)

RegisterNetEvent('Foxy_Hobbymunka:AppleSell')
AddEventHandler('Foxy_Hobbymunka:AppleSell', function (source,xPlayer)
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then
        return        
    end
            if xPlayer.hasItem('banana') >= 1 then
            TriggerServerEvent('Foxy_Hobbymunka:Cashgiveitem')
            TriggerServerEvent('Foxy_Hobbymunka:Bananaremoveitem')
            lib.callback('Foxy_Hobbymunka:server:LogSellBanana')
            else
                ESX.ShowNotification(locale('DontHaveitApple'))
            end
end)