if (!file.Exists("autorun/vj_base_autorun.lua","LUA")) then return end
---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Base 						= "weapon_vj_base"
SWEP.PrintName					= "Geth Pulse Shotgun"
SWEP.Author 					= "Cpt. Hazama"
SWEP.Contact					= "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose					= "This weapon is made for Players and NPCs"
SWEP.Instructions				= "Controls are like a regular weapon."
SWEP.Category					= "Mass Effect 3"
	-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModel					= "models/cpthazama/masseffect3/weapons/gethpulseshotgun.mdl" -- The world model (Third person, when a NPC is holding it, on ground, etc.)
SWEP.HoldType 					= "shotgun" -- List of holdtypes are in the GMod wiki
SWEP.MadeForNPCsOnly 			= true -- Is this weapon meant to be for NPCs only?
	-- NPC Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.NPC_NextPrimaryFire 		= 1.6 -- Next time it can use primary fire
SWEP.NPC_TimeUntilFireExtraTimers = {0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1,1.1} -- Extra timers, which will make the gun fire again! | The seconds are counted after the self.NPC_TimeUntilFire!
SWEP.NPC_ReloadSound			= {"vj_masseffect3/weapons/geth_reload1.wav","vj_masseffect3/weapons/geth_reload2.wav"} -- Sounds it plays when the base detects the SNPC playing a reload animation
	-- World Model ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModel_UseCustomPosition = true -- Should the gun use custom position? This can be used to fix guns that are in the crotch
SWEP.WorldModel_CustomPositionAngle = Vector(-10,168,5)
SWEP.WorldModel_CustomPositionOrigin = Vector(2.4,1,2.5)
SWEP.WorldModel_CustomPositionBone = "RightWrist" -- The bone it will use as the main point
SWEP.PrimaryEffects_MuzzleParticles = {"vj_rifle_full_blue"}
SWEP.PrimaryEffects_SpawnShells = false
SWEP.PrimaryEffects_DynamicLightColor = Color(0, 150, 255)
	-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Damage				= 8 -- Damage
SWEP.Primary.ClipSize			= 80 -- Max amount of bullets per clip
SWEP.Primary.Sound				= {"vj_masseffect3/weapons/geth_fire1.wav","vj_masseffect3/weapons/geth_fire2.wav"}
SWEP.Primary.TracerType			= "VJ_ME3_Tracer_Geth"
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:CustomOnReload()
	timer.Simple(0.52,function()
		VJ_EmitSound(self:GetOwner(),"vj_masseffect3/weapons/geth_ready.wav",self.NPC_ReloadSoundLevel)
	end)
end