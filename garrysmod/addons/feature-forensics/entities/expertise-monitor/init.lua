AddCSLuaFile 'cl_init.lua'
AddCSLuaFile 'shared.lua'

include 'shared.lua'

duplicator.RegisterEntityClass('ent_dbg_expertise_monitor', function(ply, data)
	return duplicator.GenericDuplicatorFunction(ply, data)
end, 'Data')

function ENT:Initialize()

	self:SetModel('models/props/cs_office/offcorkboarda.mdl')
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetUseType(SIMPLE_USE)
    
end

function ENT:Use(ply)
    local wep = ply:GetActiveWeapon()
    if not wep:IsWeapon() then return end
    netstream.Start(ply, 'simple-orgs.guest', wep)
    return
end