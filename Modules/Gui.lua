return function()
    local plr = game.Players.LocalPlayer
    local pg = plr:WaitForChild("PlayerGui")
    
    for _, v in pairs(pg:GetChildren()) do
        if v.Name == "DamirHub" then v:Destroy() end
    end
    
    local gui = Instance.new("ScreenGui", pg)
    gui.Name = "DamirHub"
    gui.ResetOnSpawn = false
    
    local main = Instance.new("Frame", gui)
    main.Size = UDim2.new(0,300,0,200)
    main.Position = UDim2.new(0.5,-150,0.5,-100)
    main.BackgroundColor3 = Color3.fromRGB(30,30,40)
    main.BorderSizePixel = 0
    main.Active = true
    main.Draggable = true
    main.ZIndex = 999
    
    local title = Instance.new("TextLabel", main)
    title.Size = UDim2.new(1,0,0,30)
    title.BackgroundColor3 = Color3.fromRGB(40,40,50)
    title.Text = "DAMIR HUB v8.0"
    title.TextColor3 = Color3.new(1,1,1)
    title.Font = Enum.Font.GothamBold
    title.TextSize = 14
    
    local test = Instance.new("TextLabel", main)
    test.Size = UDim2.new(1,0,0,80)
    test.Position = UDim2.new(0,0,0,60)
    test.BackgroundTransparency = 1
    test.Text = "Если ты это видишь -\nGUI работает!"
    test.TextColor3 = Color3.fromRGB(0,255,0)
    test.Font = Enum.Font.GothamBold
    test.TextSize = 16
    
    return {
        colors = {},
        main = main,
        farm = main,
        fun = main,
        settings = main,
        changelog = main
    }
end
