return {
    start = function(GUI, spn)
        local C = GUI.colors local pg = GUI.farm
        
        local ft = Instance.new("TextLabel", pg) ft.Size = UDim2.new(1,0,0,18) ft.BackgroundTransparency = 1
        ft.Text = "МОЛОТ v8.4" ft.TextColor3 = C.white ft.Font = Enum.Font.GothamBold ft.TextSize = 12 ft.TextXAlignment = Enum.TextXAlignment.Left
        
        local cf = Instance.new("Frame", pg) cf.Size = UDim2.new(1,0,0,30) cf.Position = UDim2.new(0,0,0,22) cf.BackgroundColor3 = C.side
        Instance.new("UICorner", cf).CornerRadius = UDim.new(0,4)
        local cl = Instance.new("TextLabel", cf) cl.Size = UDim2.new(1,-14,1,0) cl.Position = UDim2.new(0,7,0,0) cl.BackgroundTransparency = 1
        cl.Text = "🚗 Ищу машину..." cl.TextColor3 = C.white cl.Font = Enum.Font.GothamBold cl.TextSize = 11 cl.TextXAlignment = Enum.TextXAlignment.Left
        
        local sl = Instance.new("TextLabel", pg) sl.Size = UDim2.new(1,0,0,16) sl.Position = UDim2.new(0,0,0,56) sl.BackgroundTransparency = 1
        sl.Text = "Ударов: 0 | Сломано: 0 | Авто: 0" sl.TextColor3 = C.white sl.Font = Enum.Font.Gotham sl.TextSize = 10 sl.TextXAlignment = Enum.TextXAlignment.Left
        
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
        
        local ho, ao, hits, bro, cyc = false, false, 0, 0, 0
        
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
        
        local yOffset = 78
        
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
        
        local hi = Instance.new("TextLabel", pg) 
        hi.Size = UDim2.new(1,0,0,14) 
        hi.Position = UDim2.new(0,0,0,yOffset+84) 
        hi.BackgroundTransparency = 1
        hi.Text = "✅ Анти-застревание" 
        hi.TextColor3 = Color3.fromRGB(80,255,80) 
        hi.Font = Enum.Font.Gotham 
        hi.TextSize = 9 
        hi.TextXAlignment = Enum.TextXAlignment.Center
        
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
                    sl.Text = "Ударов: "..hits.." | Сломано: "..bro.." | Авто: "..cyc 
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
                                sl.Text = "Ударов: "..hits.." | Сломано: "..bro.." | Авто: "..cyc 
                                if d then break end
                                wait(0.2) 
                            end
                            if d then 
                                cyc = cyc + 1 
                                sl.Text = "Ударов: "..hits.." | Сломано: "..bro.." | Авто: "..cyc 
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
