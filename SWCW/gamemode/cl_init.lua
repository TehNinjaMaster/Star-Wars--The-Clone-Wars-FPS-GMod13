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