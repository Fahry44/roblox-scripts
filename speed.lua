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

-- Fake Korblox
CosmeticSection:NewButton("Fake Korblox", "Hilangkan kaki kanan", function()
    pcall(function()
        local char = game.Players.LocalPlayer.Character
        if char then
            for _, v in pairs(char:GetDescendants()) do
                if v.Name:find("RightLowerLeg")
                    or v.Name:find("RightUpperLeg")
                    or v.Name:find("RightFoot") then

                    if v:IsA("BasePart") then
                        v.Transparency = 1
                    elseif v:IsA("SpecialMesh") or v:IsA("MeshPart") then
                        v.MeshId = ""
                    end
                end
            end
        end
    end)
end)

-- Fake Headless
CosmeticSection:NewButton("Fake Headless", "Hilangkan kepala", function()
    pcall(function()
        local char = game.Players.LocalPlayer.Character

        if char and char:FindFirstChild("Head") then
            char.Head.Transparency = 1

            for _, child in pairs(char.Head:GetChildren()) do
                if child:IsA("Decal") or child:IsA("SpecialMesh") then
                    child:Destroy()
                end
            end
        end
    end)
end)

-- TAB 2: MOVEMENT & VISUAL
local MainTab = Window:NewTab("Main")
local MainSection = MainTab:NewSection("Player Modifiers")

-- WalkSpeed
MainSection:NewSlider("WalkSpeed", "Atur kecepatan lari", 120, 16, function(s)
    pcall(function()
        local char = game.Players.LocalPlayer.Character
        if char and char:FindFirstChildOfClass("Humanoid") then
            char:FindFirstChildOfClass("Humanoid").WalkSpeed = s
        end
    end)
end)

-- FOV
MainSection:NewSlider("FOV", "Atur jarak pandang", 120, 70, function(s)
    pcall(function()
        workspace.CurrentCamera.FieldOfView = s
    end)
end)

-- TAB 3: CREDITS
local CreditTab = Window:NewTab("Credits")
local CreditSection = CreditTab:NewSection("Developer & Socials")

CreditSection:NewLabel("Developer: Ryna")
CreditSection:NewLabel("Status: BETA")
CreditSection:NewLabel("Discord ID: 1123965322236526625")

CreditSection:NewButton("Copy Discord Link", "Salin invite link", function()
    pcall(function()
        setclipboard("https://discord.gg/2TgBkAA3kv")

        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Copied!",
            Text = "Link Discord berhasil disalin.",
            Duration = 3
        })
    end)
end)
