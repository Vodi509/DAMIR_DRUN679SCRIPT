return {
    start = function(GUI)
        local C = GUI.colors
        local pg = GUI.settings
        
        local st = Instance.new("TextLabel", pg)
        st.Size = UDim2.new(1,0,0,18) st.BackgroundTransparency = 1
        st.Text = "⚙️ НАСТРОЙКИ" st.TextColor3 = C.gold st.Font = Enum.Font.GothamBold st.TextSize = 12 st.TextXAlignment = Enum.TextXAlignment.Center
        
        -- Скорость молота (высота)
        local heightLabel = Instance.new("TextLabel", pg)
        heightLabel.Size = UDim2.new(1,0,0,16) heightLabel.Position = UDim2.new(0,0,0,22) heightLabel.BackgroundTransparency = 1
        heightLabel.Text = "📏 Высота подъёма: 200" heightLabel.TextColor3 = C.white heightLabel.Font = Enum.Font.GothamBold heightLabel.TextSize = 11 heightLabel.TextXAlignment = Enum.TextXAlignment.Left
        
        local hammerHeight = 200
        local heightBtn = Instance.new("TextButton", pg)
        heightBtn.Size = UDim2.new(1,0,0,26) heightBtn.Position = UDim2.new(0,0,0,40)
        heightBtn.BackgroundColor3 = C.btn heightBtn.Text = "ИЗМЕНИТЬ (100-500)" heightBtn.TextColor3 = C.white heightBtn.Font = Enum.Font.GothamBold heightBtn.TextSize = 11 heightBtn.BorderSizePixel = 0
        Instance.new("UICorner", heightBtn).CornerRadius = UDim.new(0,4)
        Instance.new("UIStroke", heightBtn).Thickness = 1.5 Instance.new("UIStroke", heightBtn).Color = C.purple
        
        local heights = {100, 200, 300, 400, 500}
        local hi = 2
        
        heightBtn.MouseButton1Click:Connect(function()
            hi = hi % #heights + 1
            hammerHeight = heights[hi]
            heightLabel.Text = "📏 Высота подъёма: " .. hammerHeight
            GUI.hammerHeight = hammerHeight
        end)
        GUI.hammerHeight = hammerHeight
        
        -- Скорость молота (сила удара)
        local speedLabel = Instance.new("TextLabel", pg)
        speedLabel.Size = UDim2.new(1,0,0,16) speedLabel.Position = UDim2.new(0,0,0,74) speedLabel.BackgroundTransparency = 1
        speedLabel.Text = "⚡ Сила удара: 1500" speedLabel.TextColor3 = C.white speedLabel.Font = Enum.Font.GothamBold speedLabel.TextSize = 11 speedLabel.TextXAlignment = Enum.TextXAlignment.Left
        
        local hammerSpeed = 1500
        local speedBtn = Instance.new("TextButton", pg)
        speedBtn.Size = UDim2.new(1,0,0,26) speedBtn.Position = UDim2.new(0,0,0,92)
        speedBtn.BackgroundColor3 = C.btn speedBtn.Text = "ИЗМЕНИТЬ (500-3000)" speedBtn.TextColor3 = C.white speedBtn.Font = Enum.Font.GothamBold speedBtn.TextSize = 11 speedBtn.BorderSizePixel = 0
        Instance.new("UICorner", speedBtn).CornerRadius = UDim.new(0,4)
        Instance.new("UIStroke", speedBtn).Thickness = 1.5 Instance.new("UIStroke", speedBtn).Color = C.purple
        
        local speeds = {500, 1000, 1500, 2000, 2500, 3000}
        local si = 3
        
        speedBtn.MouseButton1Click:Connect(function()
            si = si % #speeds + 1
            hammerSpeed = speeds[si]
            speedLabel.Text = "⚡ Сила удара: " .. hammerSpeed
            GUI.hammerSpeed = hammerSpeed
        end)
        GUI.hammerSpeed = hammerSpeed
        
        -- Смена темы
        local tt = Instance.new("TextLabel", pg)
        tt.Size = UDim2.new(1,0,0,16) tt.Position = UDim2.new(0,0,0,126) tt.BackgroundTransparency = 1
        tt.Text = "🎨 Тема: Неон" tt.TextColor3 = C.white tt.Font = Enum.Font.GothamBold tt.TextSize = 11 tt.TextXAlignment = Enum.TextXAlignment.Left
        
        local themes = {
            {name = "Неон", bg = Color3.fromRGB(10,10,35)},{name = "Закат", bg = Color3.fromRGB(40,15,5)},{name = "Фиолет", bg = Color3.fromRGB(30,10,50)},{name = "Океан", bg = Color3.fromRGB(5,25,45)},{name = "Лес", bg = Color3.fromRGB(5,35,15)},{name = "Золото", bg = Color3.fromRGB(35,28,5)},{name = "Космос", bg = Color3.fromRGB(8,8,28)},{name = "Розовый", bg = Color3.fromRGB(42,12,28)},{name = "Красный", bg = Color3.fromRGB(48,12,12)},{name = "Лайм", bg = Color3.fromRGB(12,42,12)},{name = "Синий", bg = Color3.fromRGB(10,15,50)},{name = "Оранж", bg = Color3.fromRGB(48,25,5)},{name = "Бирюза", bg = Color3.fromRGB(5,40,38)},{name = "Малина", bg = Color3.fromRGB(42,8,22)},{name = "Слива", bg = Color3.fromRGB(30,10,35)}
        }
        local ti = 1
        
        local tb = Instance.new("TextButton", pg)
        tb.Size = UDim2.new(1,0,0,26) tb.Position = UDim2.new(0,0,0,144)
        tb.BackgroundColor3 = C.btn tb.Text = "СМЕНИТЬ ТЕМУ" tb.TextColor3 = C.white tb.Font = Enum.Font.GothamBold tb.TextSize = 11 tb.BorderSizePixel = 0
        Instance.new("UICorner", tb).CornerRadius = UDim.new(0,4)
        Instance.new("UIStroke", tb).Thickness = 1.5 Instance.new("UIStroke", tb).Color = C.purple
        
        tb.MouseButton1Click:Connect(function()
            ti = ti % #themes + 1
            GUI.main.BackgroundColor3 = themes[ti].bg
            tt.Text = "🎨 Тема: " .. themes[ti].name
        end)
        
        -- Автор
        local authorLabel = Instance.new("TextLabel", pg)
        authorLabel.Size = UDim2.new(1,0,0,14) authorLabel.Position = UDim2.new(0,0,0,180) authorLabel.BackgroundTransparency = 1
        authorLabel.Text = "by Damir_drun67" authorLabel.TextColor3 = Color3.fromRGB(120,120,140) authorLabel.Font = Enum.Font.Gotham authorLabel.TextSize = 9 authorLabel.TextXAlignment = Enum.TextXAlignment.Center
    end
}
