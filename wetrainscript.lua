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
