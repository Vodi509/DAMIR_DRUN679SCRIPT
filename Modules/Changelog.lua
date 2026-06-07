return {
    start = function(GUI)
        local C = GUI.colors
        local pg = GUI.changelog
        
        local t = Instance.new("TextLabel", pg)
        t.Size = UDim2.new(1,0,0,18)
        t.BackgroundTransparency = 1
        t.Text = "📋 ЧТО НОВОГО v8.4"
        t.TextColor3 = C.white
        t.Font = Enum.Font.GothamBold
        t.TextSize = 12
        t.TextXAlignment = Enum.TextXAlignment.Left
        
        local l = Instance.new("TextLabel", pg)
        l.Size = UDim2.new(1,0,0,240)
        l.Position = UDim2.new(0,0,0,22)
        l.BackgroundColor3 = C.side
        l.Text = [[v8.4:
✅ Молот: высота 100-500 | сила 500-3000
✅ Анти-застревание (автореспавн)
✅ Автофарм с циклом 20 ударов
✅ Респавн кликом (45/40)
✅ Прозрачность 25%
✅ 15 цветов интерфейса
✅ Сворачивание и закрытие
✅ Компактное расположение кнопок

📊 Статистика:
Ударов | Сломано | Авто-циклов]]
        l.TextColor3 = C.white
        l.Font = Enum.Font.Gotham
        l.TextSize = 10
        l.TextXAlignment = Enum.TextXAlignment.Left
        l.TextYAlignment = Enum.TextYAlignment.Top
        Instance.new("UICorner", l).CornerRadius = UDim.new(0,5)
    end
}
