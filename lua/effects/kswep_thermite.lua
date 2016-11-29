function EFFECT:Init(data)
	local pos = data:GetOrigin()
	local emitter = ParticleEmitter(pos)
	local vel=Vector(math.Rand(-0.2,0.2),math.Rand(-0.2,0.2),math.Rand(1,2))
	local smokesprnum=math.random(1,16)
	local smokespr="particle/smokesprites_00"
	if (smokesprnum>9) then
		smokespr=smokespr..smokesprnum
	else
		smokespr=smokespr.."0"..smokesprnum
	end
		
	local particle=emitter:Add(smokespr,pos)
	particle:SetVelocity(vel*math.Rand(10,100))
	particle:SetDieTime(math.Rand(3,8))
	particle:SetEndAlpha(0)
	particle:SetStartAlpha(math.Rand(200,255))
	particle:SetEndSize(math.Rand(80,100))
	particle:SetStartSize(math.Rand(4,5))
	particle:SetRoll(math.Rand(0,360))
	particle:SetRollDelta(math.Rand(-0.2,0.2))
	particle:SetColor(230,230,230)
	particle:SetAirResistance(10)
	emitter:Finish()
end
function EFFECT:Think()
	return false
end
function EFFECT:Render()
end
