return {
    start = function(GUI)
        local C = GUI.colors
        local pg = GUI.settings
        
        -- Заголовок языка
        local lt = Instance.new("TextLabel", pg)
        lt.Size = UDim2.new(1,0,0,18)
        lt.BackgroundTransparency = 1
        lt.Text = "🌐 Язык: Русский"
        lt.TextColor3 = C.white
        lt.Font = Enum.Font.GothamBold
        lt.TextSize = 12
        lt.TextXAlignment = Enum.TextXAlignment.Left
        
        local lang = "RU"
        local translations = {
            RU = {
                lang = "🌐 Язык: Русский",
                langBtn = "RU → EN",
                theme = "🎨 Тема: ",
                themeBtn = "СМЕНИТЬ ТЕМУ",
                farm = "🚀 Фарм",
                fun = "🤡 Fun",
                settings = "⚙️ Настр",
                log = "📋 Новое",
                hammer = "🔨 ВКЛЮЧИТЬ МОЛОТ",
                hammerOn = "🔨 МОЛОТ АКТИВИРОВАН",
                auto = "🤖 АВТО-ФАРМ",
                autoOn = "🤖 АВТО-ФАРМ АКТИВИРОВАН",
                car = "🚗 Ищу машину...",
                sit = "🚗 Сядьте в машину!",
                respawn = "🚗 Респавн...",
                destroyed = "💀 Уничтожена!",
                aura = "💎 Аура: ",
                auraBtn = "✨ ДАМИР +100M AURA",
                meme = "СЛЕДУЮЩИЙ МЕМ",
                changelog = "📋 ЧТО НОВОГО"
            },
            EN = {
                lang = "🌐 Language: English",
                langBtn = "EN → RU",
                theme = "🎨 Theme: ",
                themeBtn = "CHANGE THEME",
                farm = "🚀 Farm",
                fun = "🤡 Fun",
                settings = "⚙️ Settings",
                log = "📋 News",
                hammer = "🔨 START HAMMER",
                hammerOn = "🔨 HAMMER ACTIVE",
                auto = "🤖 AUTO FARM",
                autoOn = "🤖 AUTO FARM ACTIVE",
                car = "🚗 Looking for car...",
                sit = "🚗 Sit in a car!",
                respawn = "🚗 Respawning...",
                destroyed = "💀 Destroyed!",
                aura = "💎 Aura: ",
                auraBtn = "✨ DAMIR +100M AURA",
                meme = "NEXT MEME",
                changelog = "📋 WHAT'S NEW"
            }
        }
        
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
        
        -- Яркие темы
        local themes = {
            {name = "Неон", bg = Color3.fromRGB(10,10,20), accent = Color3.fromRGB(0,255,200)},
            {name = "Закат", bg = Color3.fromRGB(25,10,10), accent = Color3.fromRGB(255,100,50)},
            {name = "Фиолет", bg = Color3.fromRGB(15,5,25), accent = Color3.fromRGB(180,50,255)},
            {name = "Океан", bg = Color3.fromRGB(5,15,25), accent = Color3.fromRGB(0,150,255)},
            {name = "Лес", bg = Color3.fromRGB(5,20,10), accent = Color3.fromRGB(0,255,100)},
            {name = "Золото", bg = Color3.fromRGB(20,18,5), accent = Color3.fromRGB(255,200,0)},
            {name = "Космос", bg = Color3.fromRGB(5,5,15), accent = Color3.fromRGB(100,100,255)}
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
        
        lb.MouseButton1Click:Connect(function()
            if lang == "RU" then
                lang = "EN"
            else
                lang = "RU"
            end
            local T = translations[lang]
            lb.Text = T.langBtn
            lt.Text = T.lang
            tb.Text = T.themeBtn
        end)
        
        tb.MouseButton1Click:Connect(function()
            ti = ti % #themes + 1
            local theme = themes[ti]
            GUI.main.BackgroundColor3 = theme.bg
            tt.Text = "🎨 Тема: " .. theme.name
        end)
    end
}
