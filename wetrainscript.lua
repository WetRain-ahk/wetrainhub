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
      SaveKey = false, 
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

local Button = MainTab:CreateButton({
   Name = "InfYeild",
   Callback = function()
      loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
   end,
})

local Toggle = MainTab:CreateToggle({
   Name = "aimbot",
   CurrentValue = false,
   Flag = "Toggle1", 
   Callback = function(Value)
         local fov = 100
local maxTransparency = 0.1 -- TransparÃªncia mÃ¡xima dentro do cÃ­rculo (0.1 = 10% de transparÃªncia)
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local Teams = game:GetService("Teams") -- Adicione esta linha para acessar os times
local Cam = game.Workspace.CurrentCamera

local FOVring = Drawing.new("Circle")
FOVring.Visible = true
FOVring.Thickness = 2
FOVring.Color = Color3.fromRGB(128, 0, 128) -- Cor roxa
FOVring.Filled = false
FOVring.Radius = fov
FOVring.Position = Cam.ViewportSize / 2
FOVring.Transparency = 0.1 -- TransparÃªncia inicial igual ao segundo script

local function updateDrawings()
    local camViewportSize = Cam.ViewportSize
    FOVring.Position = camViewportSize / 2
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
    local newCFrame = CFrame.new(Cam.CFrame.Position, Cam.CFrame.Position + lookVector)
    Cam.CFrame = newCFrame
end

local function calculateTransparency(distance)
    -- Ajuste a transparÃªncia com base na distÃ¢ncia do centro do cÃ­rculo
    local maxDistance = fov -- A distÃ¢ncia mÃ¡xima do centro do cÃ­rculo
    local transparency = (1 - (distance / maxDistance)) * maxTransparency
    return transparency
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
                
                -- Adicione uma verificaÃ§Ã£o de equipe aqui
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

        if closest then
            local ePos, isVisible = Cam:WorldToViewportPoint(closest.Character.Head.Position)
            local distance = (Vector2.new(ePos.x, ePos.y) - (Cam.ViewportSize / 2)).Magnitude
            FOVring.Transparency = calculateTransparency(distance)
        else
            FOVring.Transparency = 0.1 -- Mantenha completamente visÃ­vel quando nenhum jogador estiver no FOV
        end
    else
        FOVring.Transparency = 0.1 -- Mantenha completamente visÃ­vel quando nenhum jogador estiver no FOV
    end
end)
Toggle:Set(true)
   end,
})

