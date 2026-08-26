local Kavo = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Kavo.CreateLib("Evade Hub [BETA] - By Ryna", "DarkTheme")

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")

local LocalPlayer = Players.LocalPlayer

-- =========================================================
-- NOTIFIKASI PEMBUKA
-- =========================================================

pcall(function()
    StarterGui:SetCore("SendNotification", {
        Title = "Evade Hub [BETA]",
        Text = "Loaded successfully! Created by Ryna.",
        Duration = 5
    })
end)

-- =========================================================
-- GLOBAL STATE
-- =========================================================

local FakeKorblox = false
local FakeHeadless = false

-- =========================================================
-- HELPER
-- =========================================================

local function getCharacter()
    return LocalPlayer.Character
end

local function applyFakeKorblox()
    if not FakeKorblox then
        return
    end

    local char = getCharacter()

    if not char then
        return
    end

    for _, v in pairs(char:GetDescendants()) do
        if v.Name:find("RightLowerLeg")
            or v.Name:find("RightUpperLeg")
            or v.Name:find("RightFoot") then

            if v:IsA("BasePart") then
                v.Transparency = 1
                v.LocalTransparencyModifier = 1
            elseif v:IsA("Decal") then
                v.Transparency = 1
            end
        end
    end
end

local function applyFakeHeadless()
    if not FakeHeadless then
        return
    end

    local char = getCharacter()

    if not char then
        return
    end

    local head = char:FindFirstChild("Head")

    if not head then
        return
    end

    if head:IsA("BasePart") then
        head.Transparency = 1
        head.LocalTransparencyModifier = 1
    end

    for _, child in pairs(head:GetDescendants()) do
        if child:IsA("Decal") then
            child.Transparency = 1
        elseif child:IsA("SpecialMesh") then
            child:Destroy()
        end
    end
end

local function resetVisuals()
    local char = getCharacter()

    if not char then
        return
    end

    for _, v in pairs(char:GetDescendants()) do
        if v:IsA("BasePart") then
            v.LocalTransparencyModifier = 0
            v.Transparency = 0
        elseif v:IsA("Decal") then
            v.Transparency = 0
        end
    end
end

-- =========================================================
-- VISUAL LOOP
-- =========================================================

RunService.RenderStepped:Connect(function()
    if FakeKorblox then
        pcall(applyFakeKorblox)
    end

    if FakeHeadless then
        pcall(applyFakeHeadless)
    end
end)

-- =========================================================
-- RESPAWN HANDLER
-- =========================================================

LocalPlayer.CharacterAdded:Connect(function(character)
    task.wait(0.5)

    if FakeKorblox then
        pcall(applyFakeKorblox)
    end

    if FakeHeadless then
        pcall(applyFakeHeadless)
    end
end)

-- =========================================================
-- TAB 1: COSMETICS
-- =========================================================

local CosmeticTab = Window:NewTab("Cosmetics")
local CosmeticSection = CosmeticTab:NewSection("Client-Side Visuals")

-- Fake Korblox
CosmeticSection:NewToggle(
    "Fake Korblox",
    "Aktifkan/Matikan Korblox",
    function(state)
        FakeKorblox = state

        if state then
            pcall(applyFakeKorblox)
        end
    end
)

-- Fake Headless
CosmeticSection:NewToggle(
    "Fake Headless",
    "Aktifkan/Matikan Headless",
    function(state)
        FakeHeadless = state

        if state then
            pcall(applyFakeHeadless)
        end
    end
)

-- Reset Visuals
CosmeticSection:NewButton(
    "Reset Visuals",
    "Kembalikan visual karakter",
    function()
        FakeKorblox = false
        FakeHeadless = false

        pcall(resetVisuals)

        pcall(function()
            StarterGui:SetCore("SendNotification", {
                Title = "Visuals Reset",
                Text = "Visual karakter telah dikembalikan.",
                Duration = 3
            })
        end)
    end
)

-- =========================================================
-- TAB 2: MOVEMENT & VISUAL
-- =========================================================

local MainTab = Window:NewTab("Main")
local MainSection = MainTab:NewSection("Player Modifiers")

-- WalkSpeed
MainSection:NewSlider(
    "WalkSpeed",
    "Atur kecepatan lari",
    120,
    16,
    function(s)
        pcall(function()
            local char = getCharacter()

            if char then
                local humanoid = char:FindFirstChildOfClass("Humanoid")

                if humanoid then
                    humanoid.WalkSpeed = s
                end
            end
        end)
    end
)

-- FOV
MainSection:NewSlider(
    "FOV",
    "Atur jarak pandang",
    120,
    70,
    function(s)
        pcall(function()
            if workspace.CurrentCamera then
                workspace.CurrentCamera.FieldOfView = s
            end
        end)
    end
)

-- =========================================================
-- TAB 3: CREDITS
-- =========================================================

local CreditTab = Window:NewTab("Credits")
local CreditSection = CreditTab:NewSection("Developer & Socials")

CreditSection:NewLabel("Developer: Ryna")
CreditSection:NewLabel("Status: BETA")
CreditSection:NewLabel("Discord ID: 1123965322236526625")

CreditSection:NewButton(
    "Copy Discord Link",
    "Salin invite link",
    function()
        pcall(function()
            setclipboard("https://discord.gg/2TgBkAA3kv")

            StarterGui:SetCore("SendNotification", {
                Title = "Copied!",
                Text = "Link Discord berhasil disalin.",
                Duration = 3
            })
        end)
    end
)
