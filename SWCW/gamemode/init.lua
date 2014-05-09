--[[ Made by Adam James
ALPHA BUILD: 1.00 ]]
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")
include("player.lua")
// I did NOT make the player connect!
function GM:PlayerConnect( name, ip )
	print("Player: " .. name .. ", has joined the game.")
end

function GM:PlayerInitialSpawn( ply )
	print("Player: " .. ply:Nick() .. ", has spawned.")
	
	ply:SetGamemodeTeam( 0 )
end

function GM:PlayerAuthed( ply, steamID, uniqueID )
	print("Player: " .. ply:Nick() .. ", has connected and is sending client info.")
end
// All below made by me.
function GM:PlayerInitialSpawn( ply ) // Main spawn
	ply:SetGravity(1)
	ply:SetWalkSpeed(300)
	ply:SetRunSpeed( 500 )
	ply:SetArmor(20)
	ply:SetHealth(100)
	ply:Give("weapon_physgun")
	ply:SetTeam(3,4) function ES(ply)
		math.Rand(1,2)
		if ES== 1 then
			ply:SetTeam(3)
		elseif ES== 2 then
			ply:SetTeam(4)
		end
	end
end

function GM:PlayerSpawn( ply ) // Team Spawn
	if ply:Team()== 3 then
		ply:Give("weapon_752_dc15s")
		ply:Give("weapon_752_dc17")
		ply:SetModel("models/player/sgg/starwars/clonetrooper.mdl")
	end
	if ply:Team()== 4 then
		ply:Give("weapon_752_e5")
		ply:Give("weapon_752_e11")
		ply:Give("weapon_752_ee3")
		ply:SetModel("models/player/sgg/starwars/battledroid.mdl")
	end
	if ply:Team()== 5 then
		ply:Give("weapon_752_dc15s")
		ply:Give("weapon_752_dc17")
		ply:Give("weapon_752_dc15a")
		ply:SetModel("models/player/sgg/starwars/clonetrooper_212nd.mdl")
	end
	if ply:Team()== 6 then
		ply:Give("weapon_752_dc15s")
		ply:Give("weapon_752_dc17")
		ply:Give("weapon_752_dc15a")
		ply:SetModel("models/player/sgg/starwars/clonetrooper_501st.mdl")
	end
	concommand.Add( "sw_setteam1",function( ply )
    ply:SetTeam( 3 )
	ply:Kill()
    print( "Team Changed!" )
end )

	concommand.Add( "sw_setteam2",function( ply )
    ply:SetTeam( 4 )
	ply:Kill()
    print( "Team Changed!" )
end )
	concommand.Add( "sw_setteam3",function( ply )
    ply:SetTeam( 5 )
	ply:Kill()
    print( "Team Changed!" )
end )
	concommand.Add( "sw_setteam4",function( ply )
    ply:SetTeam( 6 )
	ply:Kill()
    print( "Team Changed!" )
end )

	concommand.Add( "sw_help",function(ply)
		RunConsoleCommand("ulx", "motd")
	end )
end

//DPanel
function GM:ShowSpare2(ply)
	umsg.Start("ChangeTeam", ply)
	umsg.End()
end

hook.Add("Help", "!help", function(ply, text)
	text = string.lower(text)
	if ( string.sub( text, 1, 5 ) == "!help" ) then
		ply:ConCommand ("ulx motd")
	end
end )
function random()
	umsg.Start("Admins Only")
	umsg.End()
end 

function printonspawn()
	umsg.Start("Print on Spawn")
	umsg.End()
end