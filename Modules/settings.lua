return {
    start = function(GUI)
        local C = GUI.colors
        local pg = GUI.settings
        local plr = game.Players.LocalPlayer
        
        local st = Instance.new("TextLabel", pg)
        st.Size = UDim2.new(1,0,0,18) st.BackgroundTransparency = 1
        st.Text = "⚙️ НАСТРОЙКИ" st.TextColor3 = C.gold st.Font = Enum.Font.GothamBold st.TextSize = 12 st.TextXAlignment = Enum.TextXAlignment.Center
        
        -- Смена темы
        local tt = Instance.new("TextLabel", pg)
        tt.Size = UDim2.new(1,0,0,16) tt.Position = UDim2.new(0,0,0,24) tt.BackgroundTransparency = 1
        tt.Text = "🎨 Тема: Неон" tt.TextColor3 = C.white tt.Font = Enum.Font.GothamBold tt.TextSize = 11 tt.TextXAlignment = Enum.TextXAlignment.Left
        
        local themes = {
            {name = "Неон", bg = Color3.fromRGB(10,10,35)},{name = "Закат", bg = Color3.fromRGB(40,15,5)},{name = "Фиолет", bg = Color3.fromRGB(30,10,50)},{name = "Океан", bg = Color3.fromRGB(5,25,45)},{name = "Лес", bg = Color3.fromRGB(5,35,15)},{name = "Золото", bg = Color3.fromRGB(35,28,5)},{name = "Космос", bg = Color3.fromRGB(8,8,28)},{name = "Розовый", bg = Color3.fromRGB(42,12,28)},{name = "Красный", bg = Color3.fromRGB(48,12,12)},{name = "Лайм", bg = Color3.fromRGB(12,42,12)},{name = "Синий", bg = Color3.fromRGB(10,15,50)},{name = "Оранж", bg = Color3.fromRGB(48,25,5)},{name = "Бирюза", bg = Color3.fromRGB(5,40,38)},{name = "Малина", bg = Color3.fromRGB(42,8,22)},{name = "Слива", bg = Color3.fromRGB(30,10,35)}
        }
        local ti = 1
        
        local tb = Instance.new("TextButton", pg)
        tb.Size = UDim2.new(1,0,0,26) tb.Position = UDim2.new(0,0,0,42)
        tb.BackgroundColor3 = C.btn tb.Text = "СМЕНИТЬ ТЕМУ" tb.TextColor3 = C.white tb.Font = Enum.Font.GothamBold tb.TextSize = 11 tb.BorderSizePixel = 0
        Instance.new("UICorner", tb).CornerRadius = UDim.new(0,4)
        Instance.new("UIStroke", tb).Thickness = 1.5 Instance.new("UIStroke", tb).Color = C.purple
        
        tb.MouseButton1Click:Connect(function()
            ti = ti % #themes + 1
            GUI.main.BackgroundColor3 = themes[ti].bg
            tt.Text = "🎨 Тема: " .. themes[ti].name
        end)
        
        -- Скрыть кнопки игры
        local gameUIHidden = false
        local savedStates = {}
        
        local uiLabel = Instance.new("TextLabel", pg)
        uiLabel.Size = UDim2.new(1,0,0,16) uiLabel.Position = UDim2.new(0,0,0,76) uiLabel.BackgroundTransparency = 1
        uiLabel.Text = "👁️ Кнопки игры: ВИДНЫ" uiLabel.TextColor3 = C.white uiLabel.Font = Enum.Font.GothamBold uiLabel.TextSize = 11 uiLabel.TextXAlignment = Enum.TextXAlignment.Left
        
        local uiBtn = Instance.new("TextButton", pg)
        uiBtn.Size = UDim2.new(1,0,0,26) uiBtn.Position = UDim2.new(0,0,0,94)
        uiBtn.BackgroundColor3 = C.btn uiBtn.Text = "СКРЫТЬ КНОПКИ ИГРЫ" uiBtn.TextColor3 = C.white uiBtn.Font = Enum.Font.GothamBold uiBtn.TextSize = 11 uiBtn.BorderSizePixel = 0
        Instance.new("UICorner", uiBtn).CornerRadius = UDim.new(0,4)
        Instance.new("UIStroke", uiBtn).Thickness = 1.5 Instance.new("UIStroke", uiBtn).Color = C.purple
        
        local function hideGameButtons()
            savedStates = {}
            local pg = plr:WaitForChild("PlayerGui")
            for _, gui in pairs(pg:GetChildren()) do
                if gui:IsA("ScreenGui") and gui.Name ~= "DamirHub" and gui.Name ~= "DamirMini" then
                    for _, obj in pairs(gui:GetDescendants()) do
                        if (obj:IsA("TextButton") or obj:IsA("ImageButton")) and obj.Visible then
                            table.insert(savedStates, {object = obj, visible = obj.Visible, active = obj.Active})
                            obj.Visible = false
                            obj.Active = false
                        end
                    end
                end
            end
        end
        
        local function showGameButtons()
            for _, state in pairs(savedStates) do
                if state.object and state.object.Parent then
                    state.object.Visible = state.visible
                    state.object.Active = state.active
                end
            end
            savedStates = {}
        end
        
        uiBtn.MouseButton1Click:Connect(function()
            gameUIHidden = not gameUIHidden
            if gameUIHidden then
                hideGameButtons()
                uiLabel.Text = "👁️ Кнопки игры: СКРЫТЫ"
                uiBtn.Text = "ПОКАЗАТЬ КНОПКИ ИГРЫ"
            else
                showGameButtons()
                uiLabel.Text = "👁️ Кнопки игры: ВИДНЫ"
                uiBtn.Text = "СКРЫТЬ КНОПКИ ИГРЫ"
            end
        end)
        
        local hintLabel = Instance.new("TextLabel", pg)
        hintLabel.Size = UDim2.new(1,0,0,20) hintLabel.Position = UDim2.new(0,0,0,130) hintLabel.BackgroundTransparency = 1
        hintLabel.Text = "💡 Автофарм работает\nдаже при скрытых кнопках" hintLabel.TextColor3 = Color3.fromRGB(255,180,50) hintLabel.Font = Enum.Font.Gotham hintLabel.TextSize = 9 hintLabel.TextXAlignment = Enum.TextXAlignment.Center
        
        -- Автор
        local authorLabel = Instance.new("TextLabel", pg)
        authorLabel.Size = UDim2.new(1,0,0,14) authorLabel.Position = UDim2.new(0,0,0,160) authorLabel.BackgroundTransparency = 1
        authorLabel.Text = "by Damir_drun67" authorLabel.TextColor3 = Color3.fromRGB(120,120,140) authorLabel.Font = Enum.Font.Gotham authorLabel.TextSize = 9 authorLabel.TextXAlignment = Enum.TextXAlignment.Center
    end
}
