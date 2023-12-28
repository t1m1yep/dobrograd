function SWEP:makeForensicsTable() 
    local forensics = {}
    self:SetNetVar('forensics', fingeforensicsrprints)
end

hook.Add('octoinv.pickup', 'forensics', function(ply, ent, item, amount)
    if ent:forensics = nil then makeForensicsTable() end
    if not ent:IsWeapon() then return end
    ply:createForensics(ent)
end)

hook.Add('PlayerSwitchWeapon', 'forensics', function(ply, oldWep, newWep)
    if newWep == nil then return end
    if not newWep:IsWeapon() then return end
    if newWep.forensics == nil then makeForensicsTable() end
    ply:createForensics(newWep)
end)