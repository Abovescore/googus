if not game:IsLoaded() then
    game.Loaded:Wait()
end

loadstring(game:HttpGet("https://raw.githubusercontent.com/Abovescore/Googus/Hack/scripts/advertisement.lua"))()
local GoogusUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Abovescore/Googus/Hack/ui.lua"))()

--[[ local Players = game:GetService("Players")

queueteleport = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)

local TeleportCheck = false
Players.LocalPlayer.OnTeleport:Connect(function(State)
	if (not TeleportCheck) and queueteleport then
		TeleportCheck = true
		queueteleport('loadstring(game:HttpGet("https://raw.githubusercontent.com/Abovescore/Googus/Hack/main.lua"))()')
	end
end) ]]--

local GUI = GoogusUI:Create{
    Name = "Googus Hack",
    Size = UDim2.fromOffset(600, 400),
    Theme = GoogusUI.Themes.Rust,
    Link = "https://github.com/Abovescore/Googus"
}

local MainTab = GUI:Tab{
	Name = "Main",
	Icon = "rbxassetid://91171486133065"
}

MainTab:Button{
	Name = "Infinite Yield",
	Description = nil,
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
	end
}

-- game-specific tabs
if game.PlaceId == 189707 or game.PlaceId == 7057417395 then -- natural disaster survival, cuando el
		GUI:Notification{
		Title = "Alert",
		Text = "Game detected, NDS! New tab added.",
		Duration = 3,
		Callback = function() end
	}
	
	local NDSTab = GUI:Tab{
		Name = "NDS",
		Icon = "rbxassetid://121870380815097"
	}

	NDSTab:Button{
		Name = "Black Hole",
		Description = nil,
		Callback = function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/Abovescore/Googus/Hack/scripts/blackhole.lua"))()
		end
	}
	
	NDSTab:Button{
		Name = "Ring Parts",
		Description = nil,
		Callback = function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/Abovescore/Googus/Hack/scripts/ringparts.lua"))()
		end
	}
end
