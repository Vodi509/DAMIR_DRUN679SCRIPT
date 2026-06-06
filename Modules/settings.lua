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
        
        local lang = "RU"
        local lb = Instance.new("TextButton", pg)
        lb.Size = UDim2.new(1,0,0,30)
        lb.Position = UDim2.new(0,0,0,22)
        lb.BackgroundColor3 = C.btn
        lb.Text = "RU → EN"
        lb.TextColor3 = C.grey
        lb.Font = Enum.Font.GothamBold
        lb.TextSize = 12
        lb.BorderSizePixel = 0
        Instance.new("UICorner", lb).CornerRadius = UDim.new(0,4)
        Instance.new("UIStroke", lb).Thickness = 1.5
        Instance.new("UIStroke", lb).Color = Color3.fromRGB(0,0,0)
        
        lb.MouseButton1Click:Connect(function()
            if lang == "RU" then lang = "EN" lb.Text = "EN → RU" lt.Text = "🌐 Language: English"
            else lang = "RU" lb.Text = "RU → EN" lt.Text = "🌐 Язык: Русский" end
        end)
        
        local themes = {
            {name = "Неон", main = Color3.fromRGB(10,10,20), side = Color3.fromRGB(15,15,28), trans = 0.85},
            {name = "Закат", main = Color3.fromRGB(30,10,5), side = Color3.fromRGB(35,15,10), trans = 0.8},
            {name = "Фиолет", main = Color3.fromRGB(20,5,35), side = Color3.fromRGB(28,10,42), trans = 0.75},
            {name = "Океан", main = Color3.fromRGB(5,20,35), side = Color3.fromRGB(10,28,42), trans = 0.8},
            {name = "Лес", main = Color3.fromRGB(5,30,10), side = Color3.fromRGB(10,35,15), trans = 0.75},
            {name = "Золото", main = Color3.fromRGB(30,25,5), side = Color3.fromRGB(35,30,10), trans = 0.8},
            {name = "Космос", main = Color3.fromRGB(5,5,20), side = Color3.fromRGB(10,10,28), trans = 0.7},
            {name = "Розовый", main = Color3.fromRGB(30,5,25), side = Color3.fromRGB(35,10,30), trans = 0.75},
            {name = "Лава", main = Color3.fromRGB(35,10,0), side = Color3.fromRGB(40,15,5), trans = 0.8},
            {name = "Мята", main = Color3.fromRGB(5,25,20), side = Color3.fromRGB(10,30,25), trans = 0.75},
            {name = "Арктика", main = Color3.fromRGB(15,25,30), side = Color3.fromRGB(20,30,35), trans = 0.7},
            {name = "Вампир", main = Color3.fromRGB(25,5,10), side = Color3.fromRGB(30,10,15), trans = 0.8}
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
        tb.TextColor3 = C.grey
        tb.Font = Enum.Font.GothamBold
        tb.TextSize = 12
        tb.BorderSizePixel = 0
        Instance.new("UICorner", tb).CornerRadius = UDim.new(0,4)
        Instance.new("UIStroke", tb).Thickness = 1.5
        Instance.new("UIStroke", tb).Color = Color3.fromRGB(0,0,0)
        
        tb.MouseButton1Click:Connect(function()
            ti = ti % #themes + 1
            local theme = themes[ti]
            -- Меняем только фон окна и боковой панели
            GUI.main.BackgroundColor3 = theme.main
            GUI.main.BackgroundTransparency = theme.trans
            -- Ищем боковую панель и меняем её фон
            for _, child in pairs(GUI.main:GetChildren()) do
                if child:IsA("Frame") and child.Size.X.Scale == 0 and child.Size.X.Offset == 115 then
                    child.BackgroundColor3 = theme.side
                    child.BackgroundTransparency = theme.trans
                end
            end
            tt.Text = "🎨 Тема: " .. theme.name
        end)
    end
}
