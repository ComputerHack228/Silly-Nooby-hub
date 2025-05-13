local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
    Name = "Silly nooby hub",
    Icon = 0,
    LoadingTitle = "Silly nooby hub",
    LoadingSubtitle = "by Computer",
    Theme = "Default",
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false,
    ConfigurationSaving = {
        Enabled = true,
        FolderName = nil,
        FileName = "ComputerHacker228"
    },
    KeySystem = false,
    KeySettings = {
        Title = "Untitled",
        Subtitle = "Key System",
        Note = "No method of obtaining the key is provided", 
        FileName = "Key",
        SaveKey = true, 
        GrabKeyFromSite = false, 
        Key = {"Hello"} 
    }
})

local Tab = Window:CreateTab("Player", 4483362458)

-- Fake Lag Variables
local fakeLagEnabled = false
local fakeLagThread
local fakeLagValue = 0.1

-- Fake Lag Toggle Button
local FakeLagToggle = Tab:CreateButton({
    Name = "Enable Fake Lag",
    Callback = function()
        fakeLagEnabled = not fakeLagEnabled
        
        if fakeLagEnabled then
            FakeLagToggle:Set("Disable Fake Lag")
            
            fakeLagThread = task.spawn(function()
                local lp = game:GetService("Players").LocalPlayer
                
                while fakeLagEnabled do
                    task.wait()
                    local character = lp.Character
                    if character then
                        local hrp = character:FindFirstChild("HumanoidRootPart")
                        if hrp then
                            hrp.Anchored = true
                            task.wait(fakeLagValue)
                            hrp.Anchored = false
                            task.wait(fakeLagValue)
                        end
                    end
                end
            end)
        else
            FakeLagToggle:Set("Enable Fake Lag")
            
            if fakeLagThread then
                task.cancel(fakeLagThread)
                fakeLagThread = nil
                
                -- Ensure HRP is unanchored when disabled
                local lp = game:GetService("Players").LocalPlayer
                local character = lp.Character
                if character then
                    local hrp = character:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        hrp.Anchored = false
                    end
                end
            end
        end
    end
})

-- Fake Lag Slider
local Slider = Tab:CreateSlider({
    Name = "Fake Lag Duration",
    Range = {0.05, 1},
    Increment = 0.05,
    Suffix = "seconds",
    CurrentValue = fakeLagValue,
    Flag = "FakeLagSlider",
    Callback = function(Value)
        fakeLagValue = Value
    end
})

-- Touch to Fling Button
local Button = Tab:CreateButton({
    Name = "Touch to fling",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ComputerHack228/Touch-to-fling/refs/heads/source/Touch%20fling.lua"))()
    end,
})
