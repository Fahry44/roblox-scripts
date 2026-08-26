local Kavo = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Kavo.CreateLib("Evade Hub [BETA] - By Ryna", "DarkTheme")

-- NOTIFIKASI PEMBUKA
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Evade Hub [BETA]",
    Text = "Loaded successfully! Created by Ryna.",
    Duration = 5
})

-- TAB 1: COSMETICS
local CosmeticTab = Window:NewTab("Cosmetics")
local CosmeticSection = CosmeticTab:NewSection("Client-Side Visuals")

CosmeticSection:NewButton("Fake Korblox", "Hilangkan kaki kanan", function()
    pcall(function()
        local char = game.Players.LocalPlayer.Character
        if char then
            for _, v in pairs(char:GetChildren()) do
                if v.Name:find("RightLowerLeg") or v.Name:find("RightUpperLeg") or v.Name:find("RightFoot") then
                    v.Transparency = 1
                end
            end
        end
    end)
end)

CosmeticSection:NewButton("Fake Headless", "Hilangkan kepala", function()
    pcall(function()
        local char = game.Players.LocalPlayer.Character
        if char and char:FindFirstChild("Head") then
            char.Head.Transparency = 1
            if char.Head:FindFirstChildOfClass("Decal") then
                char.Head:FindFirstChildOfClass("Decal").Transparency = 1
            end
        end
    end)
end)

-- TAB 2: MOVEMENT & VISUAL
local MainTab = Window:NewTab("Main")
local MainSection = MainTab:NewSection("Player Modifiers")

MainSection:NewSlider("WalkSpeed", "Atur kecepatan lari", 120, 16, function(s)
    pcall(function()
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
    end)
end)

MainSection:NewSlider("FOV", "Atur jarak pandang", 120, 70, function(s)
    workspace.CurrentCamera.FieldOfView = s
end)

-- TAB 3: CREDITS
local CreditTab = Window:NewTab("Credits")
local CreditSection = CreditTab:NewSection("Developer & Socials")

CreditSection:NewLabel("Developer: Ryna")
CreditSection:NewLabel("Status: BETA")
CreditSection:NewLabel("Discord ID: 1123965322236526625")

CreditSection:NewButton("Copy Discord Link", "Salin invite link", function()
    setclipboard("https://discord.gg/2TgBkAA3kv")
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Copied!",
        Text = "Link Discord berhasil disalin.",
        Duration = 3
    })
end)
