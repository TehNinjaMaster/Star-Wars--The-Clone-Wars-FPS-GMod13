include("shared.lua")
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


ply = LocalPlayer()

concommand.Add( "SWCW_SETTEAM", function()

ply:SetTeam( 3, 4 )

end )

hook.Add("HUDShouldDraw","HUDHide",HUDHide)

function NewHUD()
	local ply = LocalPlayer()
	local HP = ply:Health()
	local Armor = ply:Armor()
	
	draw.RoundedBox( 4, 130, ScrH() - 100, 200, 40, Color( 40, 40, 40 ) )
	draw.RoundedBox( 4, 130, ScrH() - 100, math.Clamp( HP, 0, 200 )*2, 40, Color( 255, 0, 0 ) )
	draw.RoundedBox( 4, 130, ScrH() - 100, math.Clamp( HP, 0, 200 )*2, 15, Color( 255, 255, 255 ) )
end
hook.Add("HUDPant", "SWCWHUD", NewHUD)
//Derma

function STM()
	local changeteam = vgui.Create("DFrame")
	local button = vgui.Create("DButton")
	local team2 = vgui.Create("DButton")
		changeteam:SetPos(ScrW()/2 - 225, ScrH()/2)
		changeteam:SetSize(450, 200)
		changeteam:SetVisible(true)
		changeteam:SetTitle("Change/Select Team")
		changeteam:SetDraggable(false)
		changeteam:ShowCloseButton(true)
		changeteam:MakePopup()
		
		button:SetParent(changeteam)
		button:SetText("Team Republic")
		button:SetPos(5, 30)
		button:SetSize(150, 50)
		button.DoClick = function()
			RunConsoleCommand("sw_setteam1")
	end
		team2:SetParent(changeteam)
		team2:SetText("Team CIS")
		team2:SetPos(5, 70)
		team2:SetSize(150, 50)
		team2.DoClick = function()
			RunConsoleCommand("sw_setteam2")
	end
end
usermessage.Hook("ChangeTeam", STM)