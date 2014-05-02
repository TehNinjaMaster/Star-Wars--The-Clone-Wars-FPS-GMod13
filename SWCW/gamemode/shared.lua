GM.Name = "Star Wars: The Clone Wars FPS"
GM.Author = "Adam James"
GM.Email = "tehninjamaster@gmail.com"
GM.Website = "lightninggamingrp.net"

function GM:Initialize()

	self.BaseClass.Initialize( self )
	
	
end
//Teams
team.SetUp( 3, "Republic", Color(100, 0, 255))
team.SetUp( 4, "Cis", Color(255, 255, 255))
team.SetUp( 5, "Picking Team/Waiting", Color(55, 55, 255))
//Models
util.PrecacheModel("models/player/sgg/starwars/clonetrooper.mdl")
util.PrecacheModel("models/player/sgg/starwars/battledroid.mdl")
util.PrecacheModel("models/alyx.mdl")