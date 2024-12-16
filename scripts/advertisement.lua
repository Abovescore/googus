repeat task.wait() until game:IsLoaded()

local Players = game:GetService("Players")
local TextChatService = game:GetService("TextChatService")

local TextChatService = game:GetService("TextChatService")

local function SendChatMessage(message)
    -- Check if the message is valid
    if typeof(message) ~= "string" or message == "" then
        warn("Invalid message. It must be a non-empty string.")
        return
    end

    -- Check if TextChatService exists and is using the new chat version
    if TextChatService and TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
        local textChannel = TextChatService:FindFirstChild("TextChannels") and TextChatService.TextChannels:FindFirstChild("RBXGeneral")
        
        if textChannel then
            textChannel:SendAsync(message)
        else
            warn("Text channel 'RBXGeneral' not found.")
        end
    else
        -- Fallback to the legacy chat system
        local replicatedStorage = game:GetService("ReplicatedStorage")
        local chatEvents = replicatedStorage:FindFirstChild("DefaultChatSystemChatEvents")
        
        if chatEvents and chatEvents:FindFirstChild("SayMessageRequest") then
            chatEvents.SayMessageRequest:FireServer(message, "All")
        else
            warn("Legacy chat system not found.")
        end
    end
end

if Players.LocalPlayer.Name ~= "GoogusHack997" or Players.LocalPlayer.Name ~= "GoogusHack998" or Players.LocalPlayer.Name ~= "GoogusHack999" then
  SendChatMessage("Gᴏᴏɢᴜꜱ Hᴀᴄᴋ™ Oɴ Tᴏᴘ")
  SendChatMessage("ɢɪᴛʜᴜʙ/ᴀʙᴏᴠᴇꜱᴄᴏʀᴇ/ɢᴏᴏɢᴜꜱ")
end
