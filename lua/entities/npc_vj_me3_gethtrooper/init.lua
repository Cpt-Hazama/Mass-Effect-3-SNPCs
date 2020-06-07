AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/cpthazama/masseffect3/geth_trooper.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want

ENT.StartHealth = 100
ENT.Shields = 0 -- Shields/Biotic Shields drastically reduce incoming bullet damage, other damages do NOT get reduced
ENT.Armor = 0 -- Reduces all incoming damage, however it is completely useless from biotic damage

-- ENT.PoseParameterLooking_Names = {pitch={"aim_rifle_pitch"},yaw={"aim_rifle_yaw"},roll={}}

ENT.BloodColor = "White" -- The blood type, this will determine what it should use (decal, particle, etc.)

ENT.VJ_NPC_Class = {"CLASS_ME_GETH"} -- NPCs with the same class with be allied to each other

ENT.HasMeleeAttack = true -- Should the SNPC have a melee attack?
ENT.MeleeAttackDamage = 10
ENT.TimeUntilMeleeAttackDamage = false -- This counted in seconds | This calculates the time until it hits something

ENT.DisableFootStepSoundTimer = true

ENT.CanCrouchOnWeaponAttack = false -- Can it crouch while shooting?

ENT.RGB = "160 172 255"
ENT.Collisions = Vector(13,13,72)

	-- ====== File Path Variables ====== --
	-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {"vj_masseffect3/geth/legion_foot01.wav","vj_masseffect3/geth/legion_foot02.wav","vj_masseffect3/geth/legion_foot03.wav"}
ENT.SoundTbl_Idle = {"vj_masseffect3/geth/sfx_ss_geth_trooper_ss_geth_trooper_00307883_m.wav","vj_masseffect3/geth/sfx_ss_geth_trooper_ss_geth_trooper_00307885_m.wav","vj_masseffect3/geth/sfx_ss_geth_trooper_ss_geth_trooper_00307886_m.wav","vj_masseffect3/geth/sfx_ss_geth_trooper_ss_geth_trooper_00307887_m.wav","vj_masseffect3/geth/sfx_ss_geth_trooper_ss_geth_trooper_00307888_m.wav","vj_masseffect3/geth/sfx_ss_geth_trooper_ss_geth_trooper_00307889_m.wav","vj_masseffect3/geth/sfx_ss_geth_trooper_ss_geth_trooper_00307892_m.wav","vj_masseffect3/geth/sfx_ss_geth_trooper_ss_geth_trooper_00307893_m.wav"}
ENT.SoundTbl_Alert = {"vj_masseffect3/geth/sfx_ss_geth_trooper_ss_geth_trooper_00307868_m.wav","vj_masseffect3/geth/sfx_ss_geth_trooper_ss_geth_trooper_00307869_m.wav","vj_masseffect3/geth/sfx_ss_geth_trooper_ss_geth_trooper_00307870_m.wav","vj_masseffect3/geth/sfx_ss_geth_trooper_ss_geth_trooper_00307878_m.wav","vj_masseffect3/geth/sfx_ss_geth_trooper_ss_geth_trooper_00307879_m.wav","vj_masseffect3/geth/sfx_ss_geth_trooper_ss_geth_trooper_00307880_m.wav","vj_masseffect3/geth/sfx_ss_geth_trooper_ss_geth_trooper_00307881_m.wav","vj_masseffect3/geth/sfx_ss_geth_trooper_ss_geth_trooper_00307882_m.wav","vj_masseffect3/geth/sfx_ss_geth_trooper_ss_geth_trooper_00307895_m.wav","vj_masseffect3/geth/sfx_ss_geth_trooper_ss_geth_trooper_00307897_m.wav"}
ENT.SoundTbl_CombatIdle = ENT.SoundTbl_Alert
ENT.SoundTbl_Pain = {"vj_masseffect3/geth/sfx_ss_geth_trooper_ss_geth_trooper_00307871_m.wav","vj_masseffect3/geth/sfx_ss_geth_trooper_ss_geth_trooper_00307872_m.wav","vj_masseffect3/geth/sfx_ss_geth_trooper_ss_geth_trooper_00307891_m.wav","vj_masseffect3/geth/sfx_ss_geth_trooper_ss_geth_trooper_00307894_m.wav","vj_masseffect3/geth/sfx_ss_geth_trooper_ss_geth_trooper_00307898_m.wav","vj_masseffect3/geth/sfx_ss_geth_trooper_ss_geth_trooper_00307899_m.wav","vj_masseffect3/geth/sfx_ss_geth_trooper_ss_geth_trooper_00307899_m.wav","vj_masseffect3/geth/sfx_ss_geth_trooper_ss_geth_trooper_00307901_m.wav"}
ENT.SoundTbl_Death = {"vj_masseffect3/geth/sfx_ss_geth_trooper_ss_geth_trooper_00307874_m.wav","vj_masseffect3/geth/sfx_ss_geth_trooper_ss_geth_trooper_00307875_m.wav","vj_masseffect3/geth/sfx_ss_geth_trooper_ss_geth_trooper_00307876_m.wav","vj_masseffect3/geth/sfx_ss_geth_trooper_ss_geth_trooper_00307877_m.wav"}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
	self:SetCollisionBounds(Vector(self.Collisions.x,self.Collisions.y,self.Collisions.z),Vector(-self.Collisions.x,-self.Collisions.y,0))
	self:SetHealth(self:VJ_GetDifficultyValue(self.StartHealth +self.Shields +self.Armor)) -- These values stack in Mass Effect, however Shields and Armor will effect certain damage types if they exist. For some reason, Geth Troopers do not have armor even though the rest of the Geth have armor

	local eyeglow = ents.Create("env_sprite")
	eyeglow:SetKeyValue("model","sprites/light_glow01.vmt")
	eyeglow:SetKeyValue("scale","2")
	eyeglow:SetKeyValue("rendermode","9")
	eyeglow:SetKeyValue("rendercolor",self.RGB .. " 0")
	eyeglow:SetKeyValue("spawnflags","1") -- If animated
	eyeglow:SetParent(self)
	eyeglow:Fire("SetParentAttachment","light",0)
	eyeglow:Spawn()
	eyeglow:Activate()
	self:DeleteOnRemove(eyeglow)

    -- local projectedlight = ents.Create("env_projectedtexture")
    -- projectedlight:SetKeyValue("lightfov", "50")
    -- projectedlight:SetKeyValue("FarZ", "612")
    -- projectedlight:SetKeyValue("NearZ", "0.1")
	-- projectedlight:SetKeyValue("LightColor", self.RGB .. " 0")
    -- projectedlight:Input("SpotlightTexture", NULL, NULL, "effects/flashlight001")
    -- projectedlight:SetParent(self)
	-- projectedlight:Fire("SetParentAttachment","light",0)
    -- projectedlight:Spawn()
    -- projectedlight:Activate()
    -- self:DeleteOnRemove(projectedlight)
	
    -- local spotlight = ents.Create("point_spotlight")
    -- spotlight:SetKeyValue("spawnflags","3")
    -- spotlight:SetKeyValue("spotlightlength","10")
    -- spotlight:SetKeyValue("spotlightwidth","10")
    -- spotlight:SetColor(Color(200,225,225,235))
    -- spotlight:SetParent(self)
	-- spotlight:Fire("SetParentAttachment","light",0)
	-- spotlight:Spawn()
    -- spotlight:Activate()
    -- self:DeleteOnRemove(spotlight)
	-- self.RemoveEntity = spotlight
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "event_emit step" then
		self:FootStepSoundCode()
	end
	if key == "event_mattack rifle" then
		self:MeleeAttackCode()
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink()
	-- self.AnimTbl_IdleStand = {ACT_IDLE}
	-- self.AnimTbl_Walk = {VJ_SequenceToActivity(self,"rifle_walk")}
	-- self.AnimTbl_Run = {ACT_SPRINT}
	-- self.AnimTbl_ShootWhileMovingRun = {VJ_SequenceToActivity(self,"rifle_run")}
	-- self.AnimTbl_ShootWhileMovingWalk = {VJ_SequenceToActivity(self,"rifle_walk")}
	-- self.AnimTbl_WeaponAttack = {VJ_SequenceToActivity(self,"rifle_idle")}
	-- self.AnimTbl_WeaponReload = {"rifle_reload"}
	-- self.AnimTbl_MeleeAttack = {"rifle_melee"}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetAnimData(idle,crouch,crouch_move,walk,run,fire,reload,melee,walk_aim,run_aim)
	if type(idle) == "string" then idle = VJ_SequenceToActivity(self,idle) end
	if type(crouch) == "string" then crouch = VJ_SequenceToActivity(self,crouch) end
	if type(crouch_move) == "string" then crouch_move = VJ_SequenceToActivity(self,crouch_move) end
	if type(walk) == "string" then walk = VJ_SequenceToActivity(self,walk) end
	if type(run) == "string" then run = VJ_SequenceToActivity(self,run) end
	if type(fire) == "string" then fire = VJ_SequenceToActivity(self,fire) end
	if type(melee) == "string" then melee = VJ_SequenceToActivity(self,melee) end
	if type(walk_aim) == "string" then walk_aim = VJ_SequenceToActivity(self,walk_aim) end
	if type(run_aim) == "string" then run_aim = VJ_SequenceToActivity(self,run_aim) end

	self.WeaponAnimTranslations[ACT_IDLE] 							= idle
	self.WeaponAnimTranslations[ACT_WALK] 							= walk
	self.WeaponAnimTranslations[ACT_RUN] 							= run
	self.WeaponAnimTranslations[ACT_IDLE_ANGRY] 					= idle
	self.WeaponAnimTranslations[ACT_WALK_AIM] 						= walk_aim
	self.WeaponAnimTranslations[ACT_WALK_CROUCH] 					= run
	self.WeaponAnimTranslations[ACT_WALK_CROUCH_AIM] 				= walk_aim
	self.WeaponAnimTranslations[ACT_RUN_AIM] 						= run_aim
	self.WeaponAnimTranslations[ACT_RUN_CROUCH] 					= run
	self.WeaponAnimTranslations[ACT_RUN_CROUCH_AIM] 				= run_aim
	self.WeaponAnimTranslations[ACT_RANGE_ATTACK1] 					= idle
	self.WeaponAnimTranslations[ACT_GESTURE_RANGE_ATTACK1] 			= fire
	self.WeaponAnimTranslations[ACT_RANGE_ATTACK1_LOW] 				= crouch
	self.WeaponAnimTranslations[ACT_RELOAD]							= "vjges_" .. reload
	self.WeaponAnimTranslations[ACT_COVER_LOW] 						= crouch
	self.WeaponAnimTranslations[ACT_RELOAD_LOW] 					= "vjges_" .. reload
	self.WeaponAnimTranslations[ACT_MELEE_ATTACK1] 					= melee
	self.AnimTbl_WeaponReload 										= {"vjges_" .. reload}
	self.AnimTbl_MeleeAttack 										= {melee}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnSetupWeaponHoldTypeAnims(htype)
	self.CurrentHoldType = htype
	local idle = ACT_IDLE
	local walk = ACT_WALK
	local walk_aim = ACT_WALK_AIM
	local run = ACT_RUN
	local run_aim = ACT_RUN_AIM
	local crouch_move = ACT_SPRINT
	local fire = ACT_RANGE_ATTACK1
	local crouch = ACT_CROUCH
	local reload = ACT_RELOAD
	local melee = ACT_MELEE_ATTACK1
	if htype == "ar2" or htype == "shotgun" or htype == "smg" or htype == "crossbow" then
		idle = "rifle_idle"
		walk = "rifle_walk"
		walk_aim = "rifle_run" // rifle_walk
		run = "rifle_sprint"
		run_aim = "rifle_run"
		crouch_move = "rifle_sprint"
		fire = "rifle_fire"
		crouch = "cover_crouch"
		reload = "rifle_reload"
		melee = "rifle_melee"
		self.PoseParameterLooking_Names = {pitch={"aim_rifle_pitch"},yaw={"aim_rifle_yaw"},roll={}}
	elseif htype == "pistol" or htype == "revolver" then
		idle = "pistol_idle"
		walk = "pistol_walk"
		walk_aim = "pistol_run" // pistol_walk
		run = "pistol_sprint"
		run_aim = "pistol_run"
		crouch_move = "pistol_sprint"
		fire = "pistol_fire"
		crouch = "pistol_crouch"
		reload = "pistol_reload"
		melee = "pistol_melee"
		self.PoseParameterLooking_Names = {pitch={"aim_pistol_pitch"},yaw={"aim_pistol_yaw"},roll={}}
	end
	self:SetAnimData(idle,crouch,crouch_move,walk,run,fire,reload,melee,walk_aim,run_aim)
	return true
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
	local type = dmginfo:GetDamageType()
	local dmg = dmginfo:GetDamage()
	if self.Shields > 0 then
		if type == DMG_BULLET then
			if self.Shields -dmg *0.4 < 0 then
				self.Shields = 0
			else
				self.Shields = self.Shields -dmg *0.4
			end
			dmginfo:SetDamage(0)
		end
	end
	if self.Armor > 0 then
		if type != DMG_BULLET then
			if self.Armor -dmg < 0 then
				self.Armor = 0
			else
				self.Armor = self.Armor -dmg
			end
			dmginfo:SetDamage(0)
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnRemove()
	-- if IsValid(self.RemoveEntity) then
		-- self.RemoveEntity:Fire("LightOff",self.RemoveEntity,0)
		-- SafeRemoveEntity(self.RemoveEntity)
	-- end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/