return {
    start = function(GUI, spn)
        local C = GUI.colors local pg = GUI.farm
        
        local ft = Instance.new("TextLabel", pg) ft.Size = UDim2.new(1,0,0,18) ft.BackgroundTransparency = 1
        ft.Text = "МОЛОТ v8.4 (ЛОДКА > ВЕРТОЛЁТ)" ft.TextColor3 = C.white ft.Font = Enum.Font.GothamBold ft.TextSize = 12 ft.TextXAlignment = Enum.TextXAlignment.Left
        
        -- АВТООПРЕДЕЛИТЕЛЬ МАШИНЫ (сразу под заголовком)
        local cf = Instance.new("Frame", pg) cf.Size = UDim2.new(1,0,0,30) cf.Position = UDim2.new(0,0,0,22) cf.BackgroundColor3 = C.side
        Instance.new("UICorner", cf).CornerRadius = UDim.new(0,4)
        local cl = Instance.new("TextLabel", cf) cl.Size = UDim2.new(1,-14,1,0) cl.Position = UDim2.new(0,7,0,0) cl.BackgroundTransparency = 1
        cl.Text = "🚗 Ищу машину..." cl.TextColor3 = C.white cl.Font = Enum.Font.GothamBold cl.TextSize = 11 cl.TextXAlignment = Enum.TextXAlignment.Left
        
        -- СТАТИСТИКА (чуть ниже)
        local sl = Instance.new("TextLabel", pg) sl.Size = UDim2.new(1,0,0,16) sl.Position = UDim2.new(0,0,0,56) sl.BackgroundTransparency = 1
        sl.Text = "Ударов: 0 | Сломано: 0 | Авто: 0" sl.TextColor3 = C.white sl.Font = Enum.Font.Gotham sl.TextSize = 10 sl.TextXAlignment = Enum.TextXAlignment.Left
        
        -- ===== ОСНОВНЫЕ ФУНКЦИИ =====
        local function getVehiclesByType(seatType)
            local list = {}
            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("Model") and v:FindFirstChild(seatType) and v.Parent and v.Parent.Name == "Vehicles" then
                    table.insert(list, v)
                end
            end
            return list
        end
        
        local function getFreeSeat(vehicle)
            for _, child in pairs(vehicle:GetChildren()) do
                if child:IsA("VehicleSeat") and not child.Occupant then
                    return child
                end
            end
            return nil
        end
        
        local function teleportToVehicle(keyword)
            local vehicles = getVehiclesByType("VehicleSeat")
            local best = nil
            for _, v in pairs(vehicles) do
                if string.find(v.Name:lower(), keyword:lower()) then
                    local seat = getFreeSeat(v)
                    if seat then best = seat break end
                end
            end
            
            if best then
                local char = game.Players.LocalPlayer.Character
                if char and char:FindFirstChild("HumanoidRootPart") then
                    char.HumanoidRootPart.CFrame = best.CFrame
                    wait(0.2)
                    local hum = char:FindFirstChildOfClass("Humanoid")
                    if hum then
                        hum.Sit = true
                        best.Occupant = hum
                    end
                    return true
                end
            end
            return false
        end
        
        local function getCar()
            local c = game.Players.LocalPlayer.Character if not c then return nil end
            local h = c:FindFirstChildOfClass("Humanoid") if not h or not h.SeatPart then return nil end
            local cur = h.SeatPart
            while cur do
                if cur:IsA("Model") and cur.Parent and cur.Parent.Name == "Vehicles" then return cur end
                if cur:IsA("Model") and cur.Name ~= "Body" and cur.Name ~= "Engine" and cur.Name ~= "Wheels" and cur ~= c then return cur end
                cur = cur.Parent
            end
            return nil
        end
        
        spawn(function() while wait(0.3) do pcall(function()
            local c = getCar() if c then cl.Text = "🚗 "..c.Name else cl.Text = "🚗 Сядьте!" end
        end) end end)
        
        local ho, ao, hits, bro, cyc, lastMode = false, false, 0, 0, 0, nil
        
        local function smash()
            local c = getCar() if not c then return false end
            local r = c.PrimaryPart or c:FindFirstChildWhichIsA("BasePart") if not r then return false end
            local oldPos = r.Position
            r.Velocity = Vector3.zero
            r.CFrame = CFrame.new(r.Position.X, GUI.hammerHeight or 200, r.Position.Z)
            wait(0.15)
            r.Velocity = Vector3.new(0, -(GUI.hammerSpeed or 1500), 0)
            wait(1.0)
            if (r.Position - oldPos).Magnitude < 0.5 then return "stuck" end
            if not c.Parent then bro = bro + 1 return true end
            return false
        end
        
        local function forceRespawn()
            pcall(function() spn.click() cl.Text = "🔄 Форс-респавн..." end)
        end
        
        -- ЭВАКУАЦИЯ С ПРИОРИТЕТОМ ЛОДКИ
        local function emergencyAndReturn()
            if not ho and not ao then return end
            
            if ho then lastMode = "ho"
            elseif ao then lastMode = "ao" end
            
            ho = false
            ao = false
            hb.Text = "🔨 ВКЛЮЧИТЬ МОЛОТ"
            hb.TextColor3 = C.red
            ab.Text = "🤖 АВТО-ФАРМ"
            ab.TextColor3 = C.white
            
            cl.Text = "💀 ДЕТЕКТ 'УМРИ'! ЭВАКУАЦИЯ..."
            wait(0.5)
            
            if teleportToVehicle("boat") then
                cl.Text = "🛥 Эвакуирован на лодку. Ожидание 5 сек..."
            elseif teleportToVehicle("helikopter") or teleportToVehicle("heli") then
                cl.Text = "🚁 Эвакуирован на вертолёт. Ожидание 5 сек..."
            else
                local vehicles = getVehiclesByType("VehicleSeat")
                local any = false
                for _, v in pairs(vehicles) do
                    if getFreeSeat(v) then
                        teleportToVehicle(v.Name)
                        cl.Text = "🚗 Эвакуирован на "..v.Name..". Ожидание 5 сек..."
                        any = true
                        break
                    end
                end
                if not any then
                    cl.Text = "⚠️ Транспорт не найден. Жду 5 сек..."
                end
            end
            
            wait(5)
            
            if lastMode == "ho" then
                ho = true
                hb.Text = "🔨 МОЛОТ АКТИВИРОВАН"
                hb.TextColor3 = C.green
                hb.BackgroundColor3 = Color3.fromRGB(18,38,24)
                coroutine.wrap(function() while ho do 
                    local result = smash() 
                    if result == "stuck" then forceRespawn() wait(1.5)
                    elseif result == true then bro = bro + 1 end
                    hits = hits + 1 
                    sl.Text = "Hits: "..hits.." | Broken: "..bro.." | Auto: "..cyc 
                    wait(0.3) 
                end end)()
            elseif lastMode == "ao" then
                ao = true
                ab.Text = "🤖 АВТО АКТИВЕН"
                ab.TextColor3 = C.green
                ab.BackgroundColor3 = Color3.fromRGB(40,25,10)
                coroutine.wrap(function()
                    local stuckCount = 0
                    while ao do
                        local c = getCar()
                        if not c then 
                            cl.Text = "🚗 Респавн..." 
                            spn.click() 
                            wait(3)
                        else 
                            local d = false 
                            for i=1,20 do 
                                if not ao then break end 
                                local result = smash() 
                                hits = hits + 1 
                                if result == "stuck" then
                                    stuckCount = stuckCount + 1
                                    if stuckCount >= 3 then
                                        cl.Text = "🔄 Застревание! Респавн..."
                                        forceRespawn()
                                        stuckCount = 0
                                        break
                                    end
                                elseif result == true then 
                                    d = true 
                                    stuckCount = 0
                                    break 
                                else stuckCount = 0 end
                                sl.Text = "Hits: "..hits.." | Broken: "..bro.." | Auto: "..cyc 
                                if d then break end
                                wait(0.2) 
                            end
                            if d then 
                                cyc = cyc + 1 
                                sl.Text = "Hits: "..hits.." | Broken: "..bro.." | Auto: "..cyc 
                                cl.Text = "💀 Уничтожена!" 
                                wait(1) 
                                cl.Text = "🚗 Респавн..." 
                                spn.click() 
                                wait(3) 
                            end
                        end
                    end
                end)()
            end
            lastMode = nil
        end
        
        -- ДЕТЕКТОР "УМРИ"
        spawn(function()
            while true do
                pcall(function()
                    local chat = game:GetService("Chat")
                    for _, msg in pairs(chat:GetChildren()) do
                        if msg:IsA("TextChatMessage") or (msg.Text and type(msg.Text)=="string") then
                            local txt = msg.Text or (msg:FindFirstChild("Text") and msg.Text.Text) or ""
                            if string.find(txt:lower(), "умри") then
                                emergencyAndReturn()
                                break
                            end
                        end
                    end
                end)
                wait(0.5)
            end
        end)
        
        -- ===== GUI ЭЛЕМЕНТЫ (всё поднято) =====
        local yOffset = 78  -- РАНЬШЕ БЫЛО 162, ТЕПЕРЬ СРАЗУ ПОД СТАТИСТИКОЙ
        
        -- КНОПКА МОЛОТА
        local hb = Instance.new("TextButton", pg) 
        hb.Size = UDim2.new(1,0,0,36) 
        hb.Position = UDim2.new(0,0,0,yOffset)
        hb.BackgroundColor3 = C.btn 
        hb.Text = "🔨 ВКЛЮЧИТЬ МОЛОТ" 
        hb.TextColor3 = C.red 
        hb.Font = Enum.Font.GothamBold 
        hb.TextSize = 12 
        hb.BorderSizePixel = 0
        Instance.new("UICorner", hb).CornerRadius = UDim.new(0,5)
        Instance.new("UIStroke", hb).Thickness = 1.5 
        Instance.new("UIStroke", hb).Color = Color3.fromRGB(0,0,0)
        
        -- КНОПКА АВТО-ФАРМА
        local ab = Instance.new("TextButton", pg) 
        ab.Size = UDim2.new(1,0,0,36) 
        ab.Position = UDim2.new(0,0,0,yOffset+42)
        ab.BackgroundColor3 = C.btn 
        ab.Text = "🤖 АВТО-ФАРМ" 
        ab.TextColor3 = C.white 
        ab.Font = Enum.Font.GothamBold 
        ab.TextSize = 12 
        ab.BorderSizePixel = 0
        Instance.new("UICorner", ab).CornerRadius = UDim.new(0,5)
        Instance.new("UIStroke", ab).Thickness = 1.5 
        Instance.new("UIStroke", ab).Color = Color3.fromRGB(0,0,0)
        
        -- ПОДСКАЗКА (под кнопками)
        local hint = Instance.new("TextLabel", pg) 
        hint.Size = UDim2.new(1,0,0,28) 
        hint.Position = UDim2.new(0,0,0,yOffset+84)
        hint.BackgroundColor3 = Color3.fromRGB(20,20,30)
        hint.BackgroundTransparency = 0.4
        hint.Text = "⚠️ При 'умри' в чате → эвакуация на ЛОДКУ (или вертолёт)\n→ 5 сек паузы → авто-возврат к фарму"
        hint.TextColor3 = Color3.fromRGB(200,200,150)
        hint.Font = Enum.Font.Gotham
        hint.TextSize = 9
        hint.TextWrapped = true
        hint.TextXAlignment = Enum.TextXAlignment.Center
        Instance.new("UICorner", hint).CornerRadius = UDim.new(0,4)
        
        -- ИНДИКАТОР (в самом низу)
        local hi = Instance.new("TextLabel", pg) 
        hi.Size = UDim2.new(1,0,0,14) 
        hi.Position = UDim2.new(0,0,0,yOffset+116) 
        hi.BackgroundTransparency = 1
        hi.Text = "✅ Анти-застревание | Эвакуация: ЛОДКА → ВЕРТОЛЁТ" 
        hi.TextColor3 = Color3.fromRGB(80,255,80) 
        hi.Font = Enum.Font.Gotham 
        hi.TextSize = 9 
        hi.TextXAlignment = Enum.TextXAlignment.Center
        
        -- ===== ОБРАБОТЧИКИ КНОПОК =====
        hb.MouseButton1Click:Connect(function()
            ho = not ho
            if ho then
                if ao then ao = false ab.Text = "🤖 АВТО-ФАРМ" end
                hb.Text = "🔨 МОЛОТ АКТИВИРОВАН" 
                hb.TextColor3 = C.green 
                hb.BackgroundColor3 = Color3.fromRGB(18,38,24)
                coroutine.wrap(function() while ho do 
                    local result = smash() 
                    if result == "stuck" then forceRespawn() wait(1.5)
                    elseif result == true then bro = bro + 1 end
                    hits = hits + 1 
                    sl.Text = "Hits: "..hits.." | Broken: "..bro.." | Auto: "..cyc 
                    wait(0.3) 
                end end)()
            else 
                hb.Text = "🔨 ВКЛЮЧИТЬ МОЛОТ" 
                hb.TextColor3 = C.red 
                hb.BackgroundColor3 = C.btn 
            end
        end)
        
        ab.MouseButton1Click:Connect(function()
            ao = not ao
            if ao then
                if ho then 
                    ho = false 
                    hb.Text = "🔨 ВКЛЮЧИТЬ МОЛОТ" 
                end
                ab.Text = "🤖 АВТО АКТИВЕН" 
                ab.TextColor3 = C.green 
                ab.BackgroundColor3 = Color3.fromRGB(40,25,10)
                coroutine.wrap(function()
                    local stuckCount = 0
                    while ao do
                        local c = getCar()
                        if not c then 
                            cl.Text = "🚗 Респавн..." 
                            spn.click() 
                            wait(3)
                        else 
                            local d = false 
                            for i=1,20 do 
                                if not ao then break end 
                                local result = smash() 
                                hits = hits + 1 
                                if result == "stuck" then
                                    stuckCount = stuckCount + 1
                                    if stuckCount >= 3 then
                                        cl.Text = "🔄 Застревание! Респавн..."
                                        forceRespawn()
                                        stuckCount = 0
                                        break
                                    end
                                elseif result == true then 
                                    d = true 
                                    stuckCount = 0
                                    break 
                                else stuckCount = 0 end
                                sl.Text = "Hits: "..hits.." | Broken: "..bro.." | Auto: "..cyc 
                                if d then break end
                                wait(0.2) 
                            end
                            if d then 
                                cyc = cyc + 1 
                                sl.Text = "Hits: "..hits.." | Broken: "..bro.." | Auto: "..cyc 
                                cl.Text = "💀 Уничтожена!" 
                                wait(1) 
                                cl.Text = "🚗 Респавн..." 
                                spn.click() 
                                wait(3) 
                            end
                        end
                    end
                end)()
            else 
                ab.Text = "🤖 АВТО-ФАРМ" 
                ab.TextColor3 = C.white 
                ab.BackgroundColor3 = C.btn 
            end
        end)
    end
}
