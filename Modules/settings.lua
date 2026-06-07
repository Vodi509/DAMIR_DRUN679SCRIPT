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
        noclipBtn.Size = UDim2.new(0.45,0,0,rowH)
        noclipBtn.Position = UDim2.new(0,0,0,yOffset+rowH*3+12)
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
        
        -- ===== FLY (ПО НАПРАВЛЕНИЮ КАМЕРЫ) =====
        local flyBtn = Instance.new("TextButton", pg)
        flyBtn.Size = UDim2.new(0.45,0,0,rowH)
        flyBtn.Position = UDim2.new(0.52,0,0,yOffset+rowH*3+12)
        flyBtn.BackgroundColor3 = C.btn
        flyBtn.Text = "🕊 FLY: ВЫКЛ"
        flyBtn.TextColor3 = Color3.fromRGB(255,100,100)
        flyBtn.Font = Enum.Font.GothamBold
        flyBtn.TextSize = 11
        Instance.new("UICorner", flyBtn).CornerRadius = UDim.new(0,4)
        
        local flyActive = false
        local bodyVelocity = nil
        local bg = nil
        local flyConnection = nil
        
        local function toggleFly()
            flyActive = not flyActive
            local char = game.Players.LocalPlayer.Character
            local hum = char and char:FindFirstChildOfClass("Humanoid")
            
            if flyActive then
                flyBtn.Text = "🕊 FLY: ВКЛ"
                flyBtn.TextColor3 = Color3.fromRGB(100,255,100)
                
                if char and hum then
                    hum:SetStateEnabled(Enum.HumanoidStateType.Jumping, false)
                    hum:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
                    
                    bg = Instance.new("BodyGyro", char.PrimaryPart)
                    bg.P = 10000
                    bg.MaxTorque = Vector3.new(1,1,1)*1e6
                    
                    bodyVelocity = Instance.new("BodyVelocity", char.PrimaryPart)
                    bodyVelocity.P = 5000
                    bodyVelocity.MaxForce = Vector3.new(1,1,1)*1e6
                    bodyVelocity.Velocity = Vector3.zero
                    
                    if flyConnection then flyConnection:Disconnect() end
                    flyConnection = game:GetService("RunService").RenderStepped:Connect(function()
                        if not flyActive or not char or not char.PrimaryPart then
                            return
                        end
                        
                        -- Берём направление камеры
                        local cam = workspace.CurrentCamera
                        local camLook = cam.CFrame.LookVector
                        
                        -- Джойстик даёт силу и горизонтальное направление
                        local moveDir = game:GetService("UserInputService"):GetMoveDirection()
                        local forwardStrength = moveDir.Z  -- вперёд/назад (на телефоне вверх/вниз по джойстику)
                        local rightStrength = moveDir.X   -- влево/вправо
                        
                        -- Считаем направление полёта:
                        -- Вперёд/назад по направлению камеры (с учётом её наклона)
                        -- Влево/вправо перпендикулярно камере
                        local forward = cam.CFrame.LookVector * forwardStrength
                        local right = cam.CFrame.RightVector * rightStrength
                        
                        -- Итоговое движение
                        local moveVelocity = (forward + right) * 60
                        
                        -- Поворачиваем персонажа в сторону движения (если есть)
                        if moveVelocity.Magnitude > 0.1 then
                            bg.CFrame = CFrame.new(char.PrimaryPart.Position, char.PrimaryPart.Position + moveVelocity.Unit)
                        end
                        
                        bodyVelocity.Velocity = moveVelocity
                    end)
                    
                    char.PrimaryPart.Anchored = false
                end
            else
                flyBtn.Text = "🕊 FLY: ВЫКЛ"
                flyBtn.TextColor3 = Color3.fromRGB(255,100,100)
                
                if bg then bg:Destroy() bg = nil end
                if bodyVelocity then bodyVelocity:Destroy() bodyVelocity = nil end
                if flyConnection then flyConnection:Disconnect() flyConnection = nil end
                
                if char and hum then
                    hum:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
                    hum:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true)
                    local root = char:FindFirstChild("HumanoidRootPart")
                    if root then
                        root.Velocity = Vector3.zero
                        root:SetNetworkOwner(nil)
                    end
                end
            end
        end
        
        flyBtn.MouseButton1Click:Connect(toggleFly)
        
        -- ОБРАБОТЧИКИ
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
    end
}
