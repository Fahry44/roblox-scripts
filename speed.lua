local Kavo = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Kavo.CreateLib("Evade Debugger - By Ryna", "DarkTheme")

local LocalPlayer = game:GetService("Players").LocalPlayer

local DebugTab = Window:NewTab("Debug")
local DebugSection = DebugTab:NewSection("Inspect Evade Models")

-- 1. INSPECT CHARACTER BIASA
DebugSection:NewButton("Debug Character LocalPlayer", "Cetak semua part di Character ke F9", function()
    local char = LocalPlayer.Character
    if not char then
        warn("Character tidak ditemukan!")
        return
    end

    print("================ [ CHARACTER LOCALPLAYER ] ================")
    for _, v in ipairs(char:GetDescendants()) do
        if v:IsA("BasePart") or v:IsA("MeshPart") or v:IsA("SpecialMesh") then
            print(v:GetFullName(), "| Class:", v.ClassName, "| Trans:", v.Transparency)
        end
    end
end)

-- 2. INSPECT WORKSPACE UNTUK MENCARI VIEWMODEL / CUSTOM RIG
DebugSection:NewButton("Debug Workspace Models", "Cari Rig/Viewmodel di Workspace ke F9", function()
    print("================ [ WORKSPACE MODELS SCAN ] ================")
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("Model") then
            local name = obj.Name:lower()
            if name:find("character") or name:find("view") or name:find(LocalPlayer.Name:lower()) or name:find("rig") or name:find("player") then
                print("FOUND MODEL:", obj:GetFullName())
            end
        end
    end
end)

-- TAB UTILITY SEMENTARA
local MainTab = Window:NewTab("Main")
local MainSection = MainTab:NewSection("Utilities")

MainSection:NewSlider("WalkSpeed", "Atur kecepatan lari", 120, 16, function(s)
    pcall(function()
        LocalPlayer.Character.Humanoid.WalkSpeed = s
    end)
end)
