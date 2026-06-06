return {
    start = function(gui)
        local C = gui.colors
        local page = gui.settings
        
        local langTitle = Instance.new("TextLabel", page)
        langTitle.Size = UDim2.new(1,0,0,18)
        langTitle.BackgroundTransparency = 1
        langTitle.Text = "🌐 Язык: Русский"
        langTitle.TextColor3 = C.white
        langTitle.Font = Enum.Font.GothamBold
        langTitle.TextSize = 12
        langTitle.TextXAlignment = Enum.TextXAlignment.Left
        
        local lang = "RU"
        local langBtn = Instance.new("TextButton", page)
        langBtn.Size = UDim2.new(1,0,0,30)
        langBtn.Position = UDim2.new(0,0,0,22)
        langBtn.BackgroundColor3 = C.btn
        langBtn.Text = "RU → EN"
        langBtn.TextColor3 = C.grey
        langBtn.Font = Enum.Font.GothamBold
        langBtn.TextSize = 12
        langBtn.BorderSizePixel = 0
        Instance.new("UICorner", langBtn).CornerRadius = UDim.new(0,4)
        
        langBtn.MouseButton1Click:Connect(function()
            if lang == "RU" then
                lang = "EN"
                langBtn.Text = "EN → RU"
                langTitle.Text = "🌐 Language: English"
            else
                lang = "RU"
                langBtn.Text = "RU → EN"
                langTitle.Text = "🌐 Язык: Русский"
            end
        end)
        
        local themes = {
            {name = "Стандарт", bg = Color3.fromRGB(18,18,24)},
            {name = "Красный", bg = Color3.fromRGB(24,15,15)},
            {name = "Зелёный", bg = Color3.fromRGB(15,24,15)},
            {name = "Синий", bg = Color3.fromRGB(15,15,24)},
            {name = "Золотой", bg = Color3.fromRGB(24,22,10)}
        }
        local ti = 1
        
        local themeTitle = Instance.new("TextLabel", page)
        themeTitle.Size = UDim2.new(1,0,0,18)
        themeTitle.Position = UDim2.new(0,0,0,62)
        themeTitle.BackgroundTransparency = 1
        themeTitle.Text = "🎨 Тема: Стандарт"
        themeTitle.TextColor3 = C.white
        themeTitle.Font = Enum.Font.GothamBold
        themeTitle.TextSize = 12
        themeTitle.TextXAlignment = Enum.TextXAlignment.Left
        
        local themeBtn = Instance.new("TextButton", page)
        themeBtn.Size = UDim2.new(1,0,0,30)
        themeBtn.Position = UDim2.new(0,0,0,84)
        themeBtn.BackgroundColor3 = C.btn
        themeBtn.Text = "СМЕНИТЬ ТЕМУ"
        themeBtn.TextColor3 = C.grey
        themeBtn.Font = Enum.Font.GothamBold
        themeBtn.TextSize = 12
        themeBtn.BorderSizePixel = 0
        Instance.new("UICorner", themeBtn).CornerRadius = UDim.new(0,4)
        
        themeBtn.MouseButton1Click:Connect(function()
            ti = ti % #themes + 1
            gui.main.BackgroundColor3 = themes[ti].bg
            themeTitle.Text = "🎨 Тема: " .. themes[ti].name
        end)
    end
}
