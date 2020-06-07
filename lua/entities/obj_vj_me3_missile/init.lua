AddCSLuaFile("shared.lua")
AddCSLuaFile("cl_init.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2015 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.IdleSound1 = Sound("weapons/rpg/rocket1.wav")
ENT.TouchSound = Sound("ambient/explosions/explode_8.wav")
ENT.TouchSoundv = 80
ENT.Decal = "Scorch"
ENT.AlreadyPaintedDecal = false
ENT.Dead = false
ENT.Speed = 900
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Initialize()
	self:SetModel("models/weapons/w_missile_launch.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetMoveCollide(COLLISION_GROUP_PROJECTILE)
	self:SetCollisionGroup(COLLISION_GROUP_PROJECTILE)
	self:SetSolid(SOLID_CUSTOM)
	self:SetOwner(self:GetOwner())

	local phys = self.Entity:GetPhysicsObject()
	if (phys:IsValid()) then
		phys:Wake()
		phys:SetMass(1)
		phys:EnableGravity(false)
		phys:EnableDrag(false)
		phys:SetBuoyancyRatio(0)
	end

	self.StartLight1 = ents.Create("light_dynamic")
	self.StartLight1:SetKeyValue("brightness", "1")
	self.StartLight1:SetKeyValue("distance", "200")
	self.StartLight1:SetLocalPos(self:GetPos())
	self.StartLight1:SetLocalAngles( self:GetAngles() )
	self.StartLight1:Fire("Color", "255 150 0")
	self.StartLight1:SetParent(self)
	self.StartLight1:Spawn()
	self.StartLight1:Activate()
	self.StartLight1:Fire("TurnOn", "", 0)
	self:DeleteOnRemove(self.StartLight1)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Think()
	if self.Dead == true then
		if self.idlesoundc then
			self.idlesoundc:Stop()
		end
	end
	if self.Dead == false then
		self.idlesoundc = CreateSound(self, self.IdleSound1)
		self.idlesoundc:PlayEx(1, 100)

		if IsValid(self.Owner) then
			self.ParentsEnemy = self.Owner:GetEnemy()
		end

		if IsValid(self.Owner) && IsValid(self.ParentsEnemy) then
			-- self:SetAngles(self:GetVelocity():GetNormal():Angle())
			self:SetAngles((self.ParentsEnemy:GetPos() +self.ParentsEnemy:OBBCenter() -self:GetPos()):Angle())
			local phys = self:GetPhysicsObject()
			if (phys:IsValid()) then
				phys:SetVelocity(self:GetForward() *self.Speed)
				-- phys:ApplyForceCenter(((self.ParentsEnemy:GetPos() +self.ParentsEnemy:OBBCenter() +self.ParentsEnemy:GetUp()*math.Rand(30,45) +self.ParentsEnemy:GetRight()*math.Rand(-30,30)) - self:GetPos())*4 +self:GetRight()*math.Rand(-40,40) +self:GetUp()*math.Rand(-40,40) +self:GetForward()*math.Rand(-40,40))
			end
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:PhysicsCollide(data,physobj,entity)
	-- Removes
	//self.Dead = true
	if self.idlesoundc then self.idlesoundc:Stop() end
	self:StopParticles()

	if self.Dead == false then
	self.Dead = true
	
	local lastvel = math.max(data.OurOldVelocity:Length(), data.Speed) -- Get the last velocity and speed
	local oldvel = physobj:GetVelocity()
	local newvel = oldvel:GetNormal()
	lastvel = math.max(newvel:Length(), lastvel)
	local setvel = newvel*lastvel*0.3
	physobj:SetVelocity(setvel)
	
	-- Damages
	if self:GetOwner() == NULL then
		util.VJ_SphereDamage(self,self,self:GetPos(),200,85,DMG_BLAST,true,true)
	else
		util.VJ_SphereDamage(self:GetOwner(),self,self:GetPos(),200,85,DMG_BLAST,true,true)
	end
	timer.Simple(0.02,function() if IsValid(self) then self:Remove() end end)

	-- Effects
	self:DeathEffects(data)
	util.ScreenShake( data.HitPos, 100, 200, 1, 3000 )
	self:EmitSound( self.TouchSound,self.TouchSoundv,math.random(80,100))
	timer.Simple(0.01,function() if self != NULL then if self.AlreadyPaintedDecal == false then
	self.AlreadyPaintedDecal = true util.Decal(self.Decal, data.HitPos +data.HitNormal, data.HitPos -data.HitNormal) end
	end
  end)
 end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:DeathEffects(data)
	if self.idlesoundc then self.idlesoundc:Stop() end
	local effectdata = EffectData()
	effectdata:SetOrigin(data.HitPos)
	//effectdata:SetScale( 500 )
	util.Effect( "HelicopterMegaBomb", effectdata )
	util.Effect( "ThumperDust", effectdata )
	util.Effect( "Explosion", effectdata )
	util.Effect( "VJ_Small_Explosion1", effectdata )

	self.ExplosionLight1 = ents.Create("light_dynamic")
	self.ExplosionLight1:SetKeyValue("brightness", "4")
	self.ExplosionLight1:SetKeyValue("distance", "300")
	self.ExplosionLight1:SetLocalPos(data.HitPos)
	self.ExplosionLight1:SetLocalAngles(self:GetAngles())
	self.ExplosionLight1:Fire("Color", "255 150 0")
	self.ExplosionLight1:SetParent(self)
	self.ExplosionLight1:Spawn()
	self.ExplosionLight1:Activate()
	self.ExplosionLight1:Fire("TurnOn", "", 0)
	self:DeleteOnRemove(self.ExplosionLight1)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnRemove()
	self.Dead = true
	if self.idlesoundc then self.idlesoundc:Stop() end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2015 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/