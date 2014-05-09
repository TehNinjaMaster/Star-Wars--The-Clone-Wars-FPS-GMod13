include("shared.lua")
--[[ Do not edit anything in this file, unless you know what your doing! ]]

// CL only!
// Tables
Republic = {}
Republic[1] = "models/player/sgg/starwars/clonetrooper.mdl"
Republic[2] = "models/player/sgg/starwars/clonetrooper_212nd.mdl"
Republic[3] = "models/player/sgg/starwars/clonetrooper_327th.mdl"
Republic[4] = "models/player/sgg/starwars/clonetrooper_41st.mdl"
Republic[5] = "models/player/sgg/starwars/clonetrooper_mark2.mdl"

Cis = {}
Cis[1] = "models/player/sgg/starwars/battledroid.mdl"


Team = {}
Team[1] = "Republic"
Team[2] = "Cis"
//Derma

function STM()
	local ply = LocalPlayer()
	local changeteam = vgui.Create("DFrame")
	local button = vgui.Create("DButton")
	local team2 = vgui.Create("DButton")
	local help = vgui.Create("DButton")
	local team3 = vgui.Create("DButton")
	local team4 = vgui.Create("DButton")
		changeteam:SetPos(ScrW()/2 - 255, ScrH()/2)
		changeteam:SetSize(450, 200)
		changeteam:SetVisible(true)
		changeteam:SetTitle("Change/Select Team")
		changeteam:SetDraggable(false)
		changeteam:ShowCloseButton(true)
		changeteam:MakePopup()
		
		button:SetParent(changeteam)
		button:SetText("Clone Trooper")
		button:SetPos(5, 30)
		button:SetSize(150, 50)
		button.DoClick = function()
			RunConsoleCommand("sw_setteam1")
	end
		team2:SetParent(changeteam)
		team2:SetText("Battle droid")
		team2:SetPos(5, 70)
		team2:SetSize(150, 50)
		team2.DoClick = function()
			RunConsoleCommand("sw_setteam2")
	end
		help:SetParent(changeteam)
		help:SetText("Help/Rules")
		help:SetPos(5, 110)
		help:SetSize(150, 50)
		help.DoClick = function()
			ply:ConCommand ("ulx motd")
	end
	team3:SetParent(changeteam)
	team3:SetText("Republic 212nd")
	team3:SetPos(150, 30)
	team3:SetSize(150, 50)
	team3.DoClick = function()
		if ply:IsSuperAdmin() or ply:IsAdmin() then RunConsoleCommand("sw_setteam3")
		else
		chat.AddText(Color(0, 120, 150), "[Server] ", Color(255, 255, 255), "Sorry! Admins only! ")
		end
	end
	team4:SetParent(changeteam)
	team4:SetText("Republic 501st")
	team4:SetPos(150, 70)
	team4:SetSize(150, 50)
	team4.DoClick = function()
		if ply:IsSuperAdmin() or ply:IsAdmin() then RunConsoleCommand("sw_setteam4")
		else
		chat.AddText(Color(0, 120, 150), "[Server] ", Color(255, 255, 255), "Sorry! Admins only! ")
		end
	end
end
usermessage.Hook("ChangeTeam", STM)
function hidehud(name) -- Removing the default HUD
	for k, v in pairs({"CHudHealth", "CHudBattery", "CHudAmmo", "CHudSecondaryAmmo", })do
		if name == v then return false end
	end
end

hook.Add("HUDShouldDraw", "HideOurHud:D", hidehud)

function NewHUD()
	local ply = LocalPlayer()
	local HP = ply:Health()
	local Arm = ply:Armor()
	local Wep = ply:GetActiveWeapon():Clip1()
	// HP
	draw.RoundedBox(4, 130, ScrH() - 100, 200, 40, Color(40, 40, 40, 120) )
	draw.RoundedBox(4, 130, ScrH() - 100, math.Clamp(HP, 0, 100)*2, 40, Color(0, 255, 255, 255) )
	draw.RoundedBox(4, 130, ScrH() - 100, math.Clamp(HP, 0, 100)*2, 15, Color(255, 255, 255, 40) )
	// Armor
	draw.RoundedBox(5, 130, ScrH() - 150, 250, 40, Color(40, 40, 40, 120) )
	draw.RoundedBox(5, 130, ScrH() - 150, math.Clamp(Arm, 0, 50)*2, 40, Color(80, 107, 57, 255) )
	draw.RoundedBox(5, 130, ScrH() - 150, math.Clamp(Arm, 0, 50)*2, 15, Color(255, 255, 255, 40) )
	// Ammo, and Weapon
	draw.RoundedBox(4, 130, ScrH() - 200, 300, 50, Color(40, 40, 40, 120) )
	draw.RoundedBox(4, 130, ScrH() - 200, math.Clamp(Wep, 0, 10)*2, 40, Color(80, 0, 57, 255) )
	draw.RoundedBox(4, 130, ScrH() - 200, math.Clamp(Wep, 0, 10)*2, 15, Color(255, 255, 255, 40) )
end
hook.Add("HUDPaint", "NewHUD", NewHUD)

function printonspawn()
	chat.AddText(Color(0, 120, 150), "[Server] ", Color(255, 255, 255), "Welcome to the server! Enjoy your stay!")
end

usermessage.Hook("printonspawn", printonspawn)