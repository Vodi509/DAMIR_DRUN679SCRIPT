return {
    start = function(GUI)
        local C = GUI.colors
        local pg = GUI.settings
        
        local title = Instance.new("TextLabel", pg)
        title.Size = UDim2.new(1,0,0,18)
        title.BackgroundTransparency = 1
        title.Text = "⚙ НАСТРОЙКИ"
        title.TextColor3 = C.white
        title.Font = Enum.Font.GothamBold
        title.TextSize = 12
        title.TextXAlignment = Enum.TextXAlignment.Left
        
        local yOffset = 22
        local rowH = 28
        
        -- ВЫСОТА МОЛОТА
        local hLabel = Instance.new("TextLabel", pg)
        hLabel.Size = UDim2.new(0.4,0,0,rowH)
        hLabel.Position = UDim2.new(0,0,0,yOffset)
        hLabel.BackgroundTransparency = 1
        hLabel.Text = "🔨 Высота молота:"
        hLabel.TextColor3 = C.white
        hLabel.Font = Enum.Font.Gotham
        hLabel.TextSize = 11
        hLabel.TextXAlignment = Enum.TextXAlignment.Left
        
        local hValue = Instance.new("TextLabel", pg)
        hValue.Size = UDim2.new(0.15,0,0,rowH)
        hValue.Position = UDim2.new(0.42,0,0,yOffset)
        hValue.BackgroundColor3 = C.side
        hValue.Text = tostring(GUI.hammerHeight or 200)
        hValue.TextColor3 = C.white
        hValue.Font = Enum.Font.GothamBold
        hValue.TextSize = 11
        Instance.new("UICorner", hValue).CornerRadius = UDim.new(0,4)
        
        local hDown = Instance.new("TextButton", pg)
        hDown.Size = UDim2.new(0.1,0,0,rowH)
        hDown.Position = UDim2.new(0.59,0,0,yOffset)
        hDown.BackgroundColor3 = C.btn
        hDown.Text = "-10"
        hDown.TextColor3 = C.white
        hDown.Font = Enum.Font.GothamBold
        hDown.TextSize = 11
        Instance.new("UICorner", hDown).CornerRadius = UDim.new(0,4)
        
        local hUp = Instance.new("TextButton", pg)
        hUp.Size = UDim2.new(0.1,0,0,rowH)
        hUp.Position = UDim2.new(0.71,0,0,yOffset)
        hUp.BackgroundColor3 = C.btn
        hUp.Text = "+10"
        hUp.TextColor3 = C.white
        hUp.Font = Enum.Font.GothamBold
        hUp.TextSize = 11
        Instance.new("UICorner", hUp).CornerRadius = UDim.new(0,4)
        
        -- СИЛА УДАРА
        local pLabel = Instance.new("TextLabel", pg)
        pLabel.Size = UDim2.new(0.4,0,0,rowH)
        pLabel.Position = UDim2.new(0,0,0,yOffset+rowH+4)
        pLabel.BackgroundTransparency = 1
        pLabel.Text = "💪 Сила удара:"
        pLabel.TextColor3 = C.white
        pLabel.Font = Enum.Font.Gotham
        pLabel.TextSize = 11
        pLabel.TextXAlignment = Enum.TextXAlignment.Left
        
        local pValue = Instance.new("TextLabel", pg)
        pValue.Size = UDim2.new(0.15,0,0,rowH)
        pValue.Position = UDim2.new(0.42,0,0,yOffset+rowH+4)
        pValue.BackgroundColor3 = C.side
        pValue.Text = tostring(GUI.hammerSpeed or 1500)
        pValue.TextColor3 = C.white
        pValue.Font = Enum.Font.GothamBold
        pValue.TextSize = 11
        Instance.new("UICorner", pValue).CornerRadius = UDim.new(0,4)
        
        local pDown = Instance.new("TextButton", pg)
        pDown.Size = UDim2.new(0.1,0,0,rowH)
        pDown.Position = UDim2.new(0.59,0,0,yOffset+rowH+4)
        pDown.BackgroundColor3 = C.btn
        pDown.Text = "-50"
        pDown.TextColor3 = C.white
        pDown.Font = Enum.Font.GothamBold
        pDown.TextSize = 11
        Instance.new("UICorner", pDown).CornerRadius = UDim.new(0,4)
        
        local pUp = Instance.new("TextButton", pg)
        pUp.Size = UDim2.new(0.1,0,0,rowH)
        pUp.Position = UDim2.new(0.71,0,0,yOffset+rowH+4)
        pUp.BackgroundColor3 = C.btn
        pUp.Text = "+50"
        pUp.TextColor3 = C.white
        pUp.Font = Enum.Font.GothamBold
        pUp.TextSize = 11
        Instance.new("UICorner", pUp).CornerRadius = UDim.new(0,4)
        
        -- ЦВЕТ ТЕМЫ
        local cLabel = Instance.new("TextLabel", pg)
        cLabel.Size = UDim2.new(0.4,0,0,rowH)
        cLabel.Position = UDim2.new(0,0,0,yOffset+rowH*2+8)
        cLabel.BackgroundTransparency = 1
        cLabel.Text = "🎨 Цвет темы:"
        cLabel.TextColor3 = C.white
        cLabel.Font = Enum.Font.Gotham
        cLabel.TextSize = 11
        cLabel.TextXAlignment = Enum.TextXAlignment.Left
        
        local colorBtn = Instance.new("TextButton", pg)
        colorBtn.Size = UDim2.new(0.4,0,0,rowH)
        colorBtn.Position = UDim2.new(0.42,0,0,yOffset+rowH*2+8)
        colorBtn.BackgroundColor3 = C.btn
        colorBtn.Text = "СМЕНИТЬ"
        colorBtn.TextColor3 = C.white
        colorBtn.Font = Enum.Font.GothamBold
        colorBtn.TextSize = 11
        Instance.new("UICorner", colorBtn).CornerRadius = UDim.new(0,4)
        
        local colors = {
            Color3.fromRGB(30,30,40), Color3.fromRGB(40,30,50), Color3.fromRGB(30,40,35),
            Color3.fromRGB(50,30,30), Color3.fromRGB(35,35,35), Color3.fromRGB(25,35,45),
            Color3.fromRGB(45,35,25), Color3.fromRGB(55,25,35), Color3.fromRGB(35,45,35),
            Color3.fromRGB(25,25,55), Color3.fromRGB(55,40,20), Color3.fromRGB(20,50,40),
            Color3.fromRGB(50,20,50), Color3.fromRGB(40,40,20), Color3.fromRGB(60,30,30)
        }
        local ci = 1
        
        colorBtn.MouseButton1Click:Connect(function()
            ci = ci % #colors + 1
            local nc = colors[ci]
            GUI.colors.side = nc
            GUI.colors.btn = Color3.fromRGB(nc.R*0.8, nc.G*0.8, nc.B*0.8)
            for _, f in pairs(pg.Parent.Parent:GetDescendants()) do
                if f:IsA("Frame") and f.BackgroundColor3 == C.side then f.BackgroundColor3 = nc
                elseif f:IsA("TextButton") and f.BackgroundColor3 == C.btn then f.BackgroundColor3 = GUI.colors.btn end
            end
            colorBtn.BackgroundColor3 = GUI.colors.btn
        end)
        
        -- ===== NOCLIP =====
        local noclipBtn = Instance.new("TextButton", pg)
        noclipBtn.Size = UDim2.new(0.6,0,0,rowH)
        noclipBtn.Position = UDim2.new(0.2,0,0,yOffset+rowH*3+12)
        noclipBtn.BackgroundColor3 = C.btn
        noclipBtn.Text = "🚪 NOCLIP: ВЫКЛ"
        noclipBtn.TextColor3 = Color3.fromRGB(255,100,100)
        noclipBtn.Font = Enum.Font.GothamBold
        noclipBtn.TextSize = 11
        Instance.new("UICorner", noclipBtn).CornerRadius = UDim.new(0,4)
        
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
        
        -- ===== FLY (ИЗ INFINITY YIELD) =====
        local flyBtn = Instance.new("TextButton", pg)
        flyBtn.Size = UDim2.new(0.6,0,0,rowH)
        flyBtn.Position = UDim2.new(0.2,0,0,yOffset+rowH*4+20)
        flyBtn.BackgroundColor3 = C.btn
        flyBtn.Text = "🕊 FLY: ВЫКЛ"
        flyBtn.TextColor3 = Color3.fromRGB(255,100,100)
        flyBtn.Font = Enum.Font.GothamBold
        flyBtn.TextSize = 11
        Instance.new("UICorner", flyBtn).CornerRadius = UDim.new(0,4)
        
        -- Регулировка скорости полёта
        local speedLabel = Instance.new("TextLabel", pg)
        speedLabel.Size = UDim2.new(0.3,0,0,rowH-6)
        speedLabel.Position = UDim2.new(0.2,0,0,yOffset+rowH*5+24)
        speedLabel.BackgroundTransparency = 1
        speedLabel.Text = "Скорость FLY:"
        speedLabel.TextColor3 = C.white
        speedLabel.Font = Enum.Font.Gotham
        speedLabel.TextSize = 9
        speedLabel.TextXAlignment = Enum.TextXAlignment.Left
        
        local speedValue = Instance.new("TextLabel", pg)
        speedValue.Size = UDim2.new(0.15,0,0,rowH-6)
        speedValue.Position = UDim2.new(0.5,0,0,yOffset+rowH*5+24)
        speedValue.BackgroundColor3 = C.side
        speedValue.Text = "1"
        speedValue.TextColor3 = C.white
        speedValue.Font = Enum.Font.GothamBold
        speedValue.TextSize = 9
        Instance.new("UICorner", speedValue).CornerRadius = UDim.new(0,4)
        
        local speedDown = Instance.new("TextButton", pg)
        speedDown.Size = UDim2.new(0.1,0,0,rowH-6)
        speedDown.Position = UDim2.new(0.66,0,0,yOffset+rowH*5+24)
        speedDown.BackgroundColor3 = C.btn
        speedDown.Text = "-5"
        speedDown.TextColor3 = C.white
        speedDown.Font = Enum.Font.GothamBold
        speedDown.TextSize = 9
        Instance.new("UICorner", speedDown).CornerRadius = UDim.new(0,4)
        
        local speedUp = Instance.new("TextButton", pg)
        speedUp.Size = UDim2.new(0.1,0,0,rowH-6)
        speedUp.Position = UDim2.new(0.77,0,0,yOffset+rowH*5+24)
        speedUp.BackgroundColor3 = C.btn
        speedUp.Text = "+5"
        speedUp.TextColor3 = C.white
        speedUp.Font = Enum.Font.GothamBold
        speedUp.TextSize = 9
        Instance.new("UICorner", speedUp).CornerRadius = UDim.new(0,4)
        
        local flySpeed = 1
        speedDown.MouseButton1Click:Connect(function()
            flySpeed = math.max(1, flySpeed - 5)
            speedValue.Text = tostring(flySpeed)
        end)
        speedUp.MouseButton1Click:Connect(function()
            flySpeed = math.min(100, flySpeed + 5)
            speedValue.Text = tostring(flySpeed)
        end)
        
        local flyActive = false
        local bodyVelocity = nil
        local bodyGyro = nil
        local flyConnection = nil
        
        local function stopFly()
            local player = game.Players.LocalPlayer
            local char = player and player.Character
            if bodyVelocity then bodyVelocity:Destroy() bodyVelocity = nil end
            if bodyGyro then bodyGyro:Destroy() bodyGyro = nil end
            if flyConnection then flyConnection:Disconnect() flyConnection = nil end
            if char then
                local hum = char:FindFirstChildOfClass("Humanoid")
                if hum then
                    hum:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
                    hum:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true)
                    hum:ChangeState(Enum.HumanoidStateType.Landed)
                end
                local root = char:FindFirstChild("HumanoidRootPart")
                if root then
                    root.Velocity = Vector3.zero
                    root:SetNetworkOwner(nil)
                end
            end
        end
        
        local function startFly()
            local player = game.Players.LocalPlayer
            local char = player.Character
            if not char then return end
            local hum = char:FindFirstChildOfClass("Humanoid")
            local root = char:FindFirstChild("HumanoidRootPart")
            if not hum or not root then return end
            
            hum:SetStateEnabled(Enum.HumanoidStateType.Jumping, false)
            hum:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
            root.Anchored = false
            
            bodyGyro = Instance.new("BodyGyro", root)
            bodyGyro.P = 1e5
            bodyGyro.MaxTorque = Vector3.new(1,1,1) * 1e6
            bodyGyro.CFrame = root.CFrame
            
            bodyVelocity = Instance.new("BodyVelocity", root)
            bodyVelocity.P = 1e5
            bodyVelocity.MaxForce = Vector3.new(1,1,1) * 1e6
            bodyVelocity.Velocity = Vector3.zero
            
            flyConnection = game:GetService("RunService").RenderStepped:Connect(function()
                if not flyActive then return end
                local currentChar = player.Character
                if not currentChar or not currentChar.PrimaryPart then
                    stopFly()
                    return
                end
                local moveDirection = game:GetService("UserInputService"):GetMoveDirection()
                local camera = workspace.CurrentCamera
                local forwardVector = camera.CFrame.LookVector * moveDirection.Z
                local rightVector = camera.CFrame.RightVector * moveDirection.X
                local moveVector = (forwardVector + rightVector) * (flySpeed * 8)
                if bodyVelocity then bodyVelocity.Velocity = moveVector end
                if bodyGyro and moveVector.Magnitude > 0.1 then
                    bodyGyro.CFrame = CFrame.new(root.Position, root.Position + moveVector.Unit)
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
        
        -- ===== FLING (ИЗ INFINITY YIELD) =====
        local flingBtn = Instance.new("TextButton", pg)
        flingBtn.Size = UDim2.new(0.6,0,0,rowH)
        flingBtn.Position = UDim2.new(0.2,0,0,yOffset+rowH*6+32)
        flingBtn.BackgroundColor3 = C.btn
        flingBtn.Text = "💫 FLING: ВЫКЛ"
        flingBtn.TextColor3 = Color3.fromRGB(255,100,100)
        flingBtn.Font = Enum.Font.GothamBold
        flingBtn.TextSize = 11
        Instance.new("UICorner", flingBtn).CornerRadius = UDim.new(0,4)
        
        -- Регулировка силы флинга
        local flingLabel = Instance.new("TextLabel", pg)
        flingLabel.Size = UDim2.new(0.3,0,0,rowH-6)
        flingLabel.Position = UDim2.new(0.2,0,0,yOffset+rowH*7+36)
        flingLabel.BackgroundTransparency = 1
        flingLabel.Text = "Сила FLING:"
        flingLabel.TextColor3 = C.white
        flingLabel.Font = Enum.Font.Gotham
        flingLabel.TextSize = 9
        flingLabel.TextXAlignment = Enum.TextXAlignment.Left
        
        local flingValue = Instance.new("TextLabel", pg)
        flingValue.Size = UDim2.new(0.15,0,0,rowH-6)
        flingValue.Position = UDim2.new(0.5,0,0,yOffset+rowH*7+36)
        flingValue.BackgroundColor3 = C.side
        flingValue.Text = "5000"
        flingValue.TextColor3 = C.white
        flingValue.Font = Enum.Font.GothamBold
        flingValue.TextSize = 9
        Instance.new("UICorner", flingValue).CornerRadius = UDim.new(0,4)
        
        local flingDown = Instance.new("TextButton", pg)
        flingDown.Size = UDim2.new(0.1,0,0,rowH-6)
        flingDown.Position = UDim2.new(0.66,0,0,yOffset+rowH*7+36)
        flingDown.BackgroundColor3 = C.btn
        flingDown.Text = "-500"
        flingDown.TextColor3 = C.white
        flingDown.Font = Enum.Font.GothamBold
        flingDown.TextSize = 9
        Instance.new("UICorner", flingDown).CornerRadius = UDim.new(0,4)
        
        local flingUp = Instance.new("TextButton", pg)
        flingUp.Size = UDim2.new(0.1,0,0,rowH-6)
        flingUp.Position = UDim2.new(0.77,0,0,yOffset+rowH*7+36)
        flingUp.BackgroundColor3 = C.btn
        flingUp.Text = "+500"
        flingUp.TextColor3 = C.white
        flingUp.Font = Enum.Font.GothamBold
        flingUp.TextSize = 9
        Instance.new("UICorner", flingUp).CornerRadius = UDim.new(0,4)
        
        local flingPower = 5000
        flingDown.MouseButton1Click:Connect(function()
            flingPower = math.max(500, flingPower - 500)
            flingValue.Text = tostring(flingPower)
        end)
        flingUp.MouseButton1Click:Connect(function()
            flingPower = math.min(50000, flingPower + 500)
            flingValue.Text = tostring(flingPower)
        end)
        
        local flingActive = false
        local flingConnection = nil
        local originalVel = nil
        
        local function stopFling()
            local player = game.Players.LocalPlayer
            local char = player and player.Character
            if flingConnection then flingConnection:Disconnect() flingConnection = nil end
            if char and char:FindFirstChild("HumanoidRootPart") then
                local root = char.HumanoidRootPart
                if originalVel then
                    root.Velocity = originalVel
                    originalVel = nil
                end
                root:SetNetworkOwner(nil)
            end
            local hum = char and char:FindFirstChildOfClass("Humanoid")
            if hum then
                hum:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
                hum:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true)
            end
        end
        
        local function startFling()
            local player = game.Players.LocalPlayer
            local char = player.Character
            if not char then return end
            local root = char:FindFirstChild("HumanoidRootPart")
            local hum = char:FindFirstChildOfClass("Humanoid")
            if not root or not hum then return end
            
            originalVel = root.Velocity
            hum:SetStateEnabled(Enum.HumanoidStateType.Jumping, false)
            hum:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
            
            flingConnection = game:GetService("RunService").Heartbeat:Connect(function()
                if not flingActive or not root or not root.Parent then
                    stopFling()
                    return
                end
                root.Velocity = root.CFrame.LookVector * flingPower
                root:SetNetworkOwner(nil)
            end)
        end
        
        local function toggleFling()
            flingActive = not flingActive
            if flingActive then
                flingBtn.Text = "💫 FLING: ВКЛ"
                flingBtn.TextColor3 = Color3.fromRGB(100,255,100)
                startFling()
            else
                flingBtn.Text = "💫 FLING: ВЫКЛ"
                flingBtn.TextColor3 = Color3.fromRGB(255,100,100)
                stopFling()
            end
        end
        
        flingBtn.MouseButton1Click:Connect(toggleFling)
        
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
