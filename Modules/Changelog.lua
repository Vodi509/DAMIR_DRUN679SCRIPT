return {
    start = function(GUI)
        local C = GUI.colors
        local pg = GUI.changelog
        
        local t = Instance.new("TextLabel", pg)
        t.Size = UDim2.new(1,0,0,18)
        t.BackgroundTransparency = 1
        t.Text = "📋 ЧТО НОВОГО"
        t.TextColor3 = C.white
        t.Font = Enum.Font.GothamBold
        t.TextSize = 12
        t.TextXAlignment = Enum.TextXAlignment.Left
        
        local l = Instance.new("TextLabel", pg)
        l.Size = UDim2.new(1,0,0,240)
        l.Position = UDim2.new(0,0,0,22)
        l.BackgroundColor3 = C.side
        l.Text = [[v8.1 - Обновление:
✅ Прозрачность 25%
✅ Сворачивание и закрытие
✅ Яркие цвета GUI
✅ Починен смена языка
✅ Починен смена темы
✅ 10 цветов интерфейса
✅ Анекдоты вместо мемов
✅ Убран ползунок прозрачности
✅ Молот 200/-1500
✅ Автофарм с респавном]]
        l.TextColor3 = C.white
        l.Font = Enum.Font.Gotham
        l.TextSize = 10
        l.TextXAlignment = Enum.TextXAlignment.Left
        l.TextYAlignment = Enum.TextYAlignment.Top
        Instance.new("UICorner", l).CornerRadius = UDim.new(0,5)
    end
}
