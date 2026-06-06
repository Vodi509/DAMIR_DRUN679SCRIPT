return function()
    local plr = game.Players.LocalPlayer
    local pg = plr:WaitForChild("PlayerGui")
    
    -- Очистка
    for _, v in pairs(pg:GetChildren()) do
        if v.Name == "DamirHub" or v.Name == "TestGUI" then
            v:Destroy()
        end
    end
    
    -- Простой красный квадрат
    local sg = Instance.new("ScreenGui", pg)
    sg.Name = "TestGUI"
    
    local box = Instance.new("Frame", sg)
    box.Size = UDim2.new(0, 200, 0, 200)
    box.Position = UDim2.new(0.5, -100, 0.5, -100)
    box.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    box.BorderSizePixel = 0
    
    local text = Instance.new("TextLabel", box)
    text.Size = UDim2.new(1, 0, 1, 0)
    text.BackgroundTransparency = 1
    text.Text = "ТЕСТ"
    text.TextColor3 = Color3.new(1, 1, 1)
    text.Font = Enum.Font.GothamBold
    text.TextSize = 20
    
    return {
        colors = {},
        main = box,
        farm = box,
        fun = box,
        settings = box,
        changelog = box
    }
end
