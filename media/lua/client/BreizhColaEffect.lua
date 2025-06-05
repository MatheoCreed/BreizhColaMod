BreizMod = {}

function BreizMod.ApplyBreizColaEffect(player)
    if not player or player:isDead() then
        return end

    -- Augmentation d'une stat :
    player:getStats():setFatigue(player.getStats():getFatigue() - 0.15 )
    
    -- ajout d'un effet
    player:Say("Du Breizh Cola !!")

    -- Augmentation vitesse 
    player:getModData().BreizhSpeedBoost = true 
    player:getModData().BreizhTimer = 1800 -- Ca fait environ 30 secondes
    Events.OnPlayerUpdate.Add(BreizMod.OnPlayerUpdate)
end

function BreizMod.OnPlayerUpdate(player)
    if not player:getModeData().BreizhSpeedBoost then 
        return end
    local modData = player:getModData()
    modData.BreizhTimer = modData.BreizhTimer - 1
    
    -- Suppression lègère de fatigue
    player:getStats():setFatigue(player:getStats():getFatigue() - 0.005)

    if modData.BreizhTimer <= 0 then
        modData.BreizhSpeedBoost = false 
        player:Say("Il te faut plus de Breizh Cola mon pote")
        Events.OnPlayerUpdate.Remove(BreizMod.OnPlayerUpdate)
    end
end