return {
    start = function(GUI)
        local C = GUI.colors
        local pg = GUI.changelog
        
        local T = {
            RU = {title = "📋 ЧТО НОВОГО", text = [[v8.1:
✅ Прозрачность 25%
✅ Сворачивание и закрытие
✅ Яркие цвета интерфейса
✅ Смена языка
✅ 15 цветов интерфейса
✅ Funzone удалён
✅ Молот 200/-1500
✅ Автофарм с респавном]]},
            EN = {title = "📋 WHAT'S NEW", text = [[v8.1:
✅ 25% transparency
✅ Minimize & close
✅ Bright interface colors
✅ Language switch
✅ 15 interface colors
✅ Funzone removed
✅ Molot 200/-1500
✅ Auto farm with respawn]]}
        }
        
        local t = Instance.new("TextLabel", pg)
        t.Size = UDim2.new(1,0,0,18)
        t.BackgroundTransparency = 1
        t.TextColor3 = C.white
        t.Font = Enum.Font.GothamBold
        t.TextSize = 12
        t.TextXAlignment = Enum.TextXAlignment.Left
        
        local l = Instance.new("TextLabel", pg)
        l.Size = UDim2.new(1,0,0,240)
        l.Position = UDim2.new(0,0,0,22)
        l.BackgroundColor3 = C.side
        l.TextColor3 = C.white
        l.Font = Enum.Font.Gotham
        l.TextSize = 10
        l.TextXAlignment = Enum.TextXAlignment.Left
        l.TextYAlignment = Enum.TextYAlignment.Top
        Instance.new("UICorner", l).CornerRadius = UDim.new(0,5)
        
        local function updateTexts()
            local L = T[GUI.getLang()]
            t.Text = L.title
            l.Text = L.text
        end
        
        updateTexts()
    end
}
