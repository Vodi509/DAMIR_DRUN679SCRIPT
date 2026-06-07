return {
    start = function(GUI)
        local C = GUI.colors
        local pg = GUI.settings

        -- Очищаем панель настроек
        for _, v in pairs(pg:GetChildren()) do v:Destroy() end

        local title = Instance.new("TextLabel", pg)
        title.Size = UDim2.new(1, 0, 0, 18)
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
        hLabel.Size = UDim2.new(0.4, 0, 0, rowH)
        hLabel.Position = UDim2.new(0, 0, 0, yOffset)
        hLabel.BackgroundTransparency = 1
        hLabel.Text = "🔨 Высота:"
        hLabel.TextColor3 = C.white
        hLabel.Font = Enum.Font.Gotham
        hLabel.TextSize = 11

        local hValue = Instance.new("TextLabel", pg)
        hValue.Size = UDim2.new(0.15, 0, 0, rowH)
        hValue.Position = UDim2.new(0.4, 0, 0, yOffset)
        hValue.BackgroundColor3 = C.side
        hValue.Text = tostring(GUI.hammerHeight or 200)
        hValue.TextColor3 = C.white
        hValue.Font = Enum.Font.GothamBold
        hValue.TextSize = 11
        Instance.new("UICorner", hValue).CornerRadius = UDim.new(0, 4)

        local hDown = Instance.new("TextButton", pg)
        hDown.Size = UDim2.new(0.1, 0, 0, rowH)
        hDown.Position = UDim2.new(0.57, 0, 0, yOffset)
        hDown.BackgroundColor3 = C.btn
        hDown.Text = "-10"
        hDown.TextColor3 = C.white
        hDown.Font = Enum.Font.GothamBold
        hDown.TextSize = 10
        Instance.new("UICorner", hDown).CornerRadius = UDim.new(0, 4)

        local hUp = Instance.new("TextButton", pg)
        hUp.Size = UDim2.new(0.1, 0, 0, rowH)
        hUp.Position = UDim2.new(0.69, 0, 0, yOffset)
        hUp.BackgroundColor3 = C.btn
        hUp.Text = "+10"
        hUp.TextColor3 = C.white
        hUp.Font = Enum.Font.GothamBold
        hUp.TextSize = 10
        Instance.new("UICorner", hUp).CornerRadius = UDim.new(0, 4)

        -- СИЛА УДАРА
        local pLabel = Instance.new("TextLabel", pg)
        pLabel.Size = UDim2.new(0.4, 0, 0, rowH)
        pLabel.Position = UDim2.new(0, 0, 0, yOffset + rowH + 4)
        pLabel.BackgroundTransparency = 1
        pLabel.Text = "💪 Сила:"
        pLabel.TextColor3 = C.white
        pLabel.Font = Enum.Font.Gotham
        pLabel.TextSize = 11

        local pValue = Instance.new("TextLabel", pg)
        pValue.Size = UDim2.new(0.15, 0, 0, rowH)
        pValue.Position = UDim2.new(0.4, 0, 0, yOffset + rowH + 4)
        pValue.BackgroundColor3 = C.side
        pValue.Text = tostring(GUI.hammerSpeed or 1500)
        pValue.TextColor3 = C.white
        pValue.Font = Enum.Font.GothamBold
        pValue.TextSize = 11
        Instance.new("UICorner", pValue).CornerRadius = UDim.new(0, 4)

        local pDown = Instance.new("TextButton", pg)
        pDown.Size = UDim2.new(0.1, 0, 0, rowH)
        pDown.Position = UDim2.new(0.57, 0, 0, yOffset + rowH + 4)
        pDown.BackgroundColor3 = C.btn
        pDown.Text = "-50"
        pDown.TextColor3 = C.white
        pDown.Font = Enum.Font.GothamBold
        pDown.TextSize = 10
        Instance.new("UICorner", pDown).CornerRadius = UDim.new(0, 4)

        local pUp = Instance.new("TextButton", pg)
        pUp.Size = UDim2.new(0.1, 0, 0, rowH)
        pUp.Position = UDim2.new(0.69, 0, 0, yOffset + rowH + 4)
        pUp.BackgroundColor3 = C.btn
        pUp.Text = "+50"
        pUp.TextColor3 = C.white
        pUp.Font = Enum.Font.GothamBold
        pUp.TextSize = 10
        Instance.new("UICorner", pUp).CornerRadius = UDim.new(0, 4)

        -- ===== NOCLIP =====
        local noclipBtn = Instance.new("TextButton", pg)
        noclipBtn.Size = UDim2.new(0.48, 0, 0, rowH)
        noclipBtn.Position = UDim2.new(0.01, 0, 0, yOffset + rowH * 2 + 12)
        noclipBtn.BackgroundColor3 = C.btn
        noclipBtn.Text = "🚪 NOCLIP: ВЫКЛ"
        noclipBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
        noclipBtn.Font = Enum.Font.GothamBold
        noclipBtn.TextSize = 11
        Instance.new("UICorner", noclipBtn).CornerRadius = UDim.new(0, 5)

        -- Регулятор скорости полёта
        local speedLabel = Instance.new("TextLabel", pg)
        speedLabel.Size = UDim2.new(0.48, 0, 0, 20)
        speedLabel.Position = UDim2.new(0.01, 0, 0, yOffset + rowH * 3 + 8)
        speedLabel.BackgroundTransparency = 1
        speedLabel.Text = "Базовая скорость:"
        speedLabel.TextColor3 = C.white
        speedLabel.Font = Enum.Font.Gotham
        speedLabel.TextSize = 11
        speedLabel.TextXAlignment = Enum.TextXAlignment.Left

        local flySpeedValue = Instance.new("TextLabel", pg)
        flySpeedValue.Size = UDim2.new(0.15, 0, 0, 20)
        flySpeedValue.Position = UDim2.new(0.4, 0, 0, yOffset + rowH * 3 + 8)
        flySpeedValue.BackgroundColor3 = C.side
        flySpeedValue.Text = "60"
        flySpeedValue.TextColor3 = C.white
        flySpeedValue.Font = Enum.Font.GothamBold
        flySpeedValue.TextSize = 11
        Instance.new("UICorner", flySpeedValue).CornerRadius = UDim.new(0, 4)

        local flySpeedDown = Instance.new("TextButton", pg)
        flySpeedDown.Size = UDim2.new(0.1, 0, 0, 20)
        flySpeedDown.Position = UDim2.new(0.57, 0, 0, yOffset + rowH * 3 + 8)
        flySpeedDown.BackgroundColor3 = C.btn
        flySpeedDown.Text = "-5"
        flySpeedDown.TextColor3 = C.white
        flySpeedDown.Font = Enum.Font.GothamBold
        flySpeedDown.TextSize = 10
        Instance.new("UICorner", flySpeedDown).CornerRadius = UDim.new(0, 4)

        local flySpeedUp = Instance.new("TextButton", pg)
        flySpeedUp.Size = UDim2.new(0.1, 0, 0, 20)
        flySpeedUp.Position = UDim2.new(0.69, 0, 0, yOffset + rowH * 3 + 8)
        flySpeedUp.BackgroundColor3 = C.btn
        flySpeedUp.Text = "+5"
        flySpeedUp.TextColor3 = C.white
        flySpeedUp.Font = Enum.Font.GothamBold
        flySpeedUp.TextSize = 10
        Instance.new("UICorner", flySpeedUp).CornerRadius = UDim.new(0, 4)

        -- Кнопка включения полёта
        local flyToggleBtn = Instance.new("TextButton", pg)
        flyToggleBtn.Size = UDim2.new(0.8, 0, 0, rowH)
        flyToggleBtn.Position = UDim2.new(0.1, 0, 0, yOffset + rowH * 4 + 12)
        flyToggleBtn.BackgroundColor3 = C.btn
        flyToggleBtn.Text = "🕊️ АКТИВИРОВАТЬ ПОЛЁТ"
        flyToggleBtn.TextColor3 = C.white
        flyToggleBtn.Font = Enum.Font.GothamBold
        flyToggleBtn.TextSize = 12
        Instance.new("UICorner", flyToggleBtn).CornerRadius = UDim.new(0, 5)

        -- ===== ЛОГИКА NOCLIP =====
        local noclipActive = false
        local noclipConnection = nil

        local function toggleNoclip()
            noclipActive = not noclipActive
            if noclipActive then
                noclipBtn.Text = "🚪 NOCLIP: ВКЛ"
                noclipBtn.TextColor3 = Color3.fromRGB(100, 255, 100)
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
                noclipBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
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

        -- ===== ЛОГИКА ПОЛЁТА =====
        local flyActive = false
        local isBoosting = false
        local baseSpeed = 60
        local boostMultiplier = 2
        local bv, bg = nil, nil
        local currentAnimTrack = nil
        local flyControlGui = nil
        local flyConnection = nil
        local speedEffectConnection = nil

        -- Эффект скорости (полосы)
        local function createSpeedEffect(character, intensity)
            if speedEffectConnection then speedEffectConnection:Disconnect() end
            local rootPart = character and character:FindFirstChild("HumanoidRootPart")
            if not rootPart then return end
            
            local beams = {}
            for i = 1, 6 do
                local beam = Instance.new("Beam", rootPart)
                beam.Texture = "rbxassetid://134387131" -- полоса
                beam.Width0 = 0.3
                beam.Width1 = 0.3
                beam.Transparency = NumberSequence.new(0.8)
                beam.LightInfluence = 1
                beams[#beams + 1] = beam
            end
            
            speedEffectConnection = game:GetService("RunService").RenderStepped:Connect(function()
                if not flyActive or not character or not character.Parent then
                    for _, b in pairs(beams) do b:Destroy() end
                    if speedEffectConnection then speedEffectConnection:Disconnect() end
                    return
                end
                local currentSpeed = isBoosting and baseSpeed * boostMultiplier or baseSpeed
                local alpha = math.clamp(currentSpeed / 150, 0.3, 1)
                for _, beam in pairs(beams) do
                    beam.Transparency = NumberSequence.new(0.9 - alpha * 0.5)
                    local offset = tick() * (isBoosting and 20 or 10)
                    beam.TextureSpeed = isBoosting and 10 or 5
                end
            end)
        end

        -- Анимация полёта (супермен)
        local function playFlyAnimation(character, speedMultiplier)
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if not humanoid then return end
            local animator = humanoid:FindFirstChildOfClass("Animator")
            if not animator then
                animator = Instance.new("Animator", humanoid)
            end
            local animation = Instance.new("Animation")
            animation.AnimationId = "rbxassetid://10854225007" -- полёт супермена
            local animTrack = animator:LoadAnimation(animation)
            if animTrack then
                animTrack:Play()
                animTrack:AdjustSpeed(speedMultiplier or 1)
                return animTrack
            end
            return nil
        end
        
        local function stopFlyAnimation()
            if currentAnimTrack then currentAnimTrack:Stop() end
        end

        -- Создание отдельного окна управления
        local function createFlyControlPanel()
            if flyControlGui then flyControlGui:Destroy() end
            local screenGui = Instance.new("ScreenGui")
            screenGui.Name = "FlyControlPanel"
            screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
            screenGui.ResetOnSpawn = false
            flyControlGui = screenGui
            
            local mainFrame = Instance.new("Frame", screenGui)
            mainFrame.Size = UDim2.new(0, 200, 0, 110)
            mainFrame.Position = UDim2.new(0.5, -100, 0.8, 0)
            mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
            mainFrame.BackgroundTransparency = 0.1
            Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 10)
            
            local dragBar = Instance.new("TextButton", mainFrame)
            dragBar.Size = UDim2.new(1, 0, 0, 25)
            dragBar.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
            dragBar.Text = "УПРАВЛЕНИЕ ПОЛЁТОМ"
            dragBar.TextColor3 = Color3.fromRGB(220, 220, 220)
            dragBar.Font = Enum.Font.GothamBold
            dragBar.TextSize = 11
            dragBar.AutoButtonColor = false
            Instance.new("UICorner", dragBar).CornerRadius = UDim.new(0, 8)
            
            -- Перетаскивание
            local dragging = false
            local dragStart, startPos
            dragBar.MouseButton1Down:Connect(function(x, y)
                dragging = true
                dragStart = Vector2.new(x, y)
                startPos = mainFrame.Position
            end)
            dragBar.MouseButton1Up:Connect(function() dragging = false end)
            game:GetService("UserInputService").InputChanged:Connect(function(input)
                if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                    local delta = Vector2.new(input.Position.X, input.Position.Y) - dragStart
                    local newX = startPos.X.Scale + (delta.X / screenGui.AbsoluteSize.X)
                    local newY = startPos.Y.Scale + (delta.Y / screenGui.AbsoluteSize.Y)
                    mainFrame.Position = UDim2.new(newX, 0, newY, 0)
                end
            end)
            
            local flyControlBtn = Instance.new("TextButton", mainFrame)
            flyControlBtn.Size = UDim2.new(0.9, 0, 0, 30)
            flyControlBtn.Position = UDim2.new(0.05, 0, 0.25, 0)
            flyControlBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
            flyControlBtn.Text = "FLY: ВКЛ"
            flyControlBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
            flyControlBtn.Font = Enum.Font.GothamBold
            flyControlBtn.TextSize = 14
            Instance.new("UICorner", flyControlBtn).CornerRadius = UDim.new(0, 6)
            
            local boostBtn = Instance.new("TextButton", mainFrame)
            boostBtn.Size = UDim2.new(0.9, 0, 0, 30)
            boostBtn.Position = UDim2.new(0.05, 0, 0.65, 0)
            boostBtn.BackgroundColor3 = Color3.fromRGB(200, 100, 0)
            boostBtn.Text = "BOOST: ВЫКЛ"
            boostBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
            boostBtn.Font = Enum.Font.GothamBold
            boostBtn.TextSize = 13
            Instance.new("UICorner", boostBtn).CornerRadius = UDim.new(0, 6)
            
            -- Логика кнопок
            local function updateUI()
                flyControlBtn.Text = flyActive and "FLY: ВКЛ" or "FLY: ВЫКЛ"
                flyControlBtn.BackgroundColor3 = flyActive and Color3.fromRGB(0, 150, 0) or Color3.fromRGB(150, 0, 0)
                boostBtn.Text = isBoosting and "BOOST: ВКЛ" or "BOOST: ВЫКЛ"
                boostBtn.BackgroundColor3 = isBoosting and Color3.fromRGB(0, 100, 200) or Color3.fromRGB(200, 100, 0)
            end
            
            flyControlBtn.MouseButton1Click:Connect(function()
                if flyActive then
                    -- Остановить полёт
                    flyActive = false
                    isBoosting = false
                    if bv then bv:Destroy() bv = nil end
                    if bg then bg:Destroy() bg = nil end
                    if flyConnection then flyConnection:Disconnect() flyConnection = nil end
                    stopFlyAnimation()
                    if speedEffectConnection then speedEffectConnection:Disconnect() end
                    local char = game.Players.LocalPlayer.Character
                    if char then
                        local hum = char:FindFirstChildOfClass("Humanoid")
                        if hum then
                            hum:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
                            hum:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true)
                        end
                        local root = char:FindFirstChild("HumanoidRootPart")
                        if root then root.Velocity = Vector3.zero end
                    end
                else
                    -- Запустить полёт
                    flyActive = true
                    local char = game.Players.LocalPlayer.Character
                    if not char then return end
                    local hum = char:FindFirstChildOfClass("Humanoid")
                    local root = char:FindFirstChild("HumanoidRootPart")
                    if not hum or not root then return end
                    
                    hum:SetStateEnabled(Enum.HumanoidStateType.Jumping, false)
                    hum:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
                    hum:ChangeState(Enum.HumanoidStateType.Landed)
                    
                    bg = Instance.new("BodyGyro", root)
                    bg.P = 1e5
                    bg.MaxTorque = Vector3.new(1, 1, 1) * 1e6
                    bg.CFrame = root.CFrame
                    
                    bv = Instance.new("BodyVelocity", root)
                    bv.P = 1e5
                    bv.MaxForce = Vector3.new(1, 1, 1) * 1e6
                    bv.Velocity = Vector3.zero
                    
                    currentAnimTrack = playFlyAnimation(char, isBoosting and boostMultiplier or 1)
                    createSpeedEffect(char, 1)
                    
                    flyConnection = game:GetService("RunService").RenderStepped:Connect(function()
                        if not flyActive or not char or not char.Parent then return end
                        local moveDir = game:GetService("UserInputService"):GetMoveDirection()
                        local cam = workspace.CurrentCamera
                        local currentSpeed = isBoosting and baseSpeed * boostMultiplier or baseSpeed
                        local forward = cam.CFrame.LookVector * moveDir.Z
                        local right = cam.CFrame.RightVector * moveDir.X
                        local moveVector = (forward + right) * currentSpeed
                        bv.Velocity = moveVector
                        if moveVector.Magnitude > 0.1 then
                            bg.CFrame = CFrame.new(root.Position, root.Position + moveVector.Unit)
                        end
                        if currentAnimTrack then
                            local wantedSpeed = isBoosting and boostMultiplier or 1
                            if currentAnimTrack.Speed ~= wantedSpeed then
                                currentAnimTrack:AdjustSpeed(wantedSpeed)
                            end
                        end
                    end)
                end
                updateUI()
            end)
            
            boostBtn.MouseButton1Click:Connect(function()
                if not flyActive then return end
                isBoosting = not isBoosting
                updateUI()
                if currentAnimTrack then
                    currentAnimTrack:AdjustSpeed(isBoosting and boostMultiplier or 1)
                end
            end)
            
            updateUI()
        end
        
        -- Запуск окна при активации полёта
        local flyWindowCreated = false
        flyToggleBtn.MouseButton1Click:Connect(function()
            if not flyWindowCreated then
                createFlyControlPanel()
                flyWindowCreated = true
            else
                if flyControlGui then flyControlGui.Enabled = not flyControlGui.Enabled end
            end
        end)
        
        -- Обновление базовой скорости из регулятора
        flySpeedDown.MouseButton1Click:Connect(function()
            local v = math.max(20, baseSpeed - 5)
            baseSpeed = v
            flySpeedValue.Text = tostring(v)
        end)
        flySpeedUp.MouseButton1Click:Connect(function()
            local v = math.min(150, baseSpeed + 5)
            baseSpeed = v
            flySpeedValue.Text = tostring(v)
                
