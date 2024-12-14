repeat task.wait() until game:IsLoaded()

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")

local angle = 1
local radius = 40
local blackHoleActive = Value

local blackHoleMode = "To Origin"

local originPart = Instance.new('Part', workspace)
originPart.Anchored = true
originPart.Position = Vector3.new(0, 0, 0)
originPart.CanCollide = false
originPart.CanTouch = false
originPart.CanQuery = false
originPart.Transparency = 1

local targetPart = Instance.new('Part', workspace)
targetPart.Anchored = true
targetPart.Position = Vector3.new(0, 0, 0)
targetPart.Scale = Vector3.new(4, 4, 4)
targetPart.Shape = Enum.PartType.Ball
targetPart.BrickColor = BrickColor.Red()
targetPart.Material = Enum.Material.Neon
targetPart.CanCollide = false
targetPart.CanTouch = false
targetPart.CanQuery = false
targetPart.Transparency = 1
local targetHighlight = Instance.new('Highlight', targetPart)

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
               if blackHoleMode == "To Origin" then
                  Attachment1.WorldCFrame = originPart.CFrame
               elseif blackHoleMode == "To Target Position" then
                  Attachment1.WorldCFrame = targetPart.CFrame
               elseif blackHoleMode == "To Self" then
                  angle = angle + math.rad(2)

                  local offsetX = math.cos(angle) * radius
                  local offsetZ = math.sin(angle) * radius

                  Attachment1.WorldCFrame = humanoidRootPart.CFrame * CFrame.new(offsetX, 0, offsetZ)
               end
            end
         end)
   else
         Attachment1.WorldCFrame = CFrame.new(0, -1000, 0)
   end
end










local function getPlayerName(str)
	local newstr = str:lower() -- Removes case sensitivity

	for _, player in ipairs(Players:GetPlayers()) do
		if player.Name:lower():sub(1, #newstr) == newstr then
			return player.Name
		end
	end
	return nil
end















local FLYING = false
local QEfly = true
local iyflyspeed = 1
local vehicleflyspeed = 1
function sFLY(vfly)
	repeat task.wait() until Players.LocalPlayer and Players.LocalPlayer.Character and getRoot(Players.LocalPlayer.Character) and Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
	repeat task.wait() until IYMouse
	if flyKeyDown or flyKeyUp then flyKeyDown:Disconnect() flyKeyUp:Disconnect() end

	local T = getRoot(Players.LocalPlayer.Character)
	local CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
	local lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
	local SPEED = 0

	local function FLY()
		FLYING = true
		local BG = Instance.new('BodyGyro')
		local BV = Instance.new('BodyVelocity')
		BG.P = 9e4
		BG.Parent = T
		BV.Parent = T
		BG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
		BG.cframe = T.CFrame
		BV.velocity = Vector3.new(0, 0, 0)
		BV.maxForce = Vector3.new(9e9, 9e9, 9e9)
		task.spawn(function()
			repeat task.wait()
				if not vfly and Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
					Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = true
				end
				if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0 then
					SPEED = 50
				elseif not (CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0) and SPEED ~= 0 then
					SPEED = 0
				end
				if (CONTROL.L + CONTROL.R) ~= 0 or (CONTROL.F + CONTROL.B) ~= 0 or (CONTROL.Q + CONTROL.E) ~= 0 then
					BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (CONTROL.F + CONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(CONTROL.L + CONTROL.R, (CONTROL.F + CONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
					lCONTROL = {F = CONTROL.F, B = CONTROL.B, L = CONTROL.L, R = CONTROL.R}
				elseif (CONTROL.L + CONTROL.R) == 0 and (CONTROL.F + CONTROL.B) == 0 and (CONTROL.Q + CONTROL.E) == 0 and SPEED ~= 0 then
					BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (lCONTROL.F + lCONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(lCONTROL.L + lCONTROL.R, (lCONTROL.F + lCONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
				else
					BV.velocity = Vector3.new(0, 0, 0)
				end
				BG.cframe = workspace.CurrentCamera.CoordinateFrame
			until not FLYING
			CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
			lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
			SPEED = 0
			BG:Destroy()
			BV:Destroy()
			if Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
				Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
			end
		end)
	end
	flyKeyDown = IYMouse.KeyDown:Connect(function(KEY)
		if KEY:lower() == 'w' then
			CONTROL.F = (vfly and vehicleflyspeed or iyflyspeed)
		elseif KEY:lower() == 's' then
			CONTROL.B = - (vfly and vehicleflyspeed or iyflyspeed)
		elseif KEY:lower() == 'a' then
			CONTROL.L = - (vfly and vehicleflyspeed or iyflyspeed)
		elseif KEY:lower() == 'd' then 
			CONTROL.R = (vfly and vehicleflyspeed or iyflyspeed)
		elseif QEfly and KEY:lower() == 'e' then
			CONTROL.Q = (vfly and vehicleflyspeed or iyflyspeed)*2
		elseif QEfly and KEY:lower() == 'q' then
			CONTROL.E = -(vfly and vehicleflyspeed or iyflyspeed)*2
		end
		pcall(function() workspace.CurrentCamera.CameraType = Enum.CameraType.Track end)
	end)
	flyKeyUp = IYMouse.KeyUp:Connect(function(KEY)
		if KEY:lower() == 'w' then
			CONTROL.F = 0
		elseif KEY:lower() == 's' then
			CONTROL.B = 0
		elseif KEY:lower() == 'a' then
			CONTROL.L = 0
		elseif KEY:lower() == 'd' then
			CONTROL.R = 0
		elseif KEY:lower() == 'e' then
			CONTROL.Q = 0
		elseif KEY:lower() == 'q' then
			CONTROL.E = 0
		end
	end)
	FLY()
end























local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Starving's Trolling Panel",
   Icon = 119327893820167, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Starving the People of Fun Since 2024",
   LoadingSubtitle = "Developed by ab.ve",
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes
 
   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface
 
   ConfigurationSaving = {
      Enabled = false,
      FolderName = "StarvingFolder", -- Create a custom folder for your hub/game
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

local MainTab = Window:CreateTab("Movement", nil)
local MovementSection = MainTab:CreateSection("Values")

local FlyToggle = MainTab:CreateToggle({
   Name = "Flight",
   CurrentValue = true,
   Flag = "flying", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
   if Value then
      NOFLY()
		task.wait()
		sFLY()
   else
      NOFLY()
   end,
})

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
      WSSlider:Set(40) -- The new slider integer value
   end,
})
























local TeleTab = Window:CreateTab("Teleport", nil)
   
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

      while Value do
         if Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").Sit then
	      	Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").Sit = false
         end
      end
   end,
})

local TeleConfigSection = TeleTab:CreateSection("Configuration")

local TPTypeDropdown = TeleTab:CreateDropdown({
   Name = "Teleport Type",
   Options = {"To Origin","To Target Position",--[["To Target Player",]]"To Self"},
   CurrentOption = {"To Origin"},
   MultipleOptions = true,
   Flag = "TPtype", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Options)
      blackHoleMode = Options
      if Options not "To Target Position" then
         targetPart.Transparency = 1
      end
   end,
})

local Button = TeleTab:CreateButton({
   Name = "Set Target Position",
   Callback = function()
      if DropdownName.CurrentOption == "To Target Position" then
            if targetPart.Transparency = 1 then
               targetPart.Transparency = 0
            end
         targetPart.CFrame = Players.LocalPlayer.Character.HumanoidRootPart.CFrame
      end
   end,
})

local BlackHoleRadiusSlider = TeleTab:CreateSlider({
   Name = "To Self Orbit Radius",
   Range = {1, 100},
   Increment = 1,
   Suffix = "Rad",
   CurrentValue = 40,
   Flag = "radSlider", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        radius = Value
   end,
})
LocalPlayer.CharacterAdded:Connect(function()
   humanoidRootPart, Attachment1 = setupPlayer()
   if blackHoleActive then
         toggleBlackHole()
   end
   LocalPlayer.Character.Humanoid.Died:Connect(function()
      StartBlackHole:Set(false)
      blackHoleActive = false
   end)
end)

local VisTab = Window:CreateTab("Visuals", nil)
local VisThemeSection = VisTab:CreateSection("Theme")
local Toggle = VisTab:CreateToggle({
   Name = "Dark Mode",
   CurrentValue = true,
   Flag = "DarkLightTheme", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
   if Value then
      Window.ModifyTheme('Default')
   else
      Window.ModifyTheme('Light')
   end,
})

--Rayfield:LoadConfiguration()
