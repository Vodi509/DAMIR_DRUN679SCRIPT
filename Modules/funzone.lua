return {
    start = function(gui)
        local C = gui.colors
        local page = gui.fun
        
        local title = Instance.new("TextLabel", page)
        title.Size = UDim2.new(1,0,0,18)
        title.BackgroundTransparency = 1
        title.Text = "СЕКРЕТНАЯ КНОПКА"
        title.TextColor3 = C.gold
        title.Font = Enum.Font.GothamBold
        title.TextSize = 12
        title.TextXAlignment = Enum.TextXAlignment.Left
        
        local aura = 0
        local auraLbl = Instance.new("TextLabel", page)
        auraLbl.Size = UDim2.new(1,0,0,28)
        auraLbl.Position = UDim2.new(0,0,0,22)
        auraLbl.BackgroundColor3 = C.side
        auraLbl.Text = "💎 Аура: 0"
        auraLbl.TextColor3 = C.gold
        auraLbl.Font = Enum.Font.GothamBold
        auraLbl.TextSize = 13
        Instance.new("UICorner", auraLbl).CornerRadius = UDim.new(0,4)
        
        local auraBtn = Instance.new("TextButton", page)
        auraBtn.Size = UDim2.new(1,0,0,42)
        auraBtn.Position = UDim2.new(0,0,0,56)
        auraBtn.BackgroundColor3 = C.btn
        auraBtn.Text = "✨ ДАМИР +100M AURA"
        auraBtn.TextColor3 = C.gold
        auraBtn.Font = Enum.Font.GothamBold
        auraBtn.TextSize = 13
        auraBtn.BorderSizePixel = 0
        Instance.new("UICorner", auraBtn).CornerRadius = UDim.new(0,5)
        Instance.new("UIStroke", auraBtn).Thickness = 1.5
        Instance.new("UIStroke", auraBtn).Color = C.gold
        
        auraBtn.MouseButton1Click:Connect(function()
            aura = aura + 100000000
            auraLbl.Text = "💎 Аура: " .. aura
            auraBtn.BackgroundColor3 = Color3.fromRGB(50,40,0)
            wait(0.15)
            auraBtn.BackgroundColor3 = C.btn
        end)
        
        local memes = {
            "rbxassetid://18314115147",
            "rbxassetid://6072171427",
            "rbxassetid://6072166311",
            "rbxassetid://6072153923"
        }
        
        local memeImg = Instance.new("ImageLabel", page)
        memeImg.Size = UDim2.new(0,130,0,130)
        memeImg.Position = UDim2.new(0,0,0,108)
        memeImg.BackgroundColor3 = C.side
        memeImg.Image = memes[1]
        Instance.new("UICorner", memeImg).CornerRadius = UDim.new(0,5)
        
        local memeBtn = Instance.new("TextButton", page)
        memeBtn.Size = UDim2.new(1,0,0,30)
        memeBtn.Position = UDim2.new(0,0,0,245)
        memeBtn.BackgroundColor3 = C.btn
        memeBtn.Text = "СЛЕДУЮЩИЙ МЕМ"
        memeBtn.TextColor3 = C.grey
        memeBtn.Font = Enum.Font.GothamBold
        memeBtn.TextSize = 11
        memeBtn.BorderSizePixel = 0
        Instance.new("UICorner", memeBtn).CornerRadius = UDim.new(0,4)
        
        memeBtn.MouseButton1Click:Connect(function()
            memeImg.Image = memes[math.random(1, #memes)]
        end)
    end
}
