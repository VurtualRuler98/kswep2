function EFFECT:Init(data)
	local pos = data:GetOrigin()
	local emitter = ParticleEmitter(pos)
	local color = data:GetStart()
	local smokesprnum=math.random(1,16)
	local smokespr="particle/smokesprites_00"
	if (smokesprnum>9) then
		smokespr=smokespr..smokesprnum
	else
		smokespr=smokespr.."0"..smokesprnum
	end
	for i=1,20 do	
		local particle=emitter:Add(smokespr,pos)
		particle:SetVelocity(Vector(math.Rand(-1,1),math.Rand(-1,1),math.Rand(-1,1))*math.Rand(150,200))
		particle:SetDieTime(math.Rand(3,8))
		particle:SetEndAlpha(0)
		particle:SetCollide(true)
		particle:SetDieTime(10)
		particle:SetStartAlpha(math.Rand(200,255))
		particle:SetEndSize(math.Rand(200,300))
		particle:SetStartSize(math.Rand(100,150))
		particle:SetRoll(math.Rand(0,360))
		particle:SetRollDelta(math.Rand(-0.2,0.2))
		particle:SetColor(color.r,color.g,color.b)
		particle:SetGravity(Vector(0,0,math.Rand(1,10)))
		particle:SetAirResistance(100)
	end
	emitter:Finish()
end
function EFFECT:Think()
	return false
end
function EFFECT:Render()
end
