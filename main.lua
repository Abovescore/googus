if not game:IsLoaded() then
    game.Loaded:Wait()
end

loadstring(game:HttpGet("https://raw.githubusercontent.com/Abovescore/Googus/Hack/scripts/advertisement.lua"))()
local GoogusUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Abovescore/Googus/Hack/ui.lua"))()

local Players = game:GetService("Players")

sethidden = sethiddenproperty or set_hidden_property or set_hidden_prop
gethidden = gethiddenproperty or get_hidden_property or get_hidden_prop
queueteleport = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)
httprequest = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
PlaceId, JobId = game.PlaceId, game.JobId
local IsOnMobile = table.find({Enum.Platform.IOS, Enum.Platform.Android}, UserInputService:GetPlatform())
everyClipboard = setclipboard or toclipboard or set_clipboard or (Clipboard and Clipboard.set)
isLegacyChat = TextChatService.ChatVersion == Enum.ChatVersion.LegacyChatService

local KeepGoogus = true
local TeleportCheck = false
Players.LocalPlayer.OnTeleport:Connect(function(State)
	if KeepGoogus and (not TeleportCheck) and queueteleport then
		TeleportCheck = true
		queueteleport('loadstring(game:HttpGet("https://raw.githubusercontent.com/Abovescore/Googus/Hack/main.lua"))()')
	end
end)

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

if IsOnMobile then
	GUI:Prompt{
		Followup = false,
		Title = "Mobile Compatibility",
		Text = "Googus Hack is a PC-focused script. To increase mobile compatibility, would you like to run an on-screen keyboard script?",
		Buttons = {
			ok = function()
				return true
			end,
			no = function()
				return false
			end
		}
	}
end

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
