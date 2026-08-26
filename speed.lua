local Kavo = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Kavo.CreateLib("Evade Hub [BETA] - By Ryna", "DarkTheme")

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- LOGIKA HOOKING METATABLE (Mencegat Game Meriset Transparansi)
local rawmt = getrawmetatable(game)
local setreadonly = setreadonly or make_writeable
setreadonly(rawmt, false)
local oldindex = rawmt.__newindex

rawmt.__newindex = newcclosure(function(t, k, v)
    if (_G.Headless and t.Name == "Head" and k == "Transparency") or 
       (_G.Korblox and (t.Name:find("RightLowerLeg") or t.Name:find("RightUpperLeg") or t.Name:find("RightFoot")) and k == "Transparency") then
        return oldindex(t, k, 1) -- Paksa tetap 1 (Transparan)
    end
    return oldindex(t, k, v)
end)
setreadonly(rawmt, true)

-- TAB COSMETICS
local CosmeticTab = Window:NewTab("Cosmetics")
local CosmeticSection = CosmeticTab:NewSection("Client-Side Visuals")

_G.Headless = false
_G.Korblox = false

CosmeticSection:NewToggle("Fake Headless", "Metode Hooking Headless", function(state)
    _G.Headless = state
    pcall(function()
        local char = LocalPlayer.Character
        if char and char:FindFirstChild("Head") then
            char.Head.Transparency = state and 1 or 0
            if char.Head:FindFirstChildOfClass("Decal") then
                char.Head:FindFirstChildOfClass("Decal").Transparency = state and 1 or 0
            end
        end
    end)
end)

CosmeticSection:NewToggle("Fake Korblox", "Metode Hooking Korblox", function(state)
    _G.Korblox = state
    pcall(function()
        local char = LocalPlayer.Character
        if char then
            for _, v in pairs(char:GetChildren()) do
                if v.Name:find("RightLowerLeg") or v.Name:find("RightUpperLeg") or v.Name:find("RightFoot") then
                    v.Transparency = state and 1 or 0
                end
            end
        end
    end)
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
