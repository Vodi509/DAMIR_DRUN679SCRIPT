-- [[ DAMIR HUB v8.1 - FIXED LANGUAGES + MINI POSITION ]] --
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

local plr = game.Players.LocalPlayer
local pg = plr:WaitForChild("PlayerGui")
for _, v in pairs(pg:GetChildren()) do if v.Name == "DamirHub" or v.Name == "DamirMini" then v:Destroy() end end

local C = {
    bg = Color3.fromRGB(25,25,35),
    side = Color3.fromRGB(30,30,42),
    btn = Color3.fromRGB(50,50,65),
    white = Color3.new(1,1,1),
    grey = Color3.fromRGB(180,180,200),
    green = Color3.fromRGB(0,255,150),
    red = Color3.fromRGB(255,60,60),
    blue = Color3.fromRGB(0,200,255),
    purple = Color3.fromRGB(170,100,255),
    gold = Color3.fromRGB(255,215,0)
}

local TRANS = 0.25
local lang = "RU"

local T = {
    RU = {
        farm = "🚀 Фарм",
        fun = "🤡 Fun",
        settings = "⚙️ Настр",
        changelog = "📋 Новое",
        title = "DAMIR HUB v8.1"
    },
    EN = {
        farm = "🚀 Farm",
        fun = "🤡 Fun",
        settings = "⚙️ Settings",
        changelog = "📋 News",
        title = "DAMIR HUB v8.1"
    }
}

local sg = Instance.new("ScreenGui", pg)
sg.Name = "DamirHub"
sg.ResetOnSpawn = false
sg.IgnoreGuiInset = true

-- Мини-панель (чуть ниже)
local mini = Instance.new("Frame", sg) mini.Name = "DamirMini"
mini.Size = UDim2.new(0,130,0,28) mini.Position = UDim2.new(0.02,0,0.15,0)
mini.BackgroundColor3 = C.side mini.BackgroundTransparency = TRANS mini.BorderSizePixel = 0
mini.Visible = false mini.Active = true mini.Draggable = true
Instance.new("UICorner", mini).CornerRadius = UDim.new(0,6)
Instance.new("UIStroke", mini).Thickness = 1.5 Instance.new("UIStroke", mini).Color = C.purple

local rBtn = Instance.new("TextButton", mini)
rBtn.Size = UDim2.new(1,0,1,0) rBtn.BackgroundTransparency = 1
rBtn.Text = "⚡ DAMIR HUB" rBtn.TextColor3 = C.white rBtn.Font = Enum.Font.GothamBold rBtn.TextSize = 12

-- Главное окно
local main = Instance.new("Frame", sg)
main.Size = UDim2.new(0,460,0,310) main.Position = UDim2.new(0.5,-230,0.3,0)
main.BackgroundColor3 = C.bg main.BackgroundTransparency = TRANS main.BorderSizePixel = 0
main.Active = true main.Draggable = true
Instance.new("UICorner", main).CornerRadius = UDim.new(0,8)
Instance.new("UIStroke", main).Thickness = 1.5 Instance.new("UIStroke", main).Color = C.purple

-- Заголовок
local hdr = Instance.new("Frame", main)
hdr.Size = UDim2.new(1,0,0,30) hdr.BackgroundColor3 = C.side hdr.BorderSizePixel = 0
Instance.new("UICorner", hdr).CornerRadius = UDim.new(0,8)

local ht = Instance.new("TextLabel", hdr)
ht.Size = UDim2.new(1,-60,1,0) ht.Position = UDim2.new(0,12,0,0) ht.BackgroundTransparency = 1
ht.Text = T[lang].title ht.TextColor3 = C.white ht.Font = Enum.Font.GothamBold ht.TextSize = 13 ht.TextXAlignment = Enum.TextXAlignment.Left

local minB = Instance.new("TextButton", hdr)
minB.Size = UDim2.new(0,22,0,22) minB.Position = UDim2.new(1,-50,0,4)
minB.BackgroundColor3 = C.purple minB.Text = "—" minB.TextColor3 = C.white
minB.Font = Enum.Font.GothamBold minB.TextSize = 14 minB.BorderSizePixel = 0
Instance.new("UICorner", minB).CornerRadius = UDim.new(0,11)

local clB = Instance.new("TextButton", hdr)
clB.Size = UDim2.new(0,22,0,22) clB.Position = UDim2.new(1,-25,0,4)
clB.BackgroundColor3 = C.red clB.Text = "✕" clB.TextColor3 = C.white
clB.Font = Enum.Font.GothamBold clB.TextSize = 12 clB.BorderSizePixel = 0
Instance.new("UICorner", clB).CornerRadius = UDim.new(0,11)

minB.MouseButton1Click:Connect(function() main.Visible = false mini.Visible = true end)
rBtn.MouseButton1Click:Connect(function() main.Visible = true mini.Visible = false end)
clB.MouseButton1Click:Connect(function() sg:Destroy() end)

-- Боковая панель
local side = Instance.new("Frame", main)
side.Size = UDim2.new(0,115,1,-30) side.Position = UDim2.new(0,0,0,30)
side.BackgroundColor3 = C.side side.BackgroundTransparency = TRANS side.BorderSizePixel = 0

local logo = Instance.new("TextLabel", side)
logo.Size = UDim2.new(1,0,0,36) logo.BackgroundTransparency = 1
logo.Text = "DAMIR HUB" logo.TextColor3 = C.red logo.Font = Enum.Font.GothamBold logo.TextSize = 14

local pages = {}
local tabBtns = {}
local function addTab(name, icon, y)
    local btn = Instance.new("TextButton", side)
    btn.Size = UDim2.new(1,-14,0,28) btn.Position = UDim2.new(0,7,0,y)
    btn.BackgroundColor3 = C.btn btn.Text = icon .. " " .. name
    btn.TextColor3 = C.white btn.Font = Enum.Font.GothamBold btn.TextSize = 10 btn.BorderSizePixel = 0
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0,4)
    Instance.new("UIStroke", btn).Thickness = 1 Instance.new("UIStroke", btn).Color = C.purple
    
    local page = Instance.new("Frame", main)
    page.Size = UDim2.new(1,-125,1,-40) page.Position = UDim2.new(0,120,0,35)
    page.BackgroundTransparency = 1 page.Visible = false
    
    btn.MouseButton1Click:Connect(function()
        for _, p in pairs(pages) do p.Visible = false end
        page.Visible = true
        for _, b in pairs(tabBtns) do b.BackgroundColor3 = C.btn end
        btn.BackgroundColor3 = C.purple
    end)
    
    table.insert(pages, page)
    table.insert(tabBtns, btn)
    return page, btn
end

local farmPg, farmBtn = addTab(T[lang].farm, "", 45)
local funPg, funBtn = addTab(T[lang].fun, "", 80)
local setPg, setBtn = addTab(T[lang].settings, "", 115)
local logPg, logBtn = addTab(T[lang].changelog, "", 150)
pages[1].Visible = true
tabBtns[1].BackgroundColor3 = C.purple

local GUI = {
    colors = C,
    main = main,
    farm = farmPg,
    fun = funPg,
    settings = setPg,
    changelog = logPg,
    lang = lang,
    setLang = function(l)
        lang = l
        ht.Text = T[lang].title
        farmBtn.Text = T[lang].farm
        funBtn.Text = T[lang].fun
        setBtn.Text = T[lang].settings
        logBtn.Text = T[lang].changelog
    end,
    getLang = function() return lang end
}

-- Загрузка модулей
local spn = loadMod("spawn.lua") or {click = function() return false end}
local frm = loadMod("farm.lua")
local fun = loadMod("funzone.lua")
local set = loadMod("settings.lua")
local log = loadMod("Changelog.lua")

if frm then frm.start(GUI, spn) end
if fun then fun.start(GUI) end
if set then set.start(GUI) end
if log then log.start(GUI) end
