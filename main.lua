if not game:IsLoaded() then
    game.Loaded:Wait()
end

local Mercury = loadstring(game:HttpGet("https://raw.githubusercontent.com/Abovescore/Googus/Hack/ui.lua"))()
queueteleport = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)

local TeleportCheck = true
game:GetService("Players").LocalPlayer.OnTeleport:Connect(function(State)
	if TeleportCheck and queueteleport then
		TeleportCheck = false
		queueteleport('loadstring(game:HttpGet("https://raw.githubusercontent.com/Abovescore/Googus/Hack/main.lua"))()')
	end
end)

local GUI = Mercury:Create{
    Name = "Googus Hack",
    Size = UDim2.fromOffset(600, 400),
    Theme = Mercury.Themes.Rust,
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

local UPMTab = GUI:Tab{
	Name = "Unanchored Part Movement",
	Icon = "rbxassetid://128083272851878"
}

UPMTab:Button{
	Name = "Part Ring",
	Description = "Super Ring Parts V6 by Googus",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Abovescore/Googus/Hack/scripts/ringparts.lua"))()
	end
}

UPMTab:Button{
	Name = "Black Hole",
	Description = "Ring parts, but centralized",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Abovescore/Googus/Hack/scripts/blackhole.lua"))()
	end
}
UPMTab:Button{
	Name = "Gravity Gun",
	Description = "Q to pull, E to push, T to reset rotation",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Abovescore/Googus/Hack/scripts/gravitygun.lua"))()
	end
}

-- game-specific tabs
if game.PlaceId == 189707 or game.PlaceId == 7057417395 then -- natural disaster survival, cuando el
		GUI:Notification{
		Title = "Alert",
		Text = "Game detected, Natural Disaster Survival/cuando el! New tab added.",
		Duration = 3,
		Callback = function() end
	}
	
	local NDSTab = GUI:Tab{
		Name = "Natural Disaster Survival",
		Icon = "rbxassetid://121870380815097"
	}

	NDSTab:Button{
		Name = "NDS Black Hole",
		Description = nil,
		Callback = function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/Abovescore/Googus/Hack/scripts/ndsblackhole.lua"))()
		end
	}
end
