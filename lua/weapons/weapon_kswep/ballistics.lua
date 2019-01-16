function SWEP:GetBetterDrag(func,speed)
	local high=self:GetDrag(func,speed+50)
	local low=self:GetDrag(func,speed-50)
	local diff=high-low
	local mod=((speed%100)/100)*diff
	return low+mod
end

local func_g1 = {0.0176,0.0176,
	0.0176, --below 400
	0.0212, -- 400
	0.0249, -- 500
	0.0294, -- 600
	0.0361, -- 700
	0.0473, -- 800
	0.0682, -- 900
	0.1024, --1000
	0.1387, --1100
	0.1663, --1200
	0.1869, --1300
	0.2033, --1400
	0.2169, --1500
	0.2284, --1600
	0.2385, --1700
	0.2473, --1800
	0.2553, --1900
	0.2627, --2000
	0.2697, --2100
	0.2762, --2200
	0.2829, --2300
	0.2894, --2400
	0.2959, --2500
	0.3027, --2600
	0.3097, --2700
	0.3168, --2800
	0.3243, --2900
	0.3321, --3000
	0.3400, --3100
	0.3482, --3200
	0.3568, --3300
	0.3657, --3400
	0.3748, --3500
	0.3841, --3600
	0.3936, --3700
	0.4030, --3800
	0.4125, --3900
	0.4221, --4000
	0.4320, --4100
	0.4418, --4200
	0.4516 --4300 or above
}
function SWEP:GetDrag(func,speed)
	local drag = 0
	if (func~="G1") then func="G1" end --Always use G1 if nothing else, check to make sure it's not any other implemented function first though.
	if (func=="G1") then
		if (speed>4300) then speed=4300 end
		if (speed<100) then speed=100 end
		drag = func_g1[math.floor(speed/100)]
	end
	return drag
end
