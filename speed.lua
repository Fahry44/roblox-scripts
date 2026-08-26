local Kavo = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Kavo.CreateLib("Evade Scanner - By Ryna", "DarkTheme")

local LocalPlayer = game:GetService("Players").LocalPlayer

local DebugTab = Window:NewTab("Scanner")
local DebugSection = DebugTab:NewSection("Pindai Objek Evade")

-- Notifikasi Layar Biar Langsung Kelihatan Hasilnya
local function notify(title, text)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = title,
        Text = text,
        Duration = 5
    })
end

-- SCAN 1: Pindai Character
DebugSection:NewButton("Scan Character Player", "Cari letak part avatar", function()
    local char = LocalPlayer.Character
    if not char then
        notify("Scanner Error", "Karakter tidak ditemukan! Masuk match dulu.")
        return
    end

    local count = 0
    print("================== [ SCAN CHARACTER ] ==================")
    for _, v in ipairs(char:GetDescendants()) do
        if v:IsA("BasePart") or v:IsA("MeshPart") then
            count = count + 1
            print("Part: " .. v.Name .. " | Parent: " .. v.Parent.Name .. " | Trans: " .. tostring(v.Transparency))
        end
    end
    notify("Scan Character Selesai", "Ditemukan " .. tostring(count) .. " part di avatar.")
end)

-- SCAN 2: Pindai Viewmodel/Rig khusus Evade di Workspace
DebugSection:NewButton("Scan Viewmodel In-Game", "Cari model rahasia Evade", function()
    local foundModels = {}
    print("================== [ SCAN WORKSPACE ] ==================")
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("Model") then
            local name = obj.Name:lower()
            if name:find("character") or name:find("view") or name:find("rig") or name:find(LocalPlayer.Name:lower()) then
                table.insert(foundModels, obj.Name)
                print("Model Ditemukan: " .. obj:GetFullName())
            end
        end
    end

    if #foundModels > 0 then
        notify("Viewmodel Ditemukan!", "Cek F9 untuk list model: " .. table.concat(foundModels, ", "))
    else
        notify("Scan Workspace", "Tidak ada model viewmodel khusus yang terdeteksi.")
    end
end)

-- TAB UTILITY
local MainTab = Window:NewTab("Main")
local MainSection = MainTab:NewSection("Player Modifiers")

MainSection:NewSlider("WalkSpeed", "Atur kecepatan lari", 120, 16, function(s)
    pcall(function()
        LocalPlayer.Character.Humanoid.WalkSpeed = s
    end)
end)
