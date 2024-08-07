ESX = exports['es_extended']:getSharedObject()
lib.locale()

lib.registerContext({
    id = 'Foxy_Sell',
    title = locale('Sell'),
    options = {
        title = locale('BananaSell'),
        description = locale('BananaSellDescription'),
        icon =  'fa-sharp fa-solid fa-basket-shopping-simple',
        onselect = function ()
            TriggerServerEvent('Foxy_Hobbymunka:BananaSell')
        end
    },
    {
        title = locale('AppleSell'),
        description = locale('AppleSellDescription'),
        icon = 'fa-sharp fa-solid fa-basket-shopping-simple',
        onselect = function ()
            TriggerServerEvent('Foxy_Hobbymunka:AppleSell')
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
    
if Config.ox_target == true then
    exports.ox_target:addSphereZone({
        coords = Config.TargetCoords.coords1,
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
        coords = Config.TargetCoords.coords2,
        radius = 1.5,
        debug = Config.Debug,
        drawSprite = false,
        options = {
            label = locale('FruitPicking'),
            icon = 'fa-solid fa-banana',
            onselect = function ()
                lib.progressBar({
                    duration = Config.Time.Time,
                    label = locale('FruitPicking'),
                    useWhileDead = false,
                    canCancel = false,
                    disable = {
                        move = true,
                    },
                }) 
                lib.callback('Foxy_Hobbymunka:server:Logbanana')
                TriggerServerEvent('Foxy_Hobbymunka:Bananagiveitem')
            end
        }
    })
    exports.ox_target:addSphereZone({
        coords = Config.TargetCoords.coords3,
        radius = 1.5,
        debug = Config.Debug,
        drawSprite = false,
        options = {
            label = locale('FruitPicking'),
            icon = 'fa-solid fa-apple-whole',
            onselect = function ()
                lib.progressBar({
                    duration = Config.Time.Time,
                    label = locale('FruitPicking'),
                    useWhileDead = false,
                    canCancel = false,
                    disable = {
                        move = true,
                    },
                }) 
                lib.callback('Foxy_Hobbymunka:server:LogApple')
                TriggerServerEvent('Foxy_Hobbymunka:Applegiveitem')
            end
        }
    })
    else
local zone = lib.zones.sphere({
    coords = Config.TargetCoords.coords1,
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
    coords = Config.TargetCoords.coords2,
    radius = 1.5,
    debug = Config.Debug,
    inside = function ()
        ESX.ShowHelpNotification(locale('BananaPicking1'))
        if IsControlJustReleased(0, Config.Gomb) then
            lib.progressBar({
                duration = Config.Time.Time,
                label = locale('FruitPicking'),
                useWhileDead = false,
                canCancel = false,
                disable = {
                    move = true,
                },
            }) 
            lib.callback('Foxy_Hobbymunka:server:Logbanana')
            TriggerServerEvent('Foxy_Hobbymunka:Bananagiveitem')
        end
    end
})
local zone2 lib.zones.sphere({
    coords = Config.TargetCoords.coords3,
    radius = 1.5,
    debug = Config.Debug,
    inside = function ()
        ESX.ShowHelpNotification(locale('ApplePicking1'))
        if IsControlJustReleased(0, Config.Gomb) then
            lib.progressBar({
                duration = Config.Time.Time,
                label = locale('FruitPicking'),
                useWhileDead = false,
                canCancel = false,
                disable = {
                    move = true,
                },
            }) 
            lib.callback('Foxy_Hobbymunka:server:LogApple')
            TriggerServerEvent('Foxy_Hobbymunka:Applegiveitem')
        end
    end
})
end
end)