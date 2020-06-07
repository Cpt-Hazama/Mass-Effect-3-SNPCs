include('shared.lua')

language.Add("obj_vj_me3_missile", "Rocket")
killicon.Add("obj_vj_me3_missile","HUD/killicons/default",Color(255,80,0,255))

language.Add("#obj_vj_me3_missile", "Rocket")
killicon.Add("#obj_vj_me3_missile","HUD/killicons/default",Color(255,80,0,255))

function ENT:Draw()
	self.Entity:DrawModel()
end

function ENT:Think()
	if self:IsValid() then
		self.Emitter = ParticleEmitter(self:GetPos())
		self.SmokeEffect1 = self.Emitter:Add("particles/flamelet2",self:GetPos() +self:GetForward()*-7)
		self.SmokeEffect1:SetVelocity(self:GetForward() *math.Rand(0, -50) +Vector(math.Rand(5, -5), math.Rand(5, -5), math.Rand(5, -5)) +self:GetVelocity())
		self.SmokeEffect1:SetDieTime(0.3)
		self.SmokeEffect1:SetStartAlpha(100)
		self.SmokeEffect1:SetEndAlpha(0)
		self.SmokeEffect1:SetStartSize(10)
		self.SmokeEffect1:SetEndSize(1)
		self.SmokeEffect1:SetRoll(math.Rand(-0.2,0.2))
		self.SmokeEffect1:SetAirResistance(200)
		self.Emitter:Finish()
	end
end