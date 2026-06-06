return {
    start = function(GUI)
        local C = GUI.colors
        local pg = GUI.settings
        
        local lt = Instance.new("TextLabel", pg)
        lt.Size = UDim2.new(1,0,0,18)
        lt.BackgroundTransparency = 1
        lt.Text = "🌐 Язык: Русский"
        lt.TextColor3 = C.white
        lt.Font = Enum.Font.GothamBold
        lt.TextSize = 12
        lt.TextXAlignment = Enum.TextXAlignment.Left
        
        local lb = Instance.new("TextButton", pg)
        lb.Size = UDim2.new(1,0,0,30)
        lb.Position = UDim2.new(0,0,0,22)
        lb.BackgroundColor3 = C.btn
        lb.Text = "RU → EN"
        lb.TextColor3 = C.white
        lb.Font = Enum.Font.GothamBold
        lb.TextSize = 12
        lb.BorderSizePixel = 0
        Instance.new("UICorner", lb).CornerRadius = UDim.new(0,4)
        Instance.new("UIStroke", lb).Thickness = 1.5
        Instance.new("UIStroke", lb).Color = C.purple
        
        lb.MouseButton1Click:Connect(function()
            local currentLang = GUI.getLang()
            if currentLang == "RU" then
                GUI.setLang("EN")
                lb.Text = "EN → RU"
                lt.Text = "🌐 Language: English"
            else
                GUI.setLang("RU")
                lb.Text = "RU → EN"
                lt.Text = "🌐 Язык: Русский"
            end
        end)
        
        local themes = {
            {name = "Неон", bg = Color3.fromRGB(10,10,20)},
            {name = "Закат", bg = Color3.fromRGB(25,10,10)},
            {name = "Фиолет", bg = Color3.fromRGB(15,5,25)},
            {name = "Океан", bg = Color3.fromRGB(5,15,25)},
            {name = "Лес", bg = Color3.fromRGB(5,20,10)},
            {name = "Золото", bg = Color3.fromRGB(20,18,5)},
            {name = "Космос", bg = Color3.fromRGB(5,5,15)},
            {name = "Розовый", bg = Color3.fromRGB(25,10,20)},
            {name = "Красный", bg = Color3.fromRGB(30,10,10)},
            {name = "Лайм", bg = Color3.fromRGB(10,25,10)}
        }
        local ti = 1
        
        local tt = Instance.new("TextLabel", pg)
        tt.Size = UDim2.new(1,0,0,18)
        tt.Position = UDim2.new(0,0,0,62)
        tt.BackgroundTransparency = 1
        tt.Text = "🎨 Тема: Неон"
        tt.TextColor3 = C.white
        tt.Font = Enum.Font.GothamBold
        tt.TextSize = 12
        tt.TextXAlignment = Enum.TextXAlignment.Left
        
        local tb = Instance.new("TextButton", pg)
        tb.Size = UDim2.new(1,0,0,30)
        tb.Position = UDim2.new(0,0,0,84)
        tb.BackgroundColor3 = C.btn
        tb.Text = "СМЕНИТЬ ТЕМУ"
        tb.TextColor3 = C.white
        tb.Font = Enum.Font.GothamBold
        tb.TextSize = 12
        tb.BorderSizePixel = 0
        Instance.new("UICorner", tb).CornerRadius = UDim.new(0,4)
        Instance.new("UIStroke", tb).Thickness = 1.5
        Instance.new("UIStroke", tb).Color = C.purple
        
        tb.MouseButton1Click:Connect(function()
            ti = ti % #themes + 1
            GUI.main.BackgroundColor3 = themes[ti].bg
            tt.Text = "🎨 Тема: " .. themes[ti].name
        end)
    end
}
