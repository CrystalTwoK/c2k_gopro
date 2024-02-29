local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem(Config.GoProItemName, function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent('c2k_gopro:client:UseGoPro', source, Player.PlayerData.citizenid)
end)