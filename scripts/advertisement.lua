repeat task.wait() until game:IsLoaded()

local function SendChatMessage(message)
    if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
        local textChannel = TextChatService.TextChannels.RBXGeneral
        textChannel:SendAsync(message)
    else
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(message, "All")
    end
end

if game:GetService("Players").LocalPlayer.Name ~= "GoogusHack997" or game:GetService("Players").LocalPlayer.Name ~= "GoogusHack998" or game:GetService("Players").LocalPlayer.Name ~= "GoogusHack999" then
  SendChatMessage("Gᴏᴏɢᴜꜱ Hᴀᴄᴋ™ Oɴ Tᴏᴘ")
  SendChatMessage("ɢɪᴛʜᴜʙ/ᴀʙᴏᴠᴇꜱᴄᴏʀᴇ/ɢᴏᴏɢᴜꜱ")
end
