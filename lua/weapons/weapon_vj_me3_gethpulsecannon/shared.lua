if (!file.Exists("autorun/vj_base_autorun.lua","LUA")) then return end
---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Base 						= "weapon_vj_base"
SWEP.PrintName					= "Geth Pulse Cannon"
SWEP.Author 					= "Cpt. Hazama"
SWEP.Contact					= "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose					= "This weapon is made for Players and NPCs"
SWEP.Instructions				= "Controls are like a regular weapon."
SWEP.Category					= "Mass Effect 3"
	-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModel					= "models/cpthazama/masseffect3/weapons/gethpulsecannon.mdl" -- The world model (Third person, when a NPC is holding it, on ground, etc.)
SWEP.HoldType 					= "ar2" -- List of holdtypes are in the GMod wiki
SWEP.MadeForNPCsOnly 			= true -- Is this weapon meant to be for NPCs only?
	-- NPC Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.NPC_NextPrimaryFire 		= 1 -- Next time it can use primary fire
SWEP.NPC_ReloadSound			= {"vj_masseffect3/weapons/geth_reload1.wav","vj_masseffect3/weapons/geth_reload2.wav"} -- Sounds it plays when the base detects the SNPC playing a reload animation
	-- World Model ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModel_UseCustomPosition = true -- Should the gun use custom position? This can be used to fix guns that are in the crotch
SWEP.WorldModel_CustomPositionAngle = Vector(-10,168,5)
SWEP.WorldModel_CustomPositionOrigin = Vector(4.5,2.2,5)
SWEP.WorldModel_CustomPositionBone = "RightWrist" -- The bone it will use as the main point
SWEP.PrimaryEffects_MuzzleParticles = {"vj_rifle_full_blue"}
SWEP.PrimaryEffects_SpawnShells = false
SWEP.PrimaryEffects_DynamicLightColor = Color(0, 150, 255)
	-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.ClipSize			= 9 -- Max amount of bullets per clip
SWEP.PrimarySound				= "vj_masseffect3/weapons/geth_pulse_cannon.wav"
SWEP.Primary.DisableBulletCode	= true
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:CustomOnPrimaryAttack_BeforeShoot()
	if (CLIENT) then return end
	
	self:EmitSound(self.PrimarySound,105,math.random(90,100))
	
	local projectile = ents.Create("obj_vj_me3_pulse")
	projectile:SetPos(self:GetAttachment(1).Pos)
	projectile:SetAngles((self.Owner:GetEnemy():GetPos() +self.Owner:GetEnemy():OBBCenter() -self:GetAttachment(1).Pos):Angle())
	projectile:SetOwner(self.Owner)
	projectile:Activate()
	projectile:Spawn()

	local phy = projectile:GetPhysicsObject()
	if phy:IsValid() then
		phy:ApplyForceCenter(((self.Owner:GetEnemy():GetPos() +self.Owner:GetEnemy():OBBCenter() -self:GetAttachment(1).Pos) *5000))
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:CustomOnReload()
	timer.Simple(0.52,function()
		VJ_EmitSound(self:GetOwner(),"vj_masseffect3/weapons/geth_ready.wav",self.NPC_ReloadSoundLevel)
	end)
end