repeat task.wait() until game:IsLoaded()

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")

local angle = 1
local radius = 40
local blackHoleActive = Value

local function setupPlayer()
   local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
   local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

   local Folder = Instance.new("Folder", Workspace)
   local Part = Instance.new("Part", Folder)
   local Attachment1 = Instance.new("Attachment", Part)
   Part.Anchored = true
   Part.CanCollide = false
   Part.Transparency = 1

   return humanoidRootPart, Attachment1
end

local humanoidRootPart, Attachment1 = setupPlayer()

if not getgenv().Network then
   getgenv().Network = {
         BaseParts = {},
         Velocity = Vector3.new(14.46262424, 14.46262424, 14.46262424)
   }

   Network.RetainPart = function(part)
         if typeof(part) == "Instance" and part:IsA("BasePart") and part:IsDescendantOf(Workspace) then
            table.insert(Network.BaseParts, part)
            part.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
            part.CanCollide = false
         end
   end

   local function EnablePartControl()
         LocalPlayer.ReplicationFocus = Workspace
         RunService.Heartbeat:Connect(function()
            sethiddenproperty(LocalPlayer, "SimulationRadius", math.huge)
            for _, part in pairs(Network.BaseParts) do
               if part:IsDescendantOf(Workspace) then
                     part.Velocity = Network.Velocity
               end
            end
         end)
   end

   EnablePartControl()
end

local function ForcePart(v)
   if v:IsA("Part") and not v.Anchored and not v.Parent:FindFirstChild("Humanoid") and not v.Parent:FindFirstChild("Head") and v.Name ~= "Handle" then
         for _, x in next, v:GetChildren() do
            if x:IsA("BodyAngularVelocity") or x:IsA("BodyForce") or x:IsA("BodyGyro") or x:IsA("BodyPosition") or x:IsA("BodyThrust") or x:IsA("BodyVelocity") or x:IsA("RocketPropulsion") then
               x:Destroy()
            end
         end
         if v:FindFirstChild("Attachment") then
            v:FindFirstChild("Attachment"):Destroy()
         end
         if v:FindFirstChild("AlignPosition") then
            v:FindFirstChild("AlignPosition"):Destroy()
         end
         if v:FindFirstChild("Torque") then
            v:FindFirstChild("Torque"):Destroy()
         end
         v.CanCollide = false
         
         local Torque = Instance.new("Torque", v)
         Torque.Torque = Vector3.new(1000000, 1000000, 1000000)
         local AlignPosition = Instance.new("AlignPosition", v)
         local Attachment2 = Instance.new("Attachment", v)
         Torque.Attachment0 = Attachment2
         AlignPosition.MaxForce = math.huge
         AlignPosition.MaxVelocity = math.huge
         AlignPosition.Responsiveness = 500
         AlignPosition.Attachment0 = Attachment2
         AlignPosition.Attachment1 = Attachment1
   end
end

local function toggleBlackHole()
   blackHoleActive = not blackHoleActive
   if blackHoleActive then
         for _, v in next, Workspace:GetDescendants() do
            ForcePart(v)
         end

         Workspace.DescendantAdded:Connect(function(v)
            if blackHoleActive then
               ForcePart(v)
            end
         end)

         spawn(function()
            while blackHoleActive and RunService.RenderStepped:Wait() do
               angle = angle + math.rad(2)

               local offsetX = math.cos(angle) * radius
               local offsetZ = math.sin(angle) * radius

               Attachment1.WorldCFrame = humanoidRootPart.CFrame * CFrame.new(offsetX, 0, offsetZ)
            end
         end)
   else
         Attachment1.WorldCFrame = CFrame.new(0, -1000, 0)
   end
end

LocalPlayer.CharacterAdded:Connect(function()
   humanoidRootPart, Attachment1 = setupPlayer()
   if blackHoleActive then
         toggleBlackHole()
   end
end)































local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Starving's Trolling Panel",
   Icon = 119327893820167, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Starving the People of Fun Since 2024",
   LoadingSubtitle = "Developed by ab.ve",
   Theme = "Dark", -- Check https://docs.sirius.menu/rayfield/configuration/themes
 
   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface
 
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "StarvingTP"
   },
 
   KeySystem = false -- Set this to true to use our key system
})

Rayfield:Notify({
   Title = "Starving's Trolling Panel loaded!",
   Content = "Use the menu to start trolling.",
   Duration = 5,
   Image = 119327893820167,
   Actions = {},
})

local MainTab = Window:CreateTab("Main", nil)
local MovementSection = MainTab:CreateSection("Movement")

local WSSlider = MainTab:CreateSlider({
   Name = "Walkspeed",
   Range = {1, 100},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "walkspeedSlider", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (Value)
   end,
})

local ResetWSButton = MainTab:CreateButton({
   Name = "Reset Speed",
   Callback = function()
      WSSlider:Set(16) -- The new slider integer value
   end,
})
























local TeleTab = Window:CreateTab("Teleport", nil)
local TeleConfigSection = TeleTab:CreateSection("Configuration")

--[[local TPTypeDropdown = TeleTab:CreateDropdown({
   Name = "Teleport Type",
   Options = {"To Origin","To Target Position","To Target Player","To Self"},
   CurrentOption = {"To Origin"},
   MultipleOptions = true,
   Flag = "TPtype", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Options)
   -- The function that takes place when the selected option is changed
   -- The variable (Options) is a table of strings for the current selected options
   end,
})    ]]--
local StartBlackHole = TeleTab:CreateToggle({
   Name = "Start Unanchored Teleport",
   CurrentValue = false,
   Flag = "strtBlackHole", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
      if Value then
         toggleBlackHole()
      else
         blackHoleActive = false
      end
   end,
})
local BlackHoleRadiusSlider = TeleTab:CreateSlider({
   Name = "Radius",
   Range = {1, 100},
   Increment = 1,
   Suffix = "Rad",
   CurrentValue = 40,
   Flag = "radSlider", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        radius = Value
   end,
})
local ResetBHButton = TeleTab:CreateButton({
   Name = "Reset Radius",
   Callback = function()
      BlackHoleRadiusSlider:Set(40) -- The new slider integer value
   end,
})

--Rayfield:LoadConfiguration()
