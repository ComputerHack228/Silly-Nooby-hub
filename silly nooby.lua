local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "Silly nooby hub",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Silly nooby hub",
   LoadingSubtitle = "by Computer",
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "ComputerHacker228"
   }


   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", 
      FileName = "Key", -- e
      SaveKey = true, 
      GrabKeyFromSite = false, 
      Key = {"Hello"} 
   }
})
local Tab = Window:CreateTab("Player", 4483362458)
local Slider = Tab:CreateSlider({
   Name = "Fake lag",
   Range = {0.2, 0.10},
   Increment = 1,
   Suffix = "lag",
   CurrentValue = 0.1,
   Flag = "Slider1", 
   Callback = function(Value)
  local fakeLagThread

local function toggleFakeLag()
    local lp = game:GetService("Players").LocalPlayer
    
    while fakeLagEnabled do
        task.wait()
        local character = lp.Character
        if character then
            local hrp = character:FindFirstChild("HumanoidRootPart")
            if hrp then
                hrp.Anchored = true
                task.wait(0.2)
                hrp.Anchored = false
                task.wait()
   end,
})

local Button = Tab:CreateButton({
   Name = "Touch to fling",
   Callback = function()
   
       loadstring(game:HttpGet("https://raw.githubusercontent.com/ComputerHack228/Touch-to-fling/refs/heads/source/Touch%20fling.lua"))()

   end,
})
