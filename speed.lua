local ScreenGui = Instance.new("ScreenGui")
local TextButton = Instance.new("TextButton")

ScreenGui.Parent = game:GetService("CoreGui")

TextButton.Parent = ScreenGui
TextButton.Size = UDim2.new(0, 150, 0, 50)
TextButton.Position = UDim2.new(0.5, -75, 0.8, 0)
TextButton.Text = "Kecepatan: NORMAL"
TextButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton.TextSize = 14

local isFast = false
TextButton.MouseButton1Click:Connect(function()
    local char = game.Players.LocalPlayer.Character
    if char and char:FindFirstChild("Humanoid") then
        if isFast then
            char.Humanoid.WalkSpeed = 16
            TextButton.Text = "Kecepatan: NORMAL"
            TextButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        else
            char.Humanoid.WalkSpeed = 100
            TextButton.Text = "Kecepatan: CEPAT"
            TextButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
        end
        isFast = not isFast
    end
end)
