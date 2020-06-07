AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/cpthazama/masseffect3/geth_prime.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.HullType = HULL_LARGE

ENT.StartHealth = 100
ENT.Shields = 100 -- Shields/Biotic Shields drastically reduce incoming bullet damage, other damages do NOT get reduced
ENT.Armor = 100 -- Reduces all incoming damage, however it is completely useless from biotic damage

ENT.MeleeAttackDamage = 45
ENT.MeleeAttackDamageDistance = 150

ENT.HasDeathAnimation = true -- Does it play an animation when it dies?
ENT.AnimTbl_Death = {"prime_death"}

ENT.RGB = "181 70 82"
ENT.Collisions = Vector(26,26,110)

ENT.SoundTbl_Idle = {
	"vj_masseffect3/geth_prime/talk01.wav",
	"vj_masseffect3/geth_prime/talk02.wav",
	"vj_masseffect3/geth_prime/talk03.wav",
	"vj_masseffect3/geth_prime/talk04.wav",
	"vj_masseffect3/geth_prime/talk05.wav",
	"vj_masseffect3/geth_prime/talk06.wav",
	"vj_masseffect3/geth_prime/talk07.wav",
	"vj_masseffect3/geth_prime/talk08.wav",
	"vj_masseffect3/geth_prime/talk09.wav",
	"vj_masseffect3/geth_prime/talk10.wav",
	"vj_masseffect3/geth_prime/talk11.wav",
	"vj_masseffect3/geth_prime/talk12.wav",
	"vj_masseffect3/geth_prime/talk13.wav",
	"vj_masseffect3/geth_prime/talk14.wav",
	"vj_masseffect3/geth_prime/talk15.wav",
	"vj_masseffect3/geth_prime/talk16.wav",
	"vj_masseffect3/geth_prime/talk17.wav",
	"vj_masseffect3/geth_prime/talk18.wav",
	"vj_masseffect3/geth_prime/talk19.wav",
	"vj_masseffect3/geth_prime/talk20.wav",
	"vj_masseffect3/geth_prime/talk21.wav",
	"vj_masseffect3/geth_prime/talk22.wav",
	"vj_masseffect3/geth_prime/talk23.wav",
	"vj_masseffect3/geth_prime/talk24.wav",
	"vj_masseffect3/geth_prime/talk25.wav",
	"vj_masseffect3/geth_prime/talk26.wav",
	"vj_masseffect3/geth_prime/talk27.wav",
	"vj_masseffect3/geth_prime/talk28.wav",
	"vj_masseffect3/geth_prime/talk29.wav",
	"vj_masseffect3/geth_prime/talk30.wav",
}
ENT.SoundTbl_Alert = ENT.SoundTbl_Idle
ENT.SoundTbl_CombatIdle = ENT.SoundTbl_Idle
ENT.SoundTbl_Pain = {
	"vj_masseffect3/geth_prime/pain01.wav",
	"vj_masseffect3/geth_prime/pain02.wav",
	"vj_masseffect3/geth_prime/pain03.wav",
	"vj_masseffect3/geth_prime/pain04.wav",
	"vj_masseffect3/geth_prime/pain05.wav",
	"vj_masseffect3/geth_prime/pain06.wav",
	"vj_masseffect3/geth_prime/pain07.wav",
	"vj_masseffect3/geth_prime/pain08.wav",
}
ENT.SoundTbl_Death = {
	"vj_masseffect3/geth_prime/death01.wav",
	"vj_masseffect3/geth_prime/death02.wav",
}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnSetupWeaponHoldTypeAnims(htype)
	self.CurrentHoldType = htype
	local idle = "prime_idle"
	local walk = "prime_walk"
	local walk_aim = "prime_walk"
	local run = "prime_walk"
	local run_aim = "prime_walk"
	local crouch_move = "prime_walk"
	local fire = "prime_fire"
	local crouch = "cover_crouch"
	local reload = "prime_reload"
	local melee = "rifle_melee"

	self:SetAnimData(idle,crouch,crouch_move,walk,run,fire,reload,melee,walk_aim,run_aim)
	return true
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnWeaponReload()
	self.IsGuard = true
	timer.Simple(0.2,function()
		if IsValid(self) then
			self.IsGuard = false
		end
	end)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomDeathAnimationCode(dmginfo,hitgroup)
	timer.Simple(1.45,function()
		if IsValid(self) then
			local pos = self:GetPos()
			VJ_EmitSound(self,"vj_mili_tank/tank_death2.wav",100,100)
			util.VJ_SphereDamage(self,self,pos,400,200,DMG_BLAST,true,true)
			util.ScreenShake(pos,100,200,1,2500)
			ParticleEffect("vj_explosion2",pos,Angle(0,0,0),nil)
			self:Remove()
		end
	end)
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/