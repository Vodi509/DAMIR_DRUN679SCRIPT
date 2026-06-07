return {
    start = function(GUI)
        local C = GUI.colors
        local pg = GUI.settings
        
        for _, v in pairs(pg:GetChildren()) do v:Destroy() end
        
        local title = Instance.new("TextLabel", pg)
        title.Size = UDim2.new(1,0,0,18)
        title.BackgroundTransparency = 1
        title.Text = "⚙ НАСТРОЙКИ"
        title.TextColor3 = C.white
        title.Font = Enum.Font.GothamBold
        title.TextSize = 12
        title.TextXAlignment = Enum.TextXAlignment.Left
        
        local yOffset = 22
        local rowH = 32
        
        -- ВЫСОТА МОЛОТА
        local hLabel = Instance.new("TextLabel", pg)
        hLabel.Size = UDim2.new(0.4,0,0,rowH)
        hLabel.Position = UDim2.new(0,0,0,yOffset)
        hLabel.BackgroundTransparency = 1
        hLabel.Text = "🔨 Высота:"
        hLabel.TextColor3 = C.white
        hLabel.Font = Enum.Font.Gotham
        hLabel.TextSize = 11
        
        local hValue = Instance.new("TextLabel", pg)
        hValue.Size = UDim2.new(0.15,0,0,rowH)
        hValue.Position = UDim2.new(0.4,0,0,yOffset)
        hValue.BackgroundColor3 = C.side
        hValue.Text = tostring(GUI.hammerHeight or 200)
        hValue.TextColor3 = C.white
        hValue.Font = Enum.Font.GothamBold
        hValue.TextSize = 11
        Instance.new("UICorner", hValue).CornerRadius = UDim.new(0,4)
        
        local hDown = Instance.new("TextButton", pg)
        hDown.Size = UDim2.new(0.1,0,0,rowH)
        hDown.Position = UDim2.new(0.57,0,0,yOffset)
        hDown.BackgroundColor3 = C.btn
        hDown.Text = "-10"
        hDown.TextColor3 = C.white
        hDown.Font = Enum.Font.GothamBold
        hDown.TextSize = 10
        Instance.new("UICorner", hDown).CornerRadius = UDim.new(0,4)
        
        local hUp = Instance.new("TextButton", pg)
        hUp.Size = UDim2.new(0.1,0,0,rowH)
        hUp.Position = UDim2.new(0.69,0,0,yOffset)
        hUp.BackgroundColor3 = C.btn
        hUp.Text = "+10"
        hUp.TextColor3 = C.white
        hUp.Font = Enum.Font.GothamBold
        hUp.TextSize = 10
        Instance.new("UICorner", hUp).CornerRadius = UDim.new(0,4)
        
        -- СИЛА УДАРА
        local pLabel = Instance.new("TextLabel", pg)
        pLabel.Size = UDim2.new(0.4,0,0,rowH)
        pLabel.Position = UDim2.new(0,0,0,yOffset+rowH+4)
        pLabel.BackgroundTransparency = 1
        pLabel.Text = "💪 Сила:"
        pLabel.TextColor3 = C.white
        pLabel.Font = Enum.Font.Gotham
        pLabel.TextSize = 11
        
        local pValue = Instance.new("TextLabel", pg)
        pValue.Size = UDim2.new(0.15,0,0,rowH)
        pValue.Position = UDim2.new(0.4,0,0,yOffset+rowH+4)
        pValue.BackgroundColor3 = C.side
        pValue.Text = tostring(GUI.hammerSpeed or 1500)
        pValue.TextColor3 = C.white
        pValue.Font = Enum.Font.GothamBold
        pValue.TextSize = 11
        Instance.new("UICorner", pValue).CornerRadius = UDim.new(0,4)
        
        local pDown = Instance.new("TextButton", pg)
        pDown.Size = UDim2.new(0.1,0,0,rowH)
        pDown.Position = UDim2.new(0.57,0,0,yOffset+rowH+4)
        pDown.BackgroundColor3 = C.btn
        pDown.Text = "-50"
        pDown.TextColor3 = C.white
        pDown.Font = Enum.Font.GothamBold
        pDown.TextSize = 10
        Instance.new("UICorner", pDown).CornerRadius = UDim.new(0,4)
        
        local pUp = Instance.new("TextButton", pg)
        pUp.Size = UDim2.new(0.1,0,0,rowH)
        pUp.Position = UDim2.new(0.69,0,0,yOffset+rowH+4)
        pUp.BackgroundColor3 = C.btn
        pUp.Text = "+50"
        pUp.TextColor3 = C.white
        pUp.Font = Enum.Font.GothamBold
        pUp.TextSize = 10
        Instance.new("UICorner", pUp).CornerRadius = UDim.new(0,4)
        
        -- ===== NOCLIP =====
        local noclipBtn = Instance.new("TextButton", pg)
        noclipBtn.Size = UDim2.new(0.48,0,0,rowH)
        noclipBtn.Position = UDim2.new(0.01,0,0,yOffset+rowH*2+12)
        noclipBtn.BackgroundColor3 = C.btn
        noclipBtn.Text = "🚪 NOCLIP: ВЫКЛ"
        noclipBtn.TextColor3 = Color3.fromRGB(255,100,100)
        noclipBtn.Font = Enum.Font.GothamBold
        noclipBtn.TextSize = 11
        Instance.new("UICorner", noclipBtn).CornerRadius = UDim.new(0,5)
        
        -- ===== FLY =====
        local flyBtn = Instance.new("TextButton", pg)
        flyBtn.Size = UDim2.new(0.48,0,0,rowH)
        flyBtn.Position = UDim2.new(0.51,0,0,yOffset+rowH*2+12)
        flyBtn.BackgroundColor3 = C.btn
        flyBtn.Text = "🕊 FLY: ВЫКЛ"
        flyBtn.TextColor3 = Color3.fromRGB(255,100,100)
        flyBtn.Font = Enum.Font.GothamBold
        flyBtn.TextSize = 11
        Instance.new("UICorner", flyBtn).CornerRadius = UDim.new(0,5)
        
        -- Регулятор скорости
        local speedLabel = Instance.new("TextLabel", pg)
        speedLabel.Size = UDim2.new(0.48,0,0,20)
        speedLabel.Position = UDim2.new(0.51,0,0,yOffset+rowH*3+8)
        speedLabel.BackgroundTransparency = 1
        speedLabel.Text = "Скорость:"
        speedLabel.TextColor3 = C.white
        speedLabel.Font = Enum.Font.Gotham
        speedLabel.TextSize = 10
        
        local speedValue = Instance.new("TextLabel", pg)
        speedValue.Size = UDim2.new(0.15,0,0,20)
        speedValue.Position = UDim2.new(0.51,0,0,yOffset+rowH*3+28)
        speedValue.BackgroundColor3 = C.side
        speedValue.Text = "127"
        speedValue.TextColor3 = C.white
        speedValue.Font = Enum.Font.GothamBold
        speedValue.TextSize = 10
        Instance.new("UICorner", speedValue).CornerRadius = UDim.new(0,4)
        
        local speedDown = Instance.new("TextButton", pg)
        speedDown.Size = UDim2.new(0.1,0,0,20)
        speedDown.Position = UDim2.new(0.68,0,0,yOffset+rowH*3+28)
        speedDown.BackgroundColor3 = C.btn
        speedDown.Text = "-10"
        speedDown.TextColor3 = C.white
        speedDown.Font = Enum.Font.GothamBold
        speedDown.TextSize = 9
        Instance.new("UICorner", speedDown).CornerRadius = UDim.new(0,4)
        
        local speedUp = Instance.new("TextButton", pg)
        speedUp.Size = UDim2.new(0.1,0,0,20)
        speedUp.Position = UDim2.new(0.8,0,0,yOffset+rowH*3+28)
        speedUp.BackgroundColor3 = C.btn
        speedUp.Text = "+10"
        speedUp.TextColor3 = C.white
        speedUp.Font = Enum.Font.GothamBold
        speedUp.TextSize = 9
        Instance.new("UICorner", speedUp).CornerRadius = UDim.new(0,4)
        
        -- ===== ЛОГИКА NOCLIP =====
        local noclipActive = false
        local noclipConnection = nil
        
        local function toggleNoclip()
            noclipActive = not noclipActive
            if noclipActive then
                noclipBtn.Text = "🚪 NOCLIP: ВКЛ"
                noclipBtn.TextColor3 = Color3.fromRGB(100,255,100)
                noclipConnection = game:GetService("RunService").Stepped:Connect(function()
                    local char = game.Players.LocalPlayer.Character
                    if char then
                        for _, v in pairs(char:GetDescendants()) do
                            if v:IsA("BasePart") then
                                v.CanCollide = false
                            end
                        end
                    end
                end)
            else
                noclipBtn.Text = "🚪 NOCLIP: ВЫКЛ"
                noclipBtn.TextColor3 = Color3.fromRGB(255,100,100)
                if noclipConnection then
                    noclipConnection:Disconnect()
                    noclipConnection = nil
                end
                local char = game.Players.LocalPlayer.Character
                if char then
                    for _, v in pairs(char:GetDescendants()) do
                        if v:IsA("BasePart") then
                            v.CanCollide = true
                        end
                    end
                end
            end
        end
        
        noclipBtn.MouseButton1Click:Connect(toggleNoclip)
        
        -- ===== ТОЧНАЯ ЛОГИКА FLY ИЗ ТВОЕГО СКРИПТА =====
        local flySpeed = 127
        local flying = false
        local enabled = false
        local move_dir = Vector3.new()
        local keys_dn = {}
        
        local MVKS = {
            [Enum.KeyCode.D] = Vector3.new(1, 0, 0),
            [Enum.KeyCode.A] = Vector3.new(-1, 0, 0),
            [Enum.KeyCode.S] = Vector3.new(0, 0, 1),
            [Enum.KeyCode.W] = Vector3.new(0, 0, -1),
            [Enum.KeyCode.E] = Vector3.new(0, 1, 0),
            [Enum.KeyCode.Q] = Vector3.new(0, -1, 0),
            [Enum.KeyCode.Right] = Vector3.new(1, 0, 0),
            [Enum.KeyCode.Left] = Vector3.new(-1, 0, 0),
            [Enum.KeyCode.Down] = Vector3.new(0, 0, 1),
            [Enum.KeyCode.Up] = Vector3.new(0, 0, -1),
            [Enum.KeyCode.PageUp] = Vector3.new(0, 1, 0),
            [Enum.KeyCode.PageDown] = Vector3.new(0, -1, 0),
        }
        
        local uis = game:GetService("UserInputService")
        local lp = game.Players.LocalPlayer
        local ms = lp:GetMouse()
        local humanoid = nil
        local parent = nil
        
        local fly_rp = nil
        local fly_bg = nil
        local fly_pt = nil
        local fly_evts = {}
        
        local function fly_dir()
            local front = workspace.CurrentCamera:ScreenPointToRay(ms.X, ms.Y).Direction
            return CFrame.new(Vector3.new(), front) * move_dir
        end
        
        local function initFly()
            local ch = lp.Character
            if not ch then return end
            humanoid = ch:WaitForChild("Humanoid")
            parent = humanoid.RootPart
            
            if fly_rp then fly_rp:Destroy() end
            if fly_bg then fly_bg:Destroy() end
            
            local md = Instance.new("Model")
            fly_pt = Instance.new("Part", md)
            fly_pt.Anchored = true
            fly_pt.CanCollide = false
            md.PrimaryPart = fly_pt
            
            fly_bg = Instance.new("BodyGyro", parent)
            fly_bg.MaxTorque = Vector3.new()
            fly_bg.P = 3e4
            
            fly_rp = Instance.new("RocketPropulsion", parent)
            fly_rp.MaxTorque = Vector3.new(1e4, 1e4, 1e4)
            fly_rp.CartoonFactor = 1
            fly_rp.Target = fly_pt
            fly_rp.MaxSpeed = flySpeed
            fly_rp.MaxThrust = 5e5
            fly_rp.ThrustP = 1e5
            fly_rp.ThrustD = math.huge
            fly_rp.TurnP = 1e5
            fly_rp.TurnD = 2e2
            
            enabled = false
        end
        
        local function enableFly()
            if not fly_rp then return end
            enabled = true
            fly_bg.MaxTorque = Vector3.new(3e4, 0, 3e4)
            fly_rp.MaxTorque = Vector3.new(1e4, 1e4, 1e4)
        end
        
        local function disableFly()
            if not fly_rp then return end
            enabled = false
            fly_bg.MaxTorque = Vector3.new()
            fly_rp.MaxTorque = Vector3.new()
            if fly_rp then fly_rp:Abort() end
            flying = false
            if humanoid then humanoid.AutoRotate = true end
            if parent then parent.Velocity = Vector3.new() end
        end
        
        local function toggleFly()
            if enabled then
                disableFly()
                flyBtn.Text = "🕊 FLY: ВЫКЛ"
                flyBtn.TextColor3 = Color3.fromRGB(255,100,100)
            else
                if not fly_rp then initFly() end
                enableFly()
                flyBtn.Text = "🕊 FLY: ВКЛ"
                flyBtn.TextColor3 = Color3.fromRGB(100,255,100)
            end
        end
        
        -- Обработчики клавиш движения
        uis.InputBegan:Connect(function(i, p)
            if p then return end
            if MVKS[i.KeyCode] and not keys_dn[i.KeyCode] then
                move_dir = move_dir + MVKS[i.KeyCode]
                keys_dn[i.KeyCode] = true
            end
        end)
        
        uis.InputEnded:Connect(function(i, p)
            if p then return end
            if MVKS[i.KeyCode] and keys_dn[i.KeyCode] then
                move_dir = move_dir - MVKS[i.KeyCode]
                keys_dn[i.KeyCode] = nil
            end
        end)
        
        -- Основной цикл полёта
        game:GetService("RunService").RenderStepped:Connect(function()
            if not fly_rp or not parent then return end
            local do_fly = enabled and move_dir.Magnitude > 0
            if flying ~= do_fly then
                flying = do_fly
                if humanoid then humanoid.AutoRotate = not do_fly end
                if not do_fly then
                    parent.Velocity = Vector3.new()
                    fly_rp:Abort()
                    return
                end
                fly_rp:Fire()
            end
            if fly_pt then
                fly_pt.Position = parent.Position + 4096 * fly_dir()
            end
        end)
        
        -- Смена скорости
        speedDown.MouseButton1Click:Connect(function()
            flySpeed = math.max(20, flySpeed - 10)
            speedValue.Text = tostring(flySpeed)
            if fly_rp then fly_rp.MaxSpeed = flySpeed end
        end)
        
        speedUp.MouseButton1Click:Connect(function()
            flySpeed = math.min(500, flySpeed + 10)
            speedValue.Text = tostring(flySpeed)
            if fly_rp then fly_rp.MaxSpeed = flySpeed end
        end)
        
        flyBtn.MouseButton1Click:Connect(toggleFly)
        
        -- Пересоздаём при респавне
        lp.CharacterAdded:Connect(function()
            wait(0.5)
            initFly()
            if enabled then
                enableFly()
            end
        end)
        
        -- Обработчики молота
        hDown.MouseButton1Click:Connect(function()
            local v = math.max(100, (GUI.hammerHeight or 200) - 10)
            GUI.hammerHeight = v
            hValue.Text = tostring(v)
        end)
        hUp.MouseButton1Click:Connect(function()
            local v = math.min(500, (GUI.hammerHeight or 200) + 10)
            GUI.hammerHeight = v
            hValue.Text = tostring(v)
        end)
        pDown.MouseButton1Click:Connect(function()
            local v = math.max(500, (GUI.hammerSpeed or 1500) - 50)
            GUI.hammerSpeed = v
            pValue.Text = tostring(v)
        end)
        pUp.MouseButton1Click:Connect(function()
            local v = math.min(3000, (GUI.hammerSpeed or 1500) + 50)
            GUI.hammerSpeed = v
            pValue.Text = tostring(v)
        end)
        
        -- Инициализация
        initFly()
    end
}
