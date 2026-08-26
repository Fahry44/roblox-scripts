local Kavo = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Kavo.CreateLib("Evade Hub [BETA] - By Ryna", "DarkTheme")

local LocalPlayer = game:GetService("Players").LocalPlayer

-- TAB COSMETICS
local CosmeticTab = Window:NewTab("Cosmetics")
local CosmeticSection = CosmeticTab:NewSection("Client-Side Visuals")

-- Fake Headless (Scale 0 Technique)
CosmeticSection:NewButton("Fake Headless", "Kecilkan mesh kepala sampai hilang", function()
    pcall(function()
        local char = LocalPlayer.Character
        if char and char:FindFirstChild("Head") then
            char.Head.Transparency = 1
            for _, v in pairs(char.Head:GetChildren()) do
                if v:IsA("SpecialMesh") then
                    v.Scale = Vector3.new(0, 0, 0)
                elseif v:IsA("Decal") then
                    v:Destroy()
                end
            end
        end
    end)
end)

-- Fake Korblox (Destroy Legs Mesh)
CosmeticSection:NewButton("Fake Korblox", "Hapus mesh kaki kanan", function()
    pcall(function()
        local char = LocalPlayer.Character
        if char then
            for _, v in pairs(char:GetDescendants()) do
                local name = v.Name:lower()
                if name:find("rightlowerleg") or name:find("rightupperleg") or name:find("rightfoot") then
                    if v:IsA("BasePart") or v:IsA("MeshPart") then
                        v.Transparency = 1
                        v:ClearAllChildren()
                    end
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
