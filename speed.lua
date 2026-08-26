local Kavo = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Kavo.CreateLib("Evade Hub [BETA] - By Ryna", "DarkTheme")

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- TAB COSMETICS
local CosmeticTab = Window:NewTab("Cosmetics")
local CosmeticSection = CosmeticTab:NewSection("Client-Side Visuals")

-- FAKE HEADLESS (Menyasar Workspace.Rigs & ViewModel)
CosmeticSection:NewButton("Fake Headless", "Hilangkan kepala dari Rig Evade", function()
    pcall(function()
        -- 1. Scan di Workspace.Rigs
        if workspace:FindFirstChild("Rigs") then
            for _, rig in pairs(workspace.Rigs:GetChildren()) do
                if rig.Name:find(LocalPlayer.Name) or rig:FindFirstChild("Head") then
                    if rig:FindFirstChild("Head") then
                        rig.Head.Transparency = 1
                        for _, child in pairs(rig.Head:GetChildren()) do
                            if child:IsA("Decal") or child:IsA("SpecialMesh") then
                                child:Destroy()
                            end
                        end
                    end
                end
            end
        end

        -- 2. Scan di Camera ViewModel
        if workspace.CurrentCamera:FindFirstChild("ViewModel") then
            local vm = workspace.CurrentCamera.ViewModel
            if vm:FindFirstChild("Head") then
                vm.Head.Transparency = 1
            end
        end
    end)
end)

-- FAKE KORBLOX (Fix Target Workspace.Rigs)
CosmeticSection:NewButton("Fake Korblox", "Hilangkan kaki kanan dari Rig Evade", function()
    pcall(function()
        if workspace:FindFirstChild("Rigs") then
            for _, rig in pairs(workspace.Rigs:GetChildren()) do
                if rig.Name:find(LocalPlayer.Name) or rig:FindFirstChild("Humanoid") then
                    for _, part in pairs(rig:GetDescendants()) do
                        local name = part.Name:lower()
                        if name:find("rightlowerleg") or name:find("rightupperleg") or name:find("rightfoot") or name:find("right leg") then
                            if part:IsA("BasePart") then
                                part.Transparency = 1
                                part.Size = Vector3.new(0, 0, 0)
                            end
                            if part:IsA("SpecialMesh") or part:IsA("MeshPart") then
                                part.TextureID = ""
                            end
                        end
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
