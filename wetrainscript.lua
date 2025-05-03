local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "anime mania 🤪🪫🪫",
   Icon = nil,
   LoadingTitle = "made by wetrain",
   LoadingSubtitle = "for wetrain",
   Theme = "Amethyst",
   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,

   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, 
      FileName = "WetRainHub"
   },

   Discord = {
      Enabled = false, 
      Invite = "noinvitelink", 
      RememberJoins = true 
   },

   KeySystem = true,
   KeySettings = {
      Title = "Key system",
      Subtitle = "sowwy",
      Note = "No method of obtaining the key is provided",
      FileName = "wetrainkeysystem",
      SaveKey = true, 
      GrabKeyFromSite = false, 
      Key = {"WetRainAdminKey3509!"}
   }
})

local MainTab = Window:CreateTab("🏠 home", nil)
local MainSection = MainTab:CreateSection("Main")

Rayfield:Notify({
   Title = "join the discord",
   Content = "(i dont have one yet)",
   Duration = 3,
   Image = nil,
})

-- Infinite Yield Button
local InfYieldButton = MainTab:CreateButton({
   Name = "InfYeild",
   Callback = function()
      loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
   end,
})

-- Aimbot Visual FOV Circle Button
local AimbotButton = MainTab:CreateButton({
   Name = "aimbot (cant be turned off)",
   Callback = function()
      local fov = 100
      local maxTransparency = 0.1
      local RunService = game:GetService("RunService")
      local UserInputService = game:GetService("UserInputService")
      local Players = game:GetService("Players")
      local Cam = game.Workspace.CurrentCamera

      local FOVring = Drawing.new("Circle")
      FOVring.Visible = true
      FOVring.Thickness = 2
      FOVring.Color = Color3.fromRGB(128, 0, 128)
      FOVring.Filled = false
      FOVring.Radius = fov
      FOVring.Position = Cam.ViewportSize / 2
      FOVring.Transparency = 0.1

      local function updateDrawings()
         FOVring.Position = Cam.ViewportSize / 2
      end

      local function onKeyDown(input)
         if input.KeyCode == Enum.KeyCode.Delete then
            RunService:UnbindFromRenderStep("FOVUpdate")
            FOVring:Remove()
         end
      end

      UserInputService.InputBegan:Connect(onKeyDown)

      local function lookAt(target)
         local lookVector = (target - Cam.CFrame.Position).unit
         Cam.CFrame = CFrame.new(Cam.CFrame.Position, Cam.CFrame.Position + lookVector)
      end

      local function calculateTransparency(distance)
         local maxDistance = fov 
         return (1 - (distance / maxDistance)) * maxTransparency
      end

      local function getClosestPlayerInFOV(trg_part)
         local nearest = nil
         local last = math.huge
         local playerMousePos = Cam.ViewportSize / 2
         local localPlayer = Players.LocalPlayer
         local localPlayerTeam = localPlayer.Team

         for _, player in ipairs(Players:GetPlayers()) do
            if player ~= localPlayer then
               local part = player.Character and player.Character:FindFirstChild(trg_part)
               if part then
                  local ePos, isVisible = Cam:WorldToViewportPoint(part.Position)
                  local distance = (Vector2.new(ePos.x, ePos.y) - playerMousePos).Magnitude
                  if isVisible and distance < fov and player.Team ~= localPlayerTeam then
                     if distance < last then
                        last = distance
                        nearest = player
                     end
                  end
               end
            end
         end
         return nearest
      end

      RunService.RenderStepped:Connect(function()
         updateDrawings()
         local closest = getClosestPlayerInFOV("Head")
         if closest and closest.Character:FindFirstChild("Head") then
            lookAt(closest.Character.Head.Position)
            local ePos = Cam:WorldToViewportPoint(closest.Character.Head.Position)
            local distance = (Vector2.new(ePos.X, ePos.Y) - (Cam.ViewportSize / 2)).Magnitude
            FOVring.Transparency = calculateTransparency(distance)
         else
            FOVring.Transparency = 0.1
         end
      end)
   end,
})

-- WalkSpeed Slider
local WalkSpeedSlider = MainTab:CreateSlider({
   Name = "WalkSpeed Slider",
   Range = {1, 350},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "sliderws",
   Callback = function(Value)
      game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
   end,
})


local JumpPowerSlider = MainTab:CreateSlider({
   Name = "JumpPower Slider",
   Range = {1, 350},
   Increment = 1,
   Suffix = "Jump",
   CurrentValue = 50,
   Flag = "sliderjp",
   Callback = function(Value)
      game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
   end,
})


local NoclipToggle = MainTab:CreateToggle({
   Name = "noclip",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(Value)
      local Noclip = nil
      local Clip = nil

      function noclip()
         Clip = false
         local function Nocl()
            if not Clip and game.Players.LocalPlayer.Character then
               for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                  if v:IsA('BasePart') and v.CanCollide then
                     v.CanCollide = false
                  end
               end
            end
         end
         Noclip = game:GetService('RunService').Stepped:Connect(Nocl)
      end

      function clip()
         if Noclip then Noclip:Disconnect() end
         Clip = true
      end

      if Value then
         noclip()
      else
         clip()
      end
   end,
 Clip = false
})

local AMTab = Window:CreateTab("Anime Mania", nil
local Section = AMTab:CreateSection("Anime Mania")
