return {
    start = function(GUI)
        local C = GUI.colors
        local pg = GUI.fun
        
        local t = Instance.new("TextLabel", pg)
        t.Size = UDim2.new(1,0,0,18)
        t.BackgroundTransparency = 1
        t.Text = "🤣 АНЕКДОТЫ"
        t.TextColor3 = C.gold
        t.Font = Enum.Font.GothamBold
        t.TextSize = 12
        t.TextXAlignment = Enum.TextXAlignment.Left
        
        local jokes = {
            "Почему машина не заводится?\nПотому что ты её ещё не купил! 🚗💨",
            "В автосервисе:\n— Что с машиной?\n— Она говорит 'вррр-вррр-пшшш'\n— Это серьёзно, таких звуков нет даже в инструкции! 🔧",
            "Еду я значит по встречке...\nНикого не трогаю...\nА они сигналят! 😤",
            "Купил машину за миллион.\nТеперь ем доширак.\nЗато с подогревом сидений! 🍜",
            "На заправке:\n— Вам полный?\n— Нет, мне до работы, а вам? 🤡",
            "Механик сказал: 'Будет готово завтра'.\nЭто было в 2019 году.\nМашина всё ещё там... 😱",
            "Тормоза придумали трусы!\nАга, сказал он и уехал в кювет. 🕳️",
            "Жена просит новую машину.\nЯ говорю: 'Давай подождём'\nОна: 'Чего?'\nЯ: 'Пока эта сломается'\nОбиделась. 💔",
            "Полицейский:\n— Почему вы превысили скорость?\n— Я не превышал, я просто проверял работает ли спидометр! 🚔",
            "Сосед купил новую машину.\nТеперь моя старая меня ненавидит.\nЯ чувствую это каждое утро. 😢",
            "Самая быстрая машина?\nТа, которую только что помыли!\nОна летит как новая! ✨",
            "Девушка спрашивает:\n— Ты меня любишь?\n— Конечно!\n— А почему тогда машину называешь 'моя крошка'?\nЗавис... 😳"
        }
        
        local jokeText = Instance.new("TextLabel", pg)
        jokeText.Size = UDim2.new(1,0,0,200)
        jokeText.Position = UDim2.new(0,0,0,24)
        jokeText.BackgroundColor3 = C.side
        jokeText.TextColor3 = C.white
        jokeText.Font = Enum.Font.Gotham
        jokeText.TextSize = 11
        jokeText.TextXAlignment = Enum.TextXAlignment.Left
        jokeText.TextYAlignment = Enum.TextYAlignment.Top
        jokeText.TextWrapped = true
        Instance.new("UICorner", jokeText).CornerRadius = UDim.new(0,5)
        jokeText.Text = jokes[1]
        
        local jokeBtn = Instance.new("TextButton", pg)
        jokeBtn.Size = UDim2.new(1,0,0,32)
        jokeBtn.Position = UDim2.new(0,0,0,232)
        jokeBtn.BackgroundColor3 = C.btn
        jokeBtn.Text = "СЛЕДУЮЩИЙ АНЕКДОТ 🤣"
        jokeBtn.TextColor3 = C.white
        jokeBtn.Font = Enum.Font.GothamBold
        jokeBtn.TextSize = 11
        jokeBtn.BorderSizePixel = 0
        Instance.new("UICorner", jokeBtn).CornerRadius = UDim.new(0,4)
        
        jokeBtn.MouseButton1Click:Connect(function()
            local randomJoke = jokes[math.random(1, #jokes)]
            jokeText.Text = randomJoke
        end)
        
        local counter = 0
        local counterLabel = Instance.new("TextLabel", pg)
        counterLabel.Size = UDim2.new(1,0,0,18)
        counterLabel.Position = UDim2.new(0,0,0,270)
        counterLabel.BackgroundTransparency = 1
        counterLabel.Text = "Прочитано анекдотов: 0"
        counterLabel.TextColor3 = C.gold
        counterLabel.Font = Enum.Font.GothamBold
        counterLabel.TextSize = 10
        counterLabel.TextXAlignment = Enum.TextXAlignment.Center
        
        jokeBtn.MouseButton1Click:Connect(function()
            counter = counter + 1
            counterLabel.Text = "Прочитано анекдотов: " .. counter
        end)
    end
}
