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
	Description = "Universal admin script",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
	end
}

MainTab:Button{
	Name = "Dex",
	Description = "Roblox Studio; In-game",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Abovescore/Googus/refs/heads/Hack/scripts/dex.lua"))()
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
            Text = "Jork animation has been added to your inventory!",
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
		Name = "Murder Mystery 2",
		Icon = "rbxassetid://112377979096530"
	}

	MMTab:Button{
		Name = "Goto Map",
		Description = nil,
		Callback = function()
			game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = CFrame.new(-1251.58972, 333.494904, 138.813095, -0.888008058, 0.260545313, -0.378890306, -1.88423819e-08, 0.823982775, 0.566614866, 0.45982793, 0.503158569, -0.731703341)
		end
	}
	MMTab:Button{
		Name = "Goto Spawn",
		Description = nil,
		Callback = function()
			game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = CFrame.new(-65.3378983, 138.319153, 16.4226093, -0.026591368, -8.67318301e-11, 0.999646366, 8.65240111e-08, 1, 2.38836817e-09, -0.999646366, 8.65569234e-08, -0.026591368)
		end
	}
end
