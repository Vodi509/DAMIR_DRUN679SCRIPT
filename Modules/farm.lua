return {
    start = function(gui, spn)
        local C = gui.colors
        local page = gui.farm
        
        local title = Instance.new("TextLabel", page)
        title.Size = UDim2.new(1,0,0,18)
        title.BackgroundTransparency = 1
        title.Text = "МОЛОТ v8.0"
        title.TextColor3 = C.white
        title.Font = Enum.Font.GothamBold
        title.TextSize = 12
        title.TextXAlignment = Enum.TextXAlignment.Left
        
        local carBg = Instance.new("Frame", page)
        carBg.Size = UDim2.new(1,0,0,30)
        carBg.Position = UDim2.new(0,0,0,22)
        carBg.BackgroundColor3 = C.side
        Instance.new("UICorner", carBg).CornerRadius = UDim.new(0,4)
        
        local carLbl = Instance.new("TextLabel", carBg)
        carLbl.Size = UDim2.new(1,-14,1,0)
        carLbl.Position = UDim2.new(0,7,0,0)
        carLbl.BackgroundTransparency = 1
        carLbl.Text = "🚗 Ищу машину..."
        carLbl.TextColor3 = C.grey
        carLbl.Font = Enum.Font.GothamBold
        carLbl.TextSize = 11
        carLbl.TextXAlignment = Enum.TextXAlignment.Left
        
        local statLbl = Instance.new("TextLabel", page)
        statLbl.Size = UDim2.new(1,0,0,16)
        statLbl.Position = UDim2.new(0,0,0,56)
        statLbl.BackgroundTransparency = 1
        statLbl.Text = "Ударов: 0 | Сломано: 0 | Авто: 0"
        statLbl.TextColor3 = C.grey
        statLbl.Font = Enum.Font.Gotham
        statLbl.TextSize = 10
        statLbl.TextXAlignment = Enum.TextXAlignment.Left
        
        local function getCar()
            local c = game.Players.LocalPlayer.Character
            if not c then return nil end
            local h = c:FindFirstChildOfClass("Humanoid")
            if not h or not h.SeatPart then return nil end
            local cur = h.SeatPart
            while cur do
                if cur:IsA("Model") and cur.Parent and cur.Parent.Name == "Vehicles" then return cur end
                if cur:IsA("Model") and cur.Name ~= "Body" and cur.Name ~= "Engine" and cur.Name ~= "Wheels" and cur ~= c then return cur end
                cur = cur.Parent
            end
            return nil
        end
        
        spawn(function()
            while wait(0.3) do
                pcall(function()
                    local c = getCar()
                    if c then
                        carLbl.Text = "🚗 " .. c.Name
                        carLbl.TextColor3 = C.blue
                    else
                        carLbl.Text = "🚗 Сядьте в машину!"
                        carLbl.TextColor3 = C.red
                    end
                end)
            end
        end)
        
        local hammerOn = false
        local autoOn = false
        local hits = 0
        local broken = 0
        local cycles = 0
        
        local function smash()
            local c = getCar()
            if not c then return false end
            local r = c.PrimaryPart or c:FindFirstChildWhichIsA("BasePart")
            if not r then return false end
            r.Velocity = Vector3.zero
            r.CFrame = CFrame.new(r.Position.X, 200, r.Position.Z)
            wait(0.15)
            r.Velocity = Vector3.new(0, -1500, 0)
            wait(1.0)
            if not c.Parent then
                broken = broken + 1
                return true
            end
            return false
        end
        
        local hammerBtn = Instance.new("TextButton", page)
        hammerBtn.Size = UDim2.new(1,0,0,36)
        hammerBtn.Position = UDim2.new(0,0,0,78)
        hammerBtn.BackgroundColor3 = C.btn
        hammerBtn.Text = "🔨 ВКЛЮЧИТЬ МОЛОТ"
        hammerBtn.TextColor3 = C.red
        hammerBtn.Font = Enum.Font.GothamBold
        hammerBtn.TextSize = 12
        hammerBtn.BorderSizePixel = 0
        Instance.new("UICorner", hammerBtn).CornerRadius = UDim.new(0,5)
        
        local autoBtn = Instance.new("TextButton", page)
        autoBtn.Size = UDim2.new(1,0,0,36)
        autoBtn.Position = UDim2.new(0,0,0,122)
        autoBtn.BackgroundColor3 = C.btn
        autoBtn.Text = "🤖 АВТО-ФАРМ"
        autoBtn.TextColor3 = C.grey
        autoBtn.Font = Enum.Font.GothamBold
        autoBtn.TextSize = 12
        autoBtn.BorderSizePixel = 0
        Instance.new("UICorner", autoBtn).CornerRadius = UDim.new(0,5)
        
        hammerBtn.MouseButton1Click:Connect(function()
            hammerOn = not hammerOn
            if hammerOn then
                if autoOn then
                    autoOn = false
                    autoBtn.Text = "🤖 АВТО-ФАРМ"
                    autoBtn.TextColor3 = C.grey
                    autoBtn.BackgroundColor3 = C.btn
                end
                hammerBtn.Text = "🔨 МОЛОТ АКТИВИРОВАН"
                hammerBtn.TextColor3 = C.green
                hammerBtn.BackgroundColor3 = Color3.fromRGB(18,38,24)
                coroutine.wrap(function()
                    while hammerOn do
                        smash()
                        hits = hits + 1
                        statLbl.Text = "Ударов: " .. hits .. " | Сломано: " .. broken .. " | Авто: " .. cycles
                        wait(0.3)
                    end
                end)()
            else
                hammerBtn.Text = "🔨 ВКЛЮЧИТЬ МОЛОТ"
                hammerBtn.TextColor3 = C.red
                hammerBtn.BackgroundColor3 = C.btn
            end
        end)
        
        autoBtn.MouseButton1Click:Connect(function()
            autoOn = not autoOn
            if autoOn then
                if hammerOn then
                    hammerOn = false
                    hammerBtn.Text = "🔨 ВКЛЮЧИТЬ МОЛОТ"
                    hammerBtn.TextColor3 = C.red
                    hammerBtn.BackgroundColor3 = C.btn
                end
                autoBtn.Text = "🤖 АВТО-ФАРМ АКТИВИРОВАН"
                autoBtn.TextColor3 = C.green
                autoBtn.BackgroundColor3 = Color3.fromRGB(40,25,10)
                coroutine.wrap(function()
                    while autoOn do
                        local c = getCar()
                        if not c then
                            carLbl.Text = "🚗 Респавн..."
                            spn.click()
                            wait(3)
                        else
                            local done = false
                            for i = 1, 20 do
                                if not autoOn then break end
                                done = smash()
                                hits = hits + 1
                                statLbl.Text = "Ударов: " .. hits .. " | Сломано: " .. broken .. " | Авто: " .. cycles
                                if done then break end
                                wait(0.2)
                            end
                            if done then
                                cycles = cycles + 1
                                statLbl.Text = "Ударов: " .. hits .. " | Сломано: " .. broken .. " | Авто: " .. cycles
                                carLbl.Text = "💀 Уничтожена!"
                                wait(1)
                                carLbl.Text = "🚗 Респавн..."
                                spn.click()
                                wait(3)
                            end
                        end
                    end
                end)()
            else
                autoBtn.Text = "🤖 АВТО-ФАРМ"
                autoBtn.TextColor3 = C.grey
                autoBtn.BackgroundColor3 = C.btn
            end
        end)
    end
}
