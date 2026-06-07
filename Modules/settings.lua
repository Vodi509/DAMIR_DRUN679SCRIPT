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
        
        -- Скорость полёта
        local speedLabel = Instance.new("TextLabel", pg)
        speedLabel.Size = UDim2.new(0.48,0,0,20)
        speedLabel.Position = UDim2.new(0.01,0,0,yOffset+rowH*3+8)
        speedLabel.BackgroundTransparency = 1
        speedLabel.Text = "Скорость:"
        speedLabel.TextColor3 = C.white
        speedLabel.Font = Enum.Font.Gotham
        speedLabel.TextSize = 11
        
        local speedValue = Instance.new("TextLabel", pg)
        speedValue.Size = UDim2.new(0.15,0,0,20)
        speedValue.Position = UDim2.new(0.4,0,0,yOffset+rowH*3+8)
        speedValue.BackgroundColor3 = C.side
        speedValue.Text = "50"
        speedValue.TextColor3 = C.white
        speedValue.Font = Enum.Font.GothamBold
        speedValue.TextSize = 11
        Instance.new("UICorner", speedValue).CornerRadius = UDim.new(0,4)
        
        local speedDown = Instance.new("TextButton", pg)
        speedDown.Size = UDim2.new(0.1,0,0,20)
        speedDown.Position = UDim2.new(0.57,0,0,yOffset+rowH*3+8)
        speedDown.BackgroundColor3 = C.btn
        speedDown.Text = "-5"
        speedDown.TextColor3 = C.white
        speedDown.Font = Enum.Font.GothamBold
        speedDown.TextSize = 10
        Instance.new("UICorner", speedDown).CornerRadius = UDim.new(0,4)
        
        local speedUp = Instance.new("TextButton", pg)
        speedUp.Size = UDim2.new(0.1,0,0,20)
        speedUp.Position = UDim2.new(0.69,0,0,yOffset+rowH*3+8)
        speedUp.BackgroundColor3 = C.btn
        speedUp.Text = "+5"
        speedUp.TextColor3 = C.white
        speedUp.Font = Enum.Font.GothamBold
        speedUp.TextSize = 10
        Instance.new("UICorner", speedUp).CornerRadius = UDim.new(0,4)
        
        -- Кнопка полёта
        local flyBtn = Instance.new("TextButton", pg)
        flyBtn.Size = UDim2.new(0.8,0,0,rowH)
        flyBtn.Position = UDim2.new(0.1,0,0,yOffset+rowH*4+12)
        flyBtn.BackgroundColor3 = C.btn
        flyBtn.Text = "🕊 FLY: ВЫКЛ"
        flyBtn.TextColor3 = Color3.fromRGB(255,100,100)
        flyBtn.Font = Enum.Font.GothamBold
        flyBtn.TextSize = 12
        Instance.new("UICorner", flyBtn).CornerRadius = UDim.new(0,5)
        
        -- ===== NOCLIP ЛОГИКА =====
        local noclipActive = false
        local noclipConn = nil
        
        noclipBtn.MouseButton1Click:Connect(function()
            noclipActive = not noclipActive
            if noclipActive then
                noclipBtn.Text = "🚪 NOCLIP: ВКЛ"
                noclipBtn.TextColor3 = Color3.fromRGB(100,255,100)
                noclipConn = game:GetService("RunService").Stepped:Connect(function()
                    local char = game.Players.LocalPlayer.Character
                    if char then
                        for _, v in pairs(char:GetDescendants()) do
                            if v:IsA("BasePart") then v.CanCollide = false end
                        end
                    end
                end)
            else
                noclipBtn.Text = "🚪 NOCLIP: ВЫКЛ"
                noclipBtn.TextColor3 = Color3.fromRGB(255,100,100)
                if noclipConn then noclipConn:Disconnect() noclipConn = nil end
                local char = game.Players.LocalPlayer.Character
                if char then
                    for _, v in pairs(char:GetDescendants()) do
                        if v:IsA("BasePart") then v.CanCollide = true end
                    end
                end
            end
        end)
        
        -- ===== FLY ЛОГИКА (ОПТИМИЗИРОВАННАЯ) =====
        local flyActive = false
        local flySpeed = 50
        local boost = false
        local bv, bg, animTrack, flyConn = nil, nil, nil, nil
        
        -- Анимация супермена
        local animId = "rbxassetid://10854225007"
        
        local function playAnim(char)
            local hum = char:FindFirstChildOfClass("Humanoid")
            if not hum then return end
            local animator = hum:FindFirstChildOfClass("Animator")
            if not animator then animator = Instance.new("Animator", hum) end
            local anim = Instance.new("Animation")
            anim.AnimationId = animId
            animTrack = animator:LoadAnimation(anim)
            if animTrack then animTrack:Play() end
        end
        
        local function stopAnim()
            if animTrack then animTrack:Stop() animTrack = nil end
        end
        
        local function stopFly()
            flyActive = false
            if bv then bv:Destroy() bv = nil end
            if bg then bg:Destroy() bg = nil end
            if flyConn then flyConn:Disconnect() flyConn = nil end
            stopAnim()
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
        end
        
        local function startFly()
            local char = game.Players.LocalPlayer.Character
            if not char then return end
            local hum = char:FindFirstChildOfClass("Humanoid")
            local root = char:FindFirstChild("HumanoidRootPart")
            if not hum or not root then return end
            
            hum:SetStateEnabled(Enum.HumanoidStateType.Jumping, false)
            hum:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
            hum:ChangeState(Enum.HumanoidStateType.Landed)
            
            bg = Instance.new("BodyGyro", root)
            bg.P = 1e4
            bg.MaxTorque = Vector3.new(1,1,1) * 1e5
            
            bv = Instance.new("BodyVelocity", root)
            bv.P = 1e4
            bv.MaxForce = Vector3.new(1,1,1) * 1e5
            
            playAnim(char)
            
            flyConn = game:GetService("RunService").RenderStepped:Connect(function()
                if not flyActive then return end
                local c = game.Players.LocalPlayer.Character
                if not c or not c.PrimaryPart then stopFly() return end
                
                local move = game:GetService("UserInputService"):GetMoveDirection()
                local cam = workspace.CurrentCamera
                local currentSpeed = flySpeed * (boost and 2 or 1)
                local vel = (cam.CFrame.LookVector * move.Z + cam.CFrame.RightVector * move.X) * currentSpeed
                bv.Velocity = vel
                if vel.Magnitude > 0.1 then
                    bg.CFrame = CFrame.new(root.Position, root.Position + vel.Unit)
                end
            end)
        end
        
        -- Окно управления (простое, без эффектов)
        local controlGui = nil
        
        local function createControlPanel()
            if controlGui then controlGui:Destroy() end
            local sg = Instance.new("ScreenGui")
            sg.Name = "FlyControl"
            sg.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
            sg.ResetOnSpawn = false
            controlGui = sg
            
            local frame = Instance.new("Frame", sg)
            frame.Size = UDim2.new(0, 160, 0, 90)
            frame.Position = UDim2.new(0.5, -80, 0.7, 0)
            frame.BackgroundColor3 = Color3.fromRGB(20,20,30)
            frame.BackgroundTransparency = 0.2
            Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
            
            -- Заголовок для перетаскивания
            local drag = Instance.new("TextButton", frame)
            drag.Size = UDim2.new(1,0,0,20)
            drag.BackgroundColor3 = Color3.fromRGB(40,40,55)
            drag.Text = "ПОЛЁТ"
            drag.TextColor3 = Color3.fromRGB(200,200,200)
            drag.Font = Enum.Font.GothamBold
            drag.TextSize = 10
            drag.AutoButtonColor = false
            Instance.new("UICorner", drag).CornerRadius = UDim.new(0, 6)
            
            -- Перетаскивание
            local dragStart, startPos, dragging = nil, nil, false
            drag.MouseButton1Down:Connect(function(x,y)
                dragging = true
                dragStart = Vector2.new(x,y)
                startPos = frame.Position
            end)
            drag.MouseButton1Up:Connect(function() dragging = false end)
            game:GetService("UserInputService").InputChanged:Connect(function(inp)
                if dragging and inp.UserInputType == Enum.UserInputType.MouseMovement then
                    local delta = Vector2.new(inp.Position.X, inp.Position.Y) - dragStart
                    frame.Position = UDim2.new(startPos.X.Scale + (delta.X/sg.AbsoluteSize.X), 0, startPos.Y.Scale + (delta.Y/sg.AbsoluteSize.Y), 0)
                end
            end)
            
            -- Кнопка Fly
            local flyCtrl = Instance.new("TextButton", frame)
            flyCtrl.Size = UDim2.new(0.9,0,0,28)
            flyCtrl.Position = UDim2.new(0.05,0,0.3,0)
            flyCtrl.BackgroundColor3 = Color3.fromRGB(0,150,0)
            flyCtrl.Text = "FLY: ВКЛ"
            flyCtrl.TextColor3 = Color3.fromRGB(255,255,255)
            flyCtrl.Font = Enum.Font.GothamBold
            flyCtrl.TextSize = 12
            Instance.new("UICorner", flyCtrl).CornerRadius = UDim.new(0,5)
            
            -- Кнопка Boost
            local boostCtrl = Instance.new("TextButton", frame)
            boostCtrl.Size = UDim2.new(0.9,0,0,28)
            boostCtrl.Position = UDim2.new(0.05,0,0.65,0)
            boostCtrl.BackgroundColor3 = Color3.fromRGB(200,100,0)
            boostCtrl.Text = "BOOST: ВЫКЛ"
            boostCtrl.TextColor3 = Color3.fromRGB(255,255,255)
            boostCtrl.Font = Enum.Font.GothamBold
            boostCtrl.TextSize = 11
            Instance.new("UICorner", boostCtrl).CornerRadius = UDim.new(0,5)
            
            -- Логика
            local function updateUI()
                flyCtrl.Text = flyActive and "FLY: ВКЛ" or "FLY: ВЫКЛ"
                flyCtrl.BackgroundColor3 = flyActive and Color3.fromRGB(0,150,0) or Color3.fromRGB(150,0,0)
                boostCtrl.Text = boost and "BOOST: ВКЛ" or "BOOST: ВЫКЛ"
                boostCtrl.BackgroundColor3 = boost and Color3.fromRGB(0,100,200) or Color3.fromRGB(200,100,0)
            end
            
            flyCtrl.MouseButton1Click:Connect(function()
                if flyActive then
                    stopFly()
                else
                    flyActive = true
                    startFly()
                end
                updateUI()
            end)
            
            boostCtrl.MouseButton1Click:Connect(function()
                if not flyActive then return end
                boost = not boost
                updateUI()
            end)
            
            updateUI()
        end
        
        flyBtn.MouseButton1Click:Connect(function()
            if controlGui then
                controlGui:Destroy()
                controlGui = nil
                if flyActive then stopFly() end
                flyBtn.Text = "🕊 FLY: ВЫКЛ"
                flyBtn.TextColor3 = Color3.fromRGB(255,100,100)
            else
                createControlPanel()
                flyBtn.Text = "🕊 FLY: АКТИВЕН"
                flyBtn.TextColor3 = Color3.fromRGB(100,255,100)
            end
        end)
        
        -- Регулировка скорости
        speedDown.MouseButton1Click:Connect(function()
            flySpeed = math.max(20, flySpeed - 5)
            speedValue.Text = tostring(flySpeed)
        end)
        speedUp.MouseButton1Click:Connect(function()
            flySpeed = math.min(150, flySpeed + 5)
            speedValue.Text = tostring(flySpeed)
        end)
        
        -- ОБРАБОТЧИКИ МОЛОТА
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
        
        -- Очистка при телепорте
        game.Players.LocalPlayer.OnTeleport:Connect(function()
            if flyActive then stopFly() end
            if controlGui then controlGui:Destroy() controlGui = nil end
        end)
    end
}                
