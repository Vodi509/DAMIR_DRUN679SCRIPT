-- [[ DAMIR HUB v8.0 - MINIMIZE & CLOSE ]] --
local B = "https://raw.githubusercontent.com/Vodi509/DAMIR_DRUN679SCRIPT/refs/heads/main/Modules"

local function loadMod(name)
    local ok, data = pcall(function() return game:HttpGet(B .. "/" .. name) end)
    if not ok then return nil end
    local fn, err = loadstring(data)
    if not fn then return nil end
    local ok2, result = pcall(fn)
    if not ok2 then return nil end
    return result
end

-- ==================== GUI ====================
local plr = game.Players.LocalPlayer
local pg = plr:WaitForChild("PlayerGui")
for _, v in pairs(pg:GetChildren()) do
    if v.Name == "DamirHub" or v.Name == "DamirMini" then v:Destroy() end
end

local C = {
    bg = Color3.fromRGB(18,18,24),
    side = Color3.fromRGB(24,24,32),
    btn = Color3.fromRGB(32,32,42),
    white = Color3.new(1,1,1),
    grey = Color3.fromRGB(140,140,160),
    green = Color3.fromRGB(0,255,150),
    red = Color3.fromRGB(255,55,55),
    blue = Color3.fromRGB(0,200,255),
    purple = Color3.fromRGB(150,90,255),
    gold = Color3.fromRGB(255,210,0)
}

local sg = Instance.new("ScreenGui", pg)
sg.Name = "DamirHub"
sg.ResetOnSpawn = false

-- Мини-панель (свёрнутое окно)
local mini = Instance.new("Frame", sg)
mini.Name = "DamirMini"
mini.Size = UDim2.new(0,130,0,28)
mini.Position = UDim2.new(0.02,0,0.1,0)
mini.BackgroundColor3 = C.side
mini.BorderSizePixel = 0
mini.Visible = false
mini.Active = true
mini.Draggable = true
mini.ZIndex = 99
Instance.new("UICorner", mini).CornerRadius = UDim.new(0,6)
Instance.new("UIStroke", mini).Thickness = 1
Instance.new("UIStroke", mini).Color = C.purple

local restoreBtn = Instance.new("TextButton", mini)
restoreBtn.Size = UDim2.new(1,0,1,0)
restoreBtn.BackgroundTransparency = 1
restoreBtn.Text = "⚡ DAMIR HUB"
restoreBtn.TextColor3 = C.red
restoreBtn.Font = Enum.Font.GothamBold
restoreBtn.TextSize = 12

-- Главное окно
local main = Instance.new("Frame", sg)
main.Size = UDim2.new(0,460,0,310)
main.Position = UDim2.new(0.5,-230,0.3,0)
main.BackgroundColor3 = C.bg
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true
main.ZIndex = 100
Instance.new("UICorner", main).CornerRadius = UDim.new(0,8)

-- Заголовок
local header = Instance.new("Frame", main)
header.Size = UDim2.new(1,0,0,30)
header.BackgroundColor3 = C.side
header.BorderSizePixel = 0
Instance.new("UICorner", header).CornerRadius = UDim.new(0,8)

local title = Instance.new("TextLabel", header)
title.Size = UDim2.new(1,-50,1,0)
title.Position = UDim2.new(0,12,0,0)
title.BackgroundTransparency = 1
title.Text = "DAMIR HUB v8.0"
title.TextColor3 = C.white
title.Font = Enum.Font.GothamBold
title.TextSize = 13
title.TextXAlignment = Enum.TextXAlignment.Left

-- Кнопка сворачивания
local minBtn = Instance.new("TextButton", header)
minBtn.Size = UDim2.new(0,22,0,22)
minBtn.Position = UDim2.new(1,-50,0,4)
minBtn.BackgroundColor3 = C.purple
minBtn.Text = "—"
minBtn.TextColor3 = C.white
minBtn.Font = Enum.Font.GothamBold
minBtn.TextSize = 14
minBtn.BorderSizePixel = 0
Instance.new("UICorner", minBtn).CornerRadius = UDim.new(0,11)

-- Кнопка закрытия
local closeBtn = Instance.new("TextButton", header)
closeBtn.Size = UDim2.new(0,22,0,22)
closeBtn.Position = UDim2.new(1,-25,0,4)
closeBtn.BackgroundColor3 = C.red
closeBtn.Text = "✕"
closeBtn.TextColor3 = C.white
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 12
closeBtn.BorderSizePixel = 0
Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0,11)

-- Логика кнопок
minBtn.MouseButton1Click:Connect(function()
    main.Visible = false
    mini.Visible = true
end)

restoreBtn.MouseButton1Click:Connect(function()
    main.Visible = true
    mini.Visible = false
end)

closeBtn.MouseButton1Click:Connect(function()
    sg:Destroy()
end)

-- Боковая панель
local side = Instance.new("Frame", main)
side.Size = UDim2.new(0,115,1,-30)
side.Position = UDim2.new(0,0,0,30)
side.BackgroundColor3 = C.side
side.BorderSizePixel = 0

local logo = Instance.new("TextLabel", side)
logo.Size = UDim2.new(1,0,0,36)
logo.BackgroundTransparency = 1
logo.Text = "DAMIR HUB"
logo.TextColor3 = C.red
logo.Font = Enum.Font.GothamBold
logo.TextSize = 14

local pages = {}
local function addTab(name, icon, y)
    local btn = Instance.new("TextButton", side)
    btn.Size = UDim2.new(1,-14,0,28)
    btn.Position = UDim2.new(0,7,0,y)
    btn.BackgroundColor3 = C.btn
    btn.Text = icon .. " " .. name
    btn.TextColor3 = C.grey
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 10
    btn.BorderSizePixel = 0
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0,4)
    
    local page = Instance.new("Frame", main)
    page.Size = UDim2.new(1,-125,1,-40)
    page.Position = UDim2.new(0,120,0,35)
    page.BackgroundTransparency = 1
    page.Visible = false
    
    btn.MouseButton1Click:Connect(function()
        for _, p in pairs(pages) do p.Visible = false end
        page.Visible = true
    end)
    
    table.insert(pages, page)
    return page
end

local farmPg = addTab("Фарм", "🚀", 45)
local funPg = addTab("Fun", "🤡", 80)
local setPg = addTab("Настр", "⚙️", 115)
local logPg = addTab("Новое", "📋", 150)
pages[1].Visible = true

local GUI = {colors = C, main = main, farm = farmPg, fun = funPg, settings = setPg, changelog = logPg}

-- ==================== ЗАГРУЗКА МОДУЛЕЙ ====================
local spn = loadMod("spawn.lua") or {click = function() return false end}
local frm = loadMod("farm.lua")
local fun = loadMod("funzone.lua")
local set = loadMod("settings.lua")
local log = loadMod("Changelog.lua")

if frm then frm.start(GUI, spn) end
if fun then fun.start(GUI) end
if set then set.start(GUI) end
if log then log.start(GUI) end
