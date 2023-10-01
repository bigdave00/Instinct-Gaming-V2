-- Thanks for using this script! Check out other free scripts by me on CFX FiveM or my Tebex for paid scripts/support: https://angelicxs.tebex.io/

Config = {}

Config.UseESX = false						-- Use ESX Framework
Config.UseQBCore = true					-- Use QBCore Framework (Ignored if Config.UseESX = true)

Config.UseThirdEye = true				-- If true uses third eye.
Config.ThirdEyeName = 'qb-target' 			-- Name of third eye aplication
Config.Use3DText = true                        -- Use 3D text to interact
Config.NHMenu = false						-- Use NH-Context [https://github.com/whooith/nh-context]
Config.QBMenu = true						-- Use QB-Menu (Ignored if Config.NHInput = true) [https://github.com/qbcore-framework/qb-menu]
Config.OXLib = false						-- Use the OX_lib (Ignored if Config.NHInput or Config.QBInput = true) [https://github.com/overextended/ox_lib] !! must add shared_script '@ox_lib/init.lua' and lua54 'yes' to fxmanifest!!
Config.ElevatorWaitTime = 3					-- How many seconds until the player arrives at their floor

Config.Notify = {
	enabled = true,							-- Display hint notification?
	distance = 3.0,							-- Distance from elevator that the hint will show
	message = "Target the elevator to use"	-- Text of the hint notification
}

--[[
	USAGE
	To add an elevator, copy the table below and configure as needed:
		coords = vector3 coords of center of elevator
		heading = Direction facing out of the elevator
		level = What floor are they going to
		label = What is on that floor
		jobs = OPTIONAL: Table of job keys that are allowed to access that floor and value of minimum grade of each job
		items = OPTIONAL: Any items that are required to access that floor (only requires one of the items listed)
		jobAndItem = OPTIONAL: If true, you must you have a required job AND a required items. If false or nil no items are needed
	
]]

--[[
	ExampleElevator = {	
		{
			coords = vector3(xxx, yyy, zzz), heading = 0.0, level = "Floor 2", label = "Roof",
			jobs = {
				["police"] = 0,
				["ambulance"] = 0,
				["casino"] = 0,
			},
			items = {
				"casino_pass_bronze",
				"casino_pass_silver",
				"casino_pass_gold",
			}
		},
		{
			coords = vector3(xxx, yyy, zzz), heading = 0.0, level = "Floor 1", label = "Penthouse",
			jobs = {
				["police"] = 0,
				["ambulance"] = 0,
				["casino"] = 0,
			},
			items = {
				"casino_pass_gold",
			},
			jobAndItem = true
		},
		{
			coords = vector3(xxx, yyy, zzz), heading = 0.0, level = "Floor 0", label = "Ground"
		},
	},
]]


Config.Elevators = {

	NHSElevator = {	
		{
			coords = vector3(329.926, -602.632, 43.684), heading = 0.0, level = "Floor 5", label = "Office", 
			jobs = {
				["ambulance"] = 0,
			},
		},
		{
			coords = vector3(329.926, -602.632, 43.684), heading = 0.0, level = "Floor 4", label = "Wards", 
			jobs = {
				["ambulance"] = 0,
			},
		},
		{
			coords = vector3(329.926, -602.632, 43.684), heading = 0.0, level = "Floor 3", label = "Wards", 
			jobs = {
				["ambulance"] = 0,
			},
		},
		{
			coords = vector3(-1837.311, -339.769, 58.158), heading = 0.0, level = "Floor 2", label = "Roof Access & Wards",
			jobs = {
				["ambulance"] = 0,
			},
		},
		{
			coords = vector3(-1841.448, -335.658, 53.78), heading = 0.0, level = "Floor 1", label = "Cafe & Wards",
			jobs = {
				["ambulance"] = 0,
			},
		},
		{
			coords = vector3(-1845.0, -342.342, 49.453), heading = 0.0, level = "Floor 0", label = "Main Lobby",
			jobs = {
				["ambulance"] = 0,
			},
		},
	{
		coords = vector3(-1871.826, -309.417, 41.358), heading = 0.0, level = "Floor -2", label = "Garage",
		jobs = {
			["ambulance"] = 0,
		},
	  },
	},

	

}
