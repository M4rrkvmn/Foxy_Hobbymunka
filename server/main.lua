ESX = exports['es_extended']:getSharedObject()

lib.callback.register('Foxy_Hobbymunka:server:LogApple', function (source,xPlayer)
    local xPlayer = ESX.GetPlayerFromId
    local Reward1 = 'almát'

    if not xPlayer then
        return
    end

    logToDiscord(xPlayer.name ..'Leszedett egy', Reward1) 
end)

lib.callback.register('Foxy_Hobbymunka:server:Logbanana', function (source,xPlayer)
    local xPlayer = ESX.GetPlayerFromId
    local Reward2 = 'banánt'

    if not xPlayer then
        return
    end

    logToDiscord(xPlayer.name ..'Leszedett egy', Reward2) 
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

lib.registerContext({
    id = 'Foxy_Sell',
    title = locale('Sell'),
    options = {
        title = locale('BananaSell'),
        description = locale('BananaSellDescription'),
        icon = '',
        onselect = function ()
            local xPlayer = ESX.GetPlayerFromId(source)
            if xPlayer.hasItem('apple') >= 1 then
            TriggerServerEvent('Foxy_Hobbymunka:Cashgiveitem')
           TriggerServerEvent('Foxy_Hobbymunka:Appleremoveitem')
           else
            ESX.ShowNotification(locale('DontHaveitBanana'))
            end
        end
    },
    {
        title = locale('AppleSell'),
        description = locale('AppleSellDescription'),
        icon = '',
        onselect = function ()
            local xPlayer = ESX.GetPlayerFromId(source)
            if xPlayer.hasItem('banana') >= 1 then
            TriggerServerEvent('Foxy_Hobbymunka:Cashgiveitem')
            TriggerServerEvent('Foxy_Hobbymunka:Bananaremoveitem')
            else
                ESX.ShowNotification(locale('DontHaveitApple'))
            end
        end
    }
})

CreateThread(function ()
    local hash = GetHashKey(Config.NPC.ped)
    ped = CreatePed(4, hash , Config.NPC.location , Config.NPC.headling ,false ,true)
    SetEntityAsMissionEntity(ped, true, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    SetEntityInvincible(ped, true)
    FreezeEntityPosition(ped, true)
if Config.ox_target == "true" then
    exports.ox_target:addSphereZone({
        coords = Config.NPC.location,
        radius = 1.5,
        debug = Config.Debug,
        drawSprite = false,
        options = {
            label = locale('Sell'),
            icon = 'fa-duotone fa-solid fa-basket-shopping',
            onselect = function ()
                lib.showContext('Foxy_Sell')
            end
        }
    })
    exports.ox_target:addSphereZone({
        coords = 0,0,0,
        radius = 1.5,
        debug = Config.Debug,
        drawSprite = false,
        options = {
            label = locale('FruitPicking'),
            icon = 'fa-solid fa-apple-whole',
            onselect = function ()
                TriggerServerEvent('Foxy_Hobbymunka:Bananagiveitem')
                lib.progressBar({
                    duration = Config.Time.Time,
                    label = locale('FruitPicking'),
                    useWhileDead = false,
                    canCancel = false,
                    disable = {
                        move = true,
                    },
                }) 
            end
        }
    })
    exports.ox_target:addSphereZone({
        coords = 0,0,0,
        radius = 1.5,
        debug = Config.Debug,
        drawSprite = false,
        options = {
            label = locale('FruitPicking'),
            icon = 'fa-solid fa-banana',
            onselect = function ()
                TriggerServerEvent('Foxy_Hobbymunka:Applegiveitem')
                lib.progressBar({
                    duration = Config.Time.Time,
                    label = locale('FruitPicking'),
                    useWhileDead = false,
                    canCancel = false,
                    disable = {
                        move = true,
                    },
                }) 
            end
        }
    })
    else
local zone = lib.zones.sphere({
    coords = Config.NPC.location,
    radius = 1.5,
    debug = Config.Debug,
    inside = function ()
        ESX.ShowHelpNotification(locale('FruitSell'))
        if IsControlJustReleased(0,Config.Gomb) then
            lib.showContext('Foxy_Sell')
        end
    end
})
local zone1 = lib.zones.sphere({
    coords = 0,0,0,
    radius = 1.5,
    debug = Config.Debug,
    inside = function ()
        ESX.ShowHelpNotification(locale('BananaPicking1'))
        lib.callback('Foxy_Hobbymunka:server:Logbanana')
        if IsControlJustReleased(0, Config.Gomb) then
            TriggerServerEvent('Foxy_Hobbymunka:Bananagiveitem')
        end
    end
})
local zone2 lib.zones.sphere({
    coords = 0,0,0,
    radius = 1.5,
    debug = Config.Debug,
    inside = function ()
        ESX.ShowHelpNotification(locale('ApplePicking1'))
        lib.callback('Foxy_Hobbymunka:server:LogApple')
        if IsControlJustReleased(0, Config.Gomb) then
            TriggerServerEvent('Foxy_Hobbymunka:Applegiveitem')
        end
    end
})
end
end)