local Kavo = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Kavo.CreateLib("Evade Hub [BETA] - By Ryna", "DarkTheme")

local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- TAB COSMETICS
local CosmeticTab = Window:NewTab("Cosmetics")
local CosmeticSection = CosmeticTab:NewSection("Client-Side Visuals")

_G.Headless = false
_G.Korblox = false

CosmeticSection:NewToggle("Fake Headless", "Paksa kepala hilang", function(state)
    _G.Headless = state
end)

CosmeticSection:NewToggle("Fake Korblox", "Paksa kaki kanan hilang", function(state)
    _G.Korblox = state
end)

-- LOOP UTAMA (RenderStepped - Memaksa Transparansi Tiap Frame)
RunService.RenderStepped:Connect(function()
    local char = LocalPlayer.Character
    if char then
        if _G.Headless then
            for _, v in pairs(char:GetDescendants()) do
                if v.Name:lower():find("head") and (v:IsA("BasePart") or v:IsA("Decal")) then
                    v.Transparency = 1
                end
            end
        end
        if _G.Korblox then
            for _, v in pairs(char:GetDescendants()) do
                local name = v.Name:lower()
                if (name:find("rightlowerleg") or name:find("rightupperleg") or name:find("rightfoot") or name:find("right leg")) and v:IsA("BasePart") then
                    v.Transparency = 1
                end
            end
        end
    end
end)

-- TAB MAIN
local MainTab = Window:NewTab("Main")
local MainSection = MainTab:NewSection("Utilities")

MainSection:NewSlider("WalkSpeed", "Atur kecepatan lari", 120, 16, function(s)
    pcall(function()
        LocalPlayer.Character.Humanoid.WalkSpeed = s
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
