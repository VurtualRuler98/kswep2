if (SERVER) then
	AddCSLuaFile()
	

end





function FiremodeBindingMinus(ply)
	ply.vurtualkeys_firemode=false
end
function FiremodeBinding(ply)
	if (ply.vurtualkeys_firemode==true) then return end
	ply.vurtualkeys_firemode=true
	if (SERVER) then FiremodeSwap(nil,ply) else
	net.Start("FiremodeBinding")
	net.SendToServer()
	end
end


function FiremodeSwap(len,ply)
	if (IsValid(ply) and ply:IsPlayer()) then
	local plyweapon = ply:GetActiveWeapon()
	if (plyweapon.vurtualkeys_firemode!=true) then return end
	plyweapon:SwitchFiremode()
	end
end

function RaiseWeaponMinus(ply)
	ply.vurtualkeys_trw=false
end

function RaiseWeapon(ply)
	if (ply.vurtualkeys_trw==true) then return end
	ply.vurtualkeys_trw=true
	if (SERVER) then ToggleRaiseWeapon(nil,ply) else
	net.Start("RaiseWeapon")
	net.SendToServer()
	end
end


function ToggleRaiseWeapon(len,ply)
	if (IsValid(ply) and ply:IsPlayer()) then
	local plyweapon = ply:GetActiveWeapon()
	if (plyweapon.vurtualkeys_firemode!=true) then return end
	plyweapon:ToggleZoom()
	end
end
function AimWeaponMinus(ply)
	ply.vurtualkeys_aim=false
end

function AimWeapon(ply)
	if (ply.vurtualkeys_aim==true) then return end
	ply.vurtualkeys_aim=true
	if (SERVER) then ToggleAimWeapon(nil,ply) else
	net.Start("AimWeapon")
	net.SendToServer()
	end
end


function ToggleAimWeapon(len,ply)
	if (IsValid(ply) and ply:IsPlayer()) then
	local plyweapon = ply:GetActiveWeapon()
	if (plyweapon.vurtualkeys_firemode!=true) then return end
	plyweapon:ToggleAim()
	end
end

if (SERVER) then
util.AddNetworkString("FiremodeBinding")
util.AddNetworkString("RaiseWeapon")
util.AddNetworkString("AimWeapon")
net.Receive("FiremodeBinding", FiremodeSwap)
net.Receive("RaiseWeapon", ToggleRaiseWeapon)
net.Receive("AimWeapon", ToggleAimWeapon)
end

concommand.Add("+RaiseWeapon",RaiseWeapon)
concommand.Add("-RaiseWeapon",RaiseWeaponMinus)
concommand.Add("+Firemode", FiremodeBinding)
concommand.Add("-Firemode",FiremodeBindingMinus)
concommand.Add("+AimWeapon",AimWeapon)
concommand.Add("-AimWeapon",AimWeaponMinus)
