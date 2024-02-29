local QBCore = exports['qb-core']:GetCoreObject();

local GoProState = false
local hasGoPro = false

RegisterNetEvent('c2k_gopro:client:UseGoPro', function(citizenid)
    if not GoProState then
        SendNUIMessage({
            action = 'show',
            type = 'gopro',
            citizenid = citizenid,
            gopro = true
        })
        if Config.Debug then print('on') end
        GoProState = true
        QBCore.Functions.Notify(Config.GoProOnNotify)
    else
        SendNUIMessage({
            action = 'show',
            type = 'gopro',
            gopro = false
        })
        if Config.Debug then print('off') end
        GoProState = false
        QBCore.Functions.Notify(Config.GoProOffNotify)
    end
end)

local function GoProCheck(PlayerItems)
    local _hasGoPro = false

    for _, item in pairs(PlayerItems) do
        if item.name == Config.GoProItemName then
            _hasGoPro = true
            break;
        end
    end
    hasGoPro = _hasGoPro
end

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    Citizen.CreateThread(function()
    while true do
        PlayerData = QBCore.Functions.GetPlayerData()
        GoProCheck(PlayerData.items)
        if Config.Debug then
            print('INSIDE WHILE')
            print('hasGoPro == '..tostring(hasGoPro))
            print('GoProState == '..tostring(GoProState))
        end
        if hasGoPro == false and GoProState == true then
            if Config.Debug then print('off') end
            SendNUIMessage({
                action = 'show',
                type = 'gopro',
                gopro = false
            })
            GoProState = false
            QBCore.Functions.Notify(Config.GoProOffNotify)
        end
        Wait(1000)
    end
end)
end)