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
    
end