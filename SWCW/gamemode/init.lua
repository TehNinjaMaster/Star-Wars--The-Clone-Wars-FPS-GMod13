// Made by Adam James
// ALPHA BUILD: 0.31
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")
include("player.lua")

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

function GM:PlayerInitialSpawn( ply )
	ply:SetGravity(1)
	ply:SetWalkSpeed(300)
	ply:SetRunSpeed( 500 )
	ply:SetArmor(20)
	ply:SetHealth(100)
	ply:SetTeam(5)
end

function GM:PlayerSpawn( ply )
	if ply:Team()== 3 then
		ply:Give("weapon_752_dc15s")
		ply:Give("weapon_752_dc15a")
		ply:SetModel("models/player/sgg/starwars/clonetrooper.mdl")
	end
	if ply:Team()== 4 then
		ply:Give("weapon_752_e5")
		ply:SetModel("models/player/sgg/starwars/battledroid.mdl")
	end
	if ply:Team()== 5 then
		ply:SetHealth(500)
		ply:SetModel("models/alyx.mdl")
		ply:SetGravity(0)
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
end

//DPanel
function GM:ShowSpare2(ply)
	umsg.Start("ChangeTeam", ply)
	umsg.End()
end
///////////////////////////////
/////// Inequality's///////////
///////////////////////////////
function ES( ply )
local ES = math.random(3, 4)
	if ES == 3 then
	ply:SetTeam( 3 )
	elseif ES == 4 then
	ply:SetTeam( 4 )
end

function SPAWN( ply )
Republic = team.NumPlayers( 3 )
Cis = team.NumPlayers( 4 )
	if Republic > Cis then
		ply:SetTeam( 4 )
	elseif Cis > Republic then
		ply:SetTeam( 3 )
	end
end
end