--[[ Do not edit unless you know what your doing. ]]

GM.Name = "Star Wars: The Clone Wars FPS"
GM.Author = "Adam James"
GM.Email = "tehninjamaster@gmail.com"
GM.Website = "lightninggamingrp.net"

function GM:Initialize()

	self.BaseClass.Initialize( self )
	
	
end
//Teams
team.SetUp( 3, "Republic Clone Trooper", Color(100, 0, 255))
team.SetUp( 4, "Cis", Color(255, 255, 255))
team.SetUp( 5, "Republic 501st Clone", Color(0, 2, 255, 255))
team.SetUp( 6, "Republic 212nd Clone", Color(255, 255, 37, 255))
team.SetUp( 7, "Cis Commando", Color(215, 38, 44, 255))
//Models
util.PrecacheModel("models/player/sgg/starwars/clonetrooper.mdl")
util.PrecacheModel("models/player/sgg/starwars/battledroid.mdl")
util.PrecacheModel("models/player/sgg/starwars/clonetrooper_212nd.mdl")
util.PrecacheModel("models/player/sgg/starwars/clonetrooper_501st.mdl")