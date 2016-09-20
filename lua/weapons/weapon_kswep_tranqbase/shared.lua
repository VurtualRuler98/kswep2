if (SERVER) then
	AddCSLuaFile()
end
SWEP.Spawnable=false
SWEP.AdminSpawnable=false
SWEP.TranqMultiplier=1
if (CLIENT) then
	SWEP.PrintName="BASE"
	SWEP.Author="vurtual"
	SWEP.Slot=0
	SWEP.SlotPos=0
end
SWEP.Base="weapon_kswep"
SWEP.TranqTargets={}
function SWEP:FireShot(bullet)
	self:TranqShot(bullet)
end
function SWEP:TranqShot(bullet)
	local tr=util.TraceLine({
		start=bullet.Src,
		endpos=bullet.Src+bullet.Dir*10000,
		filter=self.Owner,
		mask=MASK_SHOT
	})
	if (IsValid(tr.Entity) && (tr.Entity:IsPlayer() || tr.Entity:IsNPC())) then
		if (SERVER) then
		local dmg
		if (tr.HitGroup==HITGROUP_CHEST) then
			dmg=20*self.TranqMultiplier
		elseif (tr.HitGroup==HITGROUP_HEAD) then
			dmg=100*self.TranqMultiplier
		else
			dmg=5*self.TranqMultiplier
		end
		self:TranqSecond(dmg,tr.Entity)
		end
			
		sound.Play("weapon_tmosin.HitBody",tr.HitPos)
	else
		sound.Play("weapon_tmosin.HitWorld",tr.HitPos)
	end
end
function SWEP:TranqSecond(dmg,ent)
	if (!IsValid(ent)) then return end
	local d=DamageInfo()
	d:SetDamageType(DMG_PREVENT_PHYSICS_FORCE)
	d:SetAttacker(ent)
	d:SetInflictor(ent)
	d:SetDamage(dmg)
	if (IsValid(ent)) then
		ent:TakeDamageInfo(d)
	end
	if (IsValid(ent) && ent:IsNPC()) then
		table.insert(self.TranqTargets,{dmg=dmg,ent=ent,time=CurTime()+1})
	end
end
function SWEP:Think2()
	for k,v in pairs(self.TranqTargets) do
		if (v.time<CurTime()) then
			table.remove(self.TranqTargets,k)
			self:TranqSecond(v.dmg,v.ent)
		end
	end
end
