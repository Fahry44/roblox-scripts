local Kavo = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Kavo.CreateLib("Evade Hub [BETA] - By Ryna", "DarkTheme")

local CosmeticTab = Window:NewTab("Cosmetics")
local CosmeticSection = CosmeticTab:NewSection("Client-Side Visuals")

-- Fake Headless (Universal Head Scanner)
CosmeticSection:NewButton("Fake Headless", "Hilangkan kepala di Evade", function()
    pcall(function()
        local char = game.Players.LocalPlayer.Character
        if char then
            for _, v in pairs(char:GetDescendants()) do
                if v.Name == "Head" or v.Name:lower():find("head") then
                    if v:IsA("BasePart") or v:IsA("MeshPart") then
                        v.Transparency = 1
                    end
                    if v:IsA("Decal") or v:IsA("Texture") then
                        v.Transparency = 1
                    end
                end
            end
        end
    end)
end)

-- Fake Korblox (Universal Leg Scanner)
CosmeticSection:NewButton("Fake Korblox", "Hilangkan kaki kanan di Evade", function()
    pcall(function()
        local char = game.Players.LocalPlayer.Character
        if char then
            for _, v in pairs(char:GetDescendants()) do
                local name = v.Name:lower()
                if name:find("right") and (name:find("leg") or name:find("foot")) then
                    if v:IsA("BasePart") or v:IsA("MeshPart") then
                        v.Transparency = 1
                    end
                end
            end
        end
    end)
end)

-- TAB MAIN
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

-- TAB CREDITS
local CreditTab = Window:NewTab("Credits")
local CreditSection = CreditTab:NewSection("Developer & Socials")
CreditSection:NewLabel("Developer: Ryna")
CreditSection:NewLabel("Status: BETA")
CreditSection:NewLabel("Discord ID: 1123965322236526625")
CreditSection:NewButton("Copy Discord Link", "Salin invite link", function()
    setclipboard("https://discord.gg/2TgBkAA3kv")
end)
