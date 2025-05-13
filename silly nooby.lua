local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
    Name = "Silly nooby hub",
    LoadingTitle = "Silly nooby hub",
    LoadingSubtitle = "by Computer",
    ConfigurationSaving = {
        Enabled = true,
        FileName = "ComputerHacker228"
    }
})

local Tab = Window:CreateTab("Player", 4483362458)

-- Fake Lag System
local fakeLagEnabled = false
local fakeLagThread
local fakeLagValue = 0.1

-- Create the toggle button first
local FakeLagToggle = Tab:CreateButton({
    Name = "Enable Fake Lag",
    Callback = function()
        fakeLagEnabled = not fakeLagEnabled
        
        if fakeLagEnabled then
            -- Enable fake lag
            FakeLagToggle:Set("Disable Fake Lag")
            
            fakeLagThread = task.spawn(function()
                local lp = game:GetService("Players").LocalPlayer
                
                while fakeLagEnabled and task.wait() do
                    local character = lp.Character
                    if character then
                        local hrp = character:FindFirstChild("HumanoidRootPart")
                        if hrp then
                            -- Anchor and unanchor with delay
                            hrp.Anchored = true
                            task.wait(fakeLagValue)
                            hrp.Anchored = false
                            task.wait(fakeLagValue)
                        end
                    end
                end
            end)
        else
            -- Disable fake lag
            FakeLagToggle:Set("Enable Fake Lag")
            
            if fakeLagThread then
                task.cancel(fakeLagThread)
            end
            
            -- Ensure HRP is unanchored
            local lp = game:GetService("Players").LocalPlayer
            if lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") then
                lp.Character.HumanoidRootPart.Anchored = false
            end
        end
    end
})

-- Slider to adjust fake lag duration
Tab:CreateSlider({
    Name = "Fake Lag Duration",
    Range = {0.05, 1},
    Increment = 0.05,
    Suffix = "seconds",
    CurrentValue = fakeLagValue,
    Callback = function(Value)
        fakeLagValue = Value
    end
})

-- Touch to Fling Button
Tab:CreateButton({
    Name = "Touch to fling",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ComputerHack228/Touch-to-fling/refs/heads/source/Touch%20fling.lua"))()
    end,
})
