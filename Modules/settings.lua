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
        speedValue.Text = "80"
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
        
        -- ===== FLY ДЛЯ ТЕЛЕФОНА (РАБОТАЕТ ОТ ДЖОЙСТИКА) =====
        local flyActive = false
        local flySpeed = 80
        local bv = nil
        local bg = nil
        local flyConn = nil
        
        local function stopFly()
            local player = game.Players.LocalPlayer
            local char = player and player.Character
            if bv then bv:Destroy() bv = nil end
            if bg then bg:Destroy() bg = nil end
            if flyConn then flyConn:Disconnect() flyConn = nil end
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
            local player = game.Players.LocalPlayer
            local char = player.Character
            if not char then
                task.wait(0.5)
                char = player.Character
                if not char then return end
            end
            local hum = char:FindFirstChildOfClass("Humanoid")
            local root = char:FindFirstChild("HumanoidRootPart")
            if not hum or not root then return end
            
            hum:SetStateEnabled(Enum.HumanoidStateType.Jumping, false)
            hum:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
            
            bg = Instance.new("BodyGyro", root)
            bg.P = 1e4
            bg.MaxTorque = Vector3.new(1e5, 1e5, 1e5)
            bg.CFrame = root.CFrame
            
            bv = Instance.new("BodyVelocity", root)
            bv.P = 1e4
            bv.MaxForce = Vector3.new(1e6, 1e6, 1e6)
            bv.Velocity = Vector3.zero
            
            flyConn = game:GetService("RunService").RenderStepped:Connect(function()
                if not flyActive then return end
                local c = player.Character
                if not c or not c.PrimaryPart then
                    stopFly()
                    return
                end
                
                -- Получаем направление джойстика (работает на телефоне)
                local moveDir = game:GetService("UserInputService"):GetMoveDirection()
                local cam = workspace.CurrentCamera
                
                -- Движение относительно камеры
                local forward = cam.CFrame.LookVector * moveDir.Z
                local right = cam.CFrame.RightVector * moveDir.X
                local moveVector = (forward + right) * flySpeed
                
                if bv then
                    bv.Velocity = moveVector
                end
                
                if bg and moveVector.Magnitude > 0.1 then
                    bg.CFrame = CFrame.new(root.Position, root.Position + moveVector.Unit)
                end
            end)
        end
        
        local function toggleFly()
            flyActive = not flyActive
            if flyActive then
                flyBtn.Text = "🕊 FLY: ВКЛ"
                flyBtn.TextColor3 = Color3.fromRGB(100,255,100)
                startFly()
            else
                flyBtn.Text = "🕊 FLY: ВЫКЛ"
                flyBtn.TextColor3 = Color3.fromRGB(255,100,100)
                stopFly()
            end
        end
        
        flyBtn.MouseButton1Click:Connect(toggleFly)
        
        speedDown.MouseButton1Click:Connect(function()
            flySpeed = math.max(20, flySpeed - 10)
            speedValue.Text = tostring(flySpeed)
        end)
        speedUp.MouseButton1Click:Connect(function()
            flySpeed = math.min(300, flySpeed + 10)
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
        
        -- Пересоздаём полёт при респавне
        game.Players.LocalPlayer.CharacterAdded:Connect(function()
            if flyActive then
                task.wait(1)
                startFly()
            end
        end)
        
        -- Очистка при телепорте
        game.Players.LocalPlayer.OnTeleport:Connect(function()
            if flyActive then
                flyActive = false
                stopFly()
            end
        end)
    end
}
