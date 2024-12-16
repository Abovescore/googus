if not game:IsLoaded() then
    game.Loaded:Wait()
end

local Mercury = loadstring(game:HttpGet("https://raw.githubusercontent.com/deeeity/mercury-lib/master/src.lua"))()

local GUI = Mercury:Create{
    Name = "Starving's Trolling Panel",
    Size = UDim2.fromOffset(600, 400),
    Theme = Mercury.Themes.Rust,
    Link = "https://github.com/Abovescore/StarvingsTrollingHub"
}

local MainTab = GUI:Tab{
	Name = "Main",
	Icon = "rbxassetid://74000494301350"
}

MainTab:Button{
	Name = "Infinite Yield",
	Description = nil,
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
	end
}

-- game-specific tabs
if game.PlaceId == 189707 then -- natural disaster survival
		GUI:Notification{
		Title = "Alert",
		Text = "Game detected, NDS! New tab added.",
		Duration = 3,
		Callback = function() end
	}
	
	local NDSTab = GUI:Tab{
		Name = "NDS",
		Icon = "rbxassetid://72577903576221"
	}

	NDSTab:Button{
		Name = "Black Hole",
		Description = nil,
		Callback = function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/Abovescore/StarvingsTrollingPanel/main/scripts/blackhole.lua"))()
		end
	}
	
	NDSTab:Button{
		Name = "Ring Parts",
		Description = nil,
		Callback = function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/Abovescore/StarvingsTrollingPanel/main/scripts/ringparts.lua"))()
		end
	}
end
