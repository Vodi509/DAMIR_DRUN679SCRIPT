return {
    start = function(gui)
        local C = gui.colors
        local page = gui.changelog
        
        local title = Instance.new("TextLabel", page)
        title.Size = UDim2.new(1,0,0,18)
        title.BackgroundTransparency = 1
        title.Text = "📋 ЧТО НОВОГО"
        title.TextColor3 = C.white
        title.Font = Enum.Font.GothamBold
        title.TextSize = 12
        title.TextXAlignment = Enum.TextXAlignment.Left
        
        local text = Instance.new("TextLabel", page)
        text.Size = UDim2.new(1,0,0,240)
        text.Position = UDim2.new(0,0,0,22)
        text.BackgroundColor3 = C.side
        text.Text = [[
v8.0 (новый скрипт):
✅ Всё с нуля
✅ Молот 200/-1500
✅ Автофарм с респавном 45/40
✅ Fun Zone +100M AURA
✅ Мем-генератор
✅ Смена языка RU↔EN
✅ Смена темы (5 цветов)
✅ Вкладка "Что нового"

Планируется:
⏳ Сворачивание
⏳ Больше мемов
⏳ Выбор машин
]]
        text.TextColor3 = C.grey
        text.Font = Enum.Font.Gotham
        text.TextSize = 10
        text.TextXAlignment = Enum.TextXAlignment.Left
        text.TextYAlignment = Enum.TextYAlignment.Top
        Instance.new("UICorner", text).CornerRadius = UDim.new(0,5)
    end
}
