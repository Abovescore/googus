local Mercury = loadstring(game:HttpGet("https://raw.githubusercontent.com/deeeity/mercury-lib/master/src.lua"))()

local GUI = Mercury:Create{
    Name = "Starving's Trolling Panel",
    Size = UDim2.fromOffset(600, 400),
    Theme = Mercury.Themes.Dark,
    Link = "https://github.com/Abovescore/StarvingsTrollingHub"
}

local MainTab = GUI:Tab{
	Name = "Main",
	Icon = "rbxassetid://74000494301350"
}

MainTab:InfYiff{
	Name = "Infinite Yield",
	Description = nil,
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
	end
}
