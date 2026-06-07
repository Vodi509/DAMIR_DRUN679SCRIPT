return {
    start = function(GUI)
        local C = GUI.colors
        local pg = GUI.settings
        
        local themes = {
            {name = "Неон", bg = Color3.fromRGB(10,10,35)},{name = "Закат", bg = Color3.fromRGB(40,15,5)},{name = "Фиолет", bg = Color3.fromRGB(30,10,50)},{name = "Океан", bg = Color3.fromRGB(5,25,45)},{name = "Лес", bg = Color3.fromRGB(5,35,15)},{name = "Золото", bg = Color3.fromRGB(35,28,5)},{name = "Космос", bg = Color3.fromRGB(8,8,28)},{name = "Розовый", bg = Color3.fromRGB(42,12,28)},{name = "Красный", bg = Color3.fromRGB(48,12,12)},{name = "Лайм", bg = Color3.fromRGB(12,42,12)},{name = "Синий", bg = Color3.fromRGB(10,15,50)},{name = "Оранж", bg = Color3.fromRGB(48,25,5)},{name = "Бирюза", bg = Color3.fromRGB(5,40,38)},{name = "Малина", bg = Color3.fromRGB(42,8,22)},{name = "Слива", bg = Color3.fromRGB(30,10,35)}
        }
        local ti = GUI.saved.theme
        
        -- Применяем сохранённую тему
        GUI.main.BackgroundColor3 = themes[ti].bg
        
        local tt = Instance.new("TextLabel", pg)
        tt.Size = UDim2.new(1,0,0,18) tt.Position = UDim2.new(0,0,0,5) tt.BackgroundTransparency = 1
        tt.Text = "🎨 Тема: " .. themes[ti].name tt.TextColor3 = C.white tt.Font = Enum.Font.GothamBold tt.TextSize = 12 tt.TextXAlignment = Enum.TextXAlignment.Left
        
        local tb = Instance.new("TextButton", pg)
        tb.Size = UDim2.new(1,0,0,30) tb.Position = UDim2.new(0,0,0,25)
        tb.BackgroundColor3 = C.btn tb.Text = "СМЕНИТЬ ТЕМУ" tb.TextColor3 = C.white tb.Font = Enum.Font.GothamBold tb.TextSize = 12 tb.BorderSizePixel = 0
        Instance.new("UICorner", tb).CornerRadius = UDim.new(0,4)
        Instance.new("UIStroke", tb).Thickness = 1.5 Instance.new("UIStroke", tb).Color = C.purple
        
        tb.MouseButton1Click:Connect(function()
            ti = ti % #themes + 1
            GUI.main.BackgroundColor3 = themes[ti].bg
            tt.Text = "🎨 Тема: " .. themes[ti].name
            GUI.saveSettings(ti, GUI.ti2)
        end)
        
        -- Прозрачность
        local tl = Instance.new("TextLabel", pg)
        tl.Size = UDim2.new(1,0,0,18) tl.Position = UDim2.new(0,0,0,65) tl.BackgroundTransparency = 1
        tl.Text = "🔍 Прозрачность: " .. GUI.tn[GUI.ti2] tl.TextColor3 = C.white tl.Font = Enum.Font.GothamBold tl.TextSize = 12 tl.TextXAlignment = Enum.TextXAlignment.Left
        
        local trBtn = Instance.new("TextButton", pg)
        trBtn.Size = UDim2.new(1,0,0,30) trBtn.Position = UDim2.new(0,0,0,85)
        trBtn.BackgroundColor3 = C.btn trBtn.Text = GUI.tn[GUI.ti2] trBtn.TextColor3 = C.white trBtn.Font = Enum.Font.GothamBold trBtn.TextSize = 12 trBtn.BorderSizePixel = 0
        Instance.new("UICorner", trBtn).CornerRadius = UDim.new(0,4)
        Instance.new("UIStroke", trBtn).Thickness = 1.5 Instance.new("UIStroke", trBtn).Color = C.purple
        
        trBtn.MouseButton1Click:Connect(function()
            GUI.ti2 = GUI.ti2 % #GUI.to + 1
            local val = GUI.to[GUI.ti2]
            GUI.updateTrans(GUI.ti2, val)
            trBtn.Text = GUI.tn[GUI.ti2]
            tl.Text = "🔍 Прозрачность: " .. GUI.tn[GUI.ti2]
            GUI.saveSettings(ti, GUI.ti2)
        end)
    end
}
