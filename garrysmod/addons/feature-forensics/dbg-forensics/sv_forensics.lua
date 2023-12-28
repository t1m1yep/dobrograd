local meta = FindMetaTable("Player")
function meta:generateForensics()
	local forensics = {
		["fingerprint"] = "",
		["player"] = self,
	}
	for i=0,13,1 do 
		local char = string.char(math.random(65, 65 + 25))
		forensics.fingerprint = forensics.fingerprint .. char
	end
    self:SetNetVar("forensics", forensics)
end

function meta:createForensics(ent)
	if self:forensics == nil then
        generateForensics()
    end
	table.insert(ent.fingerprints, self:forensics)
end