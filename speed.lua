local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Evade Hub [BETA]", HidePremium = false, SaveConfig = false, ConfigFolder = "EvadeConfig"})

-- Notification Pembuka
OrionLib:MakeNotification({
    Name = "Evade Hub Loaded!",
    Content = "Script Beta oleh Ryna berhasil dijalankan.",
    Image = "rbxassetid://4483345998",
    Time = 5
})

-- TAB 1: COSMETICS
local CosmeticTab = Window:MakeTab({
    Name = "Cosmetics",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

CosmeticTab:AddSection({ Name = "Visual Limbs (Client-Side)" })

CosmeticTab:AddButton({
    Name = "Enable Fake Korblox",
    Callback = function()
        local char = game.Players.LocalPlayer.Character
        if char and char:FindFirstChild("RightLowerLeg") then
            char.RightLowerLeg.Transparency = 1
            char.RightUpperLeg.Transparency = 1
            char.RightFoot.Transparency = 1
        end
    end    
})

CosmeticTab:AddButton({
    Name = "Enable Fake Headless",
    Callback = function()
        local char = game.Players.LocalPlayer.Character
        if char and char:FindFirstChild("Head") then
            char.Head.Transparency = 1
            if char.Head:FindFirstChildOfClass("Decal") then
                char.Head:FindFirstChildOfClass("Decal").Transparency = 1
            end
        end
    end    
})

-- TAB 2: MOVEMENT & VISUAL
local MainTab = Window:MakeTab({
    Name = "Main / Utility",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

MainTab:AddSlider({
    Name = "WalkSpeed",
    Min = 16,
    Max = 120,
    Default = 16,
    Color = Color3.fromRGB(0, 170, 255),
    Increment = 1,
    ValueName = "Speed",
    Callback = function(Value)
        local char = game.Players.LocalPlayer.Character
        if char and char:FindFirstChild("Humanoid") then
            char.Humanoid.WalkSpeed = Value
        end
    end    
})

MainTab:AddSlider({
    Name = "Field of View (FOV)",
    Min = 70,
    Max = 120,
    Default = 70,
    Color = Color3.fromRGB(255, 170, 0),
    Increment = 1,
    ValueName = "FOV",
    Callback = function(Value)
        workspace.CurrentCamera.FieldOfView = Value
    end    
})

-- TAB 3: CREDITS & INFO
local InfoTab = Window:MakeTab({
    Name = "Info & Credits",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

InfoTab:AddSection({ Name = "Developer Info" })
InfoTab:AddLabel("Script Creator: Ryna")
InfoTab:AddLabel("Status: Beta Version")
InfoTab:AddLabel("Discord ID: 1123965322236526625")

InfoTab:AddSection({ Name = "Community" })
InfoTab:AddButton({
    Name = "Copy Discord Invite Link",
    Callback = function()
        setclipboard("https://discord.gg/2TgBkAA3kv")
        OrionLib:MakeNotification({
            Name = "Copied!",
            Content = "Link Discord berhasil disalin ke clipboard.",
            Time = 3
        })
    end    
})

OrionLib:Init()
