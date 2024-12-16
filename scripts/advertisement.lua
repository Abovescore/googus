repeat task.wait() until game:IsLoaded()

local Players = game:GetService("Players")
local TextChatService = game:GetService("TextChatService")

local function SendChatMessage(message)
    local player = Players.LocalPlayer
    if player and player.Name:lower():sub(1, 10) == "googushack" then return end

    if typeof(message) ~= "string" or message == "" then
        warn("dude you left the function empty")
        return
    end

    if TextChatService and TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
        local textChannel = TextChatService:FindFirstChild("TextChannels") and TextChatService.TextChannels:FindFirstChild("RBXGeneral")
        
        if textChannel then
            textChannel:SendAsync(message)
        end
    else
        local replicatedStorage = game:GetService("ReplicatedStorage")
        local chatEvents = replicatedStorage:FindFirstChild("DefaultChatSystemChatEvents")
        
        if chatEvents and chatEvents:FindFirstChild("SayMessageRequest") then
            chatEvents.SayMessageRequest:FireServer(message, "All")
        end
    end
end

if Players.LocalPlayer.Name ~= "GoogusHack997" or Players.LocalPlayer.Name ~= "GoogusHack998" or Players.LocalPlayer.Name ~= "GoogusHack999" then
  SendChatMessage("ɢᴏᴏɢᴜsʜᴀᴄᴋ™ ᴏɴ ᴛᴏᴘ")
  task.wait()
  SendChatMessage("ɢɪᴛ ∕ ᴀʙᴏᴠᴇsᴄᴏʀᴇ ∕ ɢᴏᴏɢᴜs")
end
