return {
    start = function(GUI)
        local C = GUI.colors
        local pg = GUI.settings
        
        -- Язык
        local lt = Instance.new("TextLabel", pg)
        lt.Size = UDim2.new(1,0,0,16)
        lt.BackgroundTransparency = 1
        lt.Text = "🌐 Язык: Русский"
        lt.TextColor3 = C.white
        lt.Font = Enum.Font.GothamBold
        lt.TextSize = 11
        lt.TextXAlignment = Enum.TextXAlignment.Left
        
        local lang = "RU"
        local lb = Instance.new("TextButton", pg)
        lb.Size = UDim2.new(1,0,0,26)
        lb.Position = UDim2.new(0,0,0,18)
        lb.BackgroundColor3 = C.btn
        lb.Text = "RU → EN"
        lb.TextColor3 = C.grey
        lb.Font = Enum.Font.GothamBold
        lb.TextSize = 11
        lb.BorderSizePixel = 0
        Instance.new("UICorner", lb).CornerRadius = UDim.new(0,4)
        Instance.new("UIStroke", lb).Thickness = 1.5
        Instance.new("UIStroke", lb).Color = Color3.fromRGB(0,0,0)
        
        lb.MouseButton1Click:Connect(function()
            if lang == "RU" then lang = "EN" lb.Text = "EN → RU" lt.Text = "🌐 Language: English"
            else lang = "RU" lb.Text = "RU → EN" lt.Text = "🌐 Язык: Русский" end
        end)
        
        -- Темы
        local themes = {
            {name = "Стандарт", main = Color3.fromRGB(18,18,24), side = Color3.fromRGB(24,24,32)},
            {name = "Красный", main = Color3.fromRGB(40,10,10), side = Color3.fromRGB(50,15,15)},
            {name = "Оранж", main = Color3.fromRGB(40,20,5), side = Color3.fromRGB(50,28,10)},
            {name = "Золотой", main = Color3.fromRGB(35,28,5), side = Color3.fromRGB(45,35,10)},
            {name = "Жёлтый", main = Color3.fromRGB(38,38,8), side = Color3.fromRGB(48,48,14)},
            {name = "Лайм", main = Color3.fromRGB(15,35,8), side = Color3.fromRGB(20,45,12)},
            {name = "Зелёный", main = Color3.fromRGB(8,35,12), side = Color3.fromRGB(12,45,18)},
            {name = "Мятный", main = Color3.fromRGB(8,35,28), side = Color3.fromRGB(12,45,35)},
            {name = "Голубой", main = Color3.fromRGB(8,28,40), side = Color3.fromRGB(12,35,50)},
            {name = "Синий", main = Color3.fromRGB(8,12,40), side = Color3.fromRGB(12,18,50)},
            {name = "Фиолет", main = Color3.fromRGB(25,8,40), side = Color3.fromRGB(35,12,50)},
            {name = "Пурпур", main = Color3.fromRGB(35,8,30), side = Color3.fromRGB(45,12,38)},
            {name = "Розовый", main = Color3.fromRGB(40,8,25), side = Color3.fromRGB(50,12,32)},
            {name = "Космос", main = Color3.fromRGB(5,5,18), side = Color3.fromRGB(10,10,26)},
            {name = "Закат", main = Color3.fromRGB(38,15,5), side = Color3.fromRGB(48,22,10)}
        }
        local ti = 1
        
        local tt = Instance.new("TextLabel", pg)
        tt.Size = UDim2.new(1,0,0,16)
        tt.Position = UDim2.new(0,0,0,52)
        tt.BackgroundTransparency = 1
        tt.Text = "🎨 Тема: Стандарт"
        tt.TextColor3 = C.white
        tt.Font = Enum.Font.GothamBold
        tt.TextSize = 11
        tt.TextXAlignment = Enum.TextXAlignment.Left
        
        local tb = Instance.new("TextButton", pg)
        tb.Size = UDim2.new(1,0,0,26)
        tb.Position = UDim2.new(0,0,0,70)
        tb.BackgroundColor3 = C.btn
        tb.Text = "СМЕНИТЬ ТЕМУ"
        tb.TextColor3 = C.grey
        tb.Font = Enum.Font.GothamBold
        tb.TextSize = 11
        tb.BorderSizePixel = 0
        Instance.new("UICorner", tb).CornerRadius = UDim.new(0,4)
        Instance.new("UIStroke", tb).Thickness = 1.5
        Instance.new("UIStroke", tb).Color = Color3.fromRGB(0,0,0)
        
        -- Прозрачность
        local transVal = 0
        local transLabel = Instance.new("TextLabel", pg)
        transLabel.Size = UDim2.new(1,0,0,16)
        transLabel.Position = UDim2.new(0,0,0,104)
        transLabel.BackgroundTransparency = 1
        transLabel.Text = "🔍 Прозрачность: 0%"
        transLabel.TextColor3 = C.white
        transLabel.Font = Enum.Font.GothamBold
        transLabel.TextSize = 11
        transLabel.TextXAlignment = Enum.TextXAlignment.Left
        
        local transBar = Instance.new("Frame", pg)
        transBar.Size = UDim2.new(1,0,0,20)
        transBar.Position = UDim2.new(0,0,0,122)
        transBar.BackgroundColor3 = C.side
        transBar.BorderSizePixel = 0
        Instance.new("UICorner", transBar).CornerRadius = UDim.new(0,10)
        Instance.new("UIStroke", transBar).Thickness = 1.5
        Instance.new("UIStroke", transBar).Color = Color3.fromRGB(0,0,0)
        
        local transFill = Instance.new("Frame", transBar)
        transFill.Size = UDim2.new(0,0,1,0)
        transFill.BackgroundColor3 = C.purple
        transFill.BorderSizePixel = 0
        Instance.new("UICorner", transFill).CornerRadius = UDim.new(0,10)
        
        local transBtn = Instance.new("TextButton", transBar)
        transBtn.Size = UDim2.new(0,24,1,0)
        transBtn.BackgroundColor3 = C.white
        transBtn.Text = ""
        transBtn.BorderSizePixel = 0
        Instance.new("UICorner", transBtn).CornerRadius = UDim.new(0,12)
        Instance.new("UIStroke", transBtn).Thickness = 1.5
        Instance.new("UIStroke", transBtn).Color = Color3.fromRGB(0,0,0)
        
        local function updateTransparency(percent)
            transVal = percent
            local alpha = percent / 100
            GUI.main.BackgroundTransparency = alpha
            for _, child in pairs(GUI.main:GetChildren()) do
                if child:IsA("Frame") and child.Size.X.Scale == 0 and child.Size.X.Offset == 115 then
                    child.BackgroundTransparency = alpha
                end
            end
            transFill.Size = UDim2.new(percent/100,0,1,0)
            transBtn.Position = UDim2.new(percent/100,-12,0,0)
            transLabel.Text = "🔍 Прозрачность: " .. percent .. "%"
        end
        
        local dragging = false
        transBtn.MouseButton1Down:Connect(function()
            dragging = true
        end)
        transBar.MouseButton1Down:Connect(function(x)
            dragging = true
            local barPos = transBar.AbsolutePosition.X
            local barSize = transBar.AbsoluteSize.X
            local percent = math.clamp((x - barPos) / barSize * 100, 0, 100)
            updateTransparency(math.floor(percent))
        end)
        game:GetService("UserInputService").InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = false
            end
        end)
        game:GetService("UserInputService").InputChanged:Connect(function(input)
            if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                local barPos = transBar.AbsolutePosition.X
                local barSize = transBar.AbsoluteSize.X
                local percent = math.clamp((input.Position.X - barPos) / barSize * 100, 0, 100)
                updateTransparency(math.floor(percent))
            end
        end)
        
        tb.MouseButton1Click:Connect(function()
            ti = ti % #themes + 1
            local theme = themes[ti]
            GUI.main.BackgroundColor3 = theme.main
            for _, child in pairs(GUI.main:GetChildren()) do
                if child:IsA("Frame") and child.Size.X.Scale == 0 and child.Size.X.Offset == 115 then
                    child.BackgroundColor3 = theme.side
                end
            end
            tt.Text = "🎨 Тема: " .. theme.name
        end)
    end
}
