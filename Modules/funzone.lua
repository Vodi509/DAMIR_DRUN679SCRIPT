return {
    start = function(GUI)
        local C = GUI.colors
        local pg = GUI.fun
        
        local t = Instance.new("TextLabel", pg)
        t.Size = UDim2.new(1,0,0,18)
        t.BackgroundTransparency = 1
        t.Text = "СЕКРЕТНАЯ КНОПКА"
        t.TextColor3 = C.gold
        t.Font = Enum.Font.GothamBold
        t.TextSize = 12
        t.TextXAlignment = Enum.TextXAlignment.Left
        
        local aura = 0
        local al = Instance.new("TextLabel", pg)
        al.Size = UDim2.new(1,0,0,28)
        al.Position = UDim2.new(0,0,0,22)
        al.BackgroundColor3 = C.side
        al.Text = "💎 Аура: 0"
        al.TextColor3 = C.gold
        al.Font = Enum.Font.GothamBold
        al.TextSize = 13
        Instance.new("UICorner", al).CornerRadius = UDim.new(0,4)
        
        local ab = Instance.new("TextButton", pg)
        ab.Size = UDim2.new(1,0,0,42)
        ab.Position = UDim2.new(0,0,0,56)
        ab.BackgroundColor3 = C.btn
        ab.Text = "✨ ДАМИР +100M AURA"
        ab.TextColor3 = C.gold
        ab.Font = Enum.Font.GothamBold
        ab.TextSize = 13
        ab.BorderSizePixel = 0
        Instance.new("UICorner", ab).CornerRadius = UDim.new(0,5)
        Instance.new("UIStroke", ab).Thickness = 1.5
        Instance.new("UIStroke", ab).Color = C.gold
        
        ab.MouseButton1Click:Connect(function()
            aura = aura + 100000000
            al.Text = "💎 Аура: " .. aura
            ab.BackgroundColor3 = Color3.fromRGB(50,40,0)
            wait(0.15)
            ab.BackgroundColor3 = C.btn
        end)
        
        local memes = {
            "rbxassetid://18314115147",
            "rbxassetid://6072171427",
            "rbxassetid://6072166311",
            "rbxassetid://6072153923"
        }
        
        local mi = Instance.new("ImageLabel", pg)
        mi.Size = UDim2.new(0,130,0,130)
        mi.Position = UDim2.new(0,0,0,108)
        mi.BackgroundColor3 = C.side
        mi.Image = memes[1]
        Instance.new("UICorner", mi).CornerRadius = UDim.new(0,5)
        
        local mb = Instance.new("TextButton", pg)
        mb.Size = UDim2.new(1,0,0,30)
        mb.Position = UDim2.new(0,0,0,245)
        mb.BackgroundColor3 = C.btn
        mb.Text = "СЛЕДУЮЩИЙ МЕМ"
        mb.TextColor3 = C.grey
        mb.Font = Enum.Font.GothamBold
        mb.TextSize = 11
        mb.BorderSizePixel = 0
        Instance.new("UICorner", mb).CornerRadius = UDim.new(0,4)
        
        mb.MouseButton1Click:Connect(function()
            mi.Image = memes[math.random(1, #memes)]
        end)
    end
}
