if not game:IsLoaded() then
    game.Loaded:Wait()
end

local Mercury = loadstring(game:HttpGet("https://raw.githubusercontent.com/Abovescore/Googus/Hack/ui.lua"))()
local ad = loadstring(game:HttpGet("https://raw.githubusercontent.com/Abovescore/Googus/Hack/scripts/advertisement.lua"))()
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

local CharTab = GUI:Tab{
	Name = "Character",
	Icon = "rbxassetid://125118458229117"
}

CharTab:Button{
    Name = "Jork Animation",
    Description = "Straight up jorking it. And by it...",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Szymon-Family/Pablo/Script/scripts/jerk.lua'))()
 
        GUI:Notification{
            Title = "Success",
            Text = "Jerk animation has been added to your inventory!",
            Duration = 3,
            Callback = function() end
        }
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
	Name = "Attach To Part",
	Description = "CTRL + Click. Use noclip",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Abovescore/Googus/Hack/scripts/attachtopart.lua"))()
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
if game.PlaceId == 142823291 then -- natural disaster survival, cuando el
		GUI:Notification{
		Title = "Alert",
		Text = "Game detected, Murder Mystery 2! New tab added.",
		Duration = 3,
		Callback = function() end
	}
	
	local MMTab = GUI:Tab{
		Name = "Natural Disaster Survival",
		Icon = "rbxassetid://112377979096530"
	}

	MMTab:Button{
		Name = "Return To Map",
		Description = nil,
		Callback = function()
			game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position = Vector3.new(-876, 17, -1954)
		end
	}
end
