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

function HUDHide( swcw )
	for k, v in pairs{"CHUDHealth","CHUDBattery","CHUDAmmo","CHUDSeconddaryAmmo"} do
		if swcw == v then return false
		end
	end
end
hook.Add("HUDShouldDraw","HUDHide","HUDAmmo","HUDSeconddaryAmmo",HUDHide)

function GM:HUDPaint()
	self.BaseClass:HUDPaint()
		local ply = LocalPlayer()
		local HP = LocalPlayer():Health()
		local ARM = LocalPlayer():Armor()
		local wep = LocalPlayer():GetActiveWeapon()
	surface.CreateFont( "Font", 
                    {
                    font    = "Century Gothic Bold",
                    size    = 25,
                    weight  = 400,
                    antialias = false,
                    shadow = false
            })
				surface.SetTextColor( 20, 160, 50, 255 )
	surface.SetTextPos(10, 10)
	surface.SetFont( "Font" )
	surface.DrawText( HP ) 
end