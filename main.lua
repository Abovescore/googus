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
    Name = "Infinite Yield Reborn",
    Description = "Massive FE admin script",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RyXeleron/infiniteyield-reborn/refs/heads/master/source"))()
    end
}
 
MainTab:Button{
    Name = "Infinite Yield",
    Description = "Slightly less massive FE admin script",
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
        if player.Character:FindFirstChild("Torso") then
            loadstring(game:HttpGet('https://raw.githubusercontent.com/Szymon-Family/Pablo/Script/scripts/jerk.lua'))()
        else
            loadstring(game:HttpGet('https://raw.githubusercontent.com/Szymon-Family/Pablo/Script/scripts/jerkr15.lua'))()
        end
 
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
if game.PlaceId == 142823291 then -- mm2
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
			-- Loop through all descendants in the Workspace
			for _, descendant in ipairs(workspace:GetDescendants()) do
			    -- Check if the descendant is a Part and has the name "spawn"
			    if descendant:IsA("Part") and descendant.Name == "Spawn" then
			        -- Check if the part is inside a group named 'spawns' in 'lobby'
			        local parent = descendant.Parent
			        if parent and parent.Name == "Spawns" and parent.Parent and parent.Parent.Name == "Lobby" then
			            continue -- Skip this part as it is inside 'spawns' in 'lobby'
			        end
			
			        game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = descendant.CFrame
			        break
			    end
			end

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
