---------------------------------------------------------------------------------------------
-- More detailed description of each config option can be found in 'docs/config.md' file.
---------------------------------------------------------------------------------------------

ac = {
	-- Language for the UI
	locale = 'en',

	-- Whether to check for newer resource version and notify in server console.
	versionCheck = true,

	-- Server name shown in the scoreboard header.
	serverName = 'Instinct Gaming',

	-- Command name to open the scoreboard UI.
	commandName = 'scoreboard',

	-- Default keybind for the '/scoreboard' command.
	commandKey = 'F6',

	-- Which parts of the scoreboard should be visible (both, groups, players).
	visibleParts = 'both',

	-- On which side of the screen the scoreboard should be (left, right).
	drawerSide = 'right',

	-- Group list shown in the scoreboard.
	groupList = {
		{
			label = 'MET',
			groups = {'police'},
		},
		{
			label = 'NHS',
			groups = {'ambulance'},
			separator = true
		},
		{
			label = 'Lawyers & Judges',
			groups = {'justice'},
		},
	}
}
