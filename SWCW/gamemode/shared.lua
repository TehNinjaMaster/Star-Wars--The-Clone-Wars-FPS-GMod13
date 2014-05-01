GM.Name = "Star Wars: The Clone Wars FPS" // Put Gamemode info here
GM.Author = "Adam James"
GM.Email = "tehninjamaster@gmail.com"
GM.Website = "lightninggamingrp.net"

function GM:Initialize()

	self.BaseClass.Initialize( self )
	
	
end
//Teams
team.SetUp( 3, "Republic", Color(100, 0, 255))
team.SetUp( 4, "Cis", Color(150, 0, 255))
team.SetUp( 5, "Waiting", Color(150, 100, 155))
//Models
util.PrecacheModel("models/player/sgg/starwars/clonetrooper.mdl")
util.PrecacheModel("models/player/sgg/starwars/battledroid.mdl")
util.PrecacheModel("models/alyx.mdl")

//Console Commands

concommand.Add( "SWCW_SETTEAM", function( ply )
    ply:SetTeam( 3, 4 )
end)
