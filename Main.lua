-- [[ DAMIR HUB v8.1 FINAL - NO LANG, SAVE SETTINGS, CREDITS ]] --
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

local function loadSettings()
    local ok, data = pcall(function() return plr:WaitForChild("DamirSettings") end)
    if ok and data then
        return {
            theme = data:FindFirstChild("Theme") and data.Theme.Value or 1,
            trans = data:FindFirstChild("Trans") and data.Trans.Value or 3
        }
    end
    return {theme = 1, trans = 3}
end

local function saveSettings(theme, trans)
    pcall(function()
        local f = plr:FindFirstChild("DamirSettings") or Instance.new("Folder", plr)
        f.Name = "DamirSettings"
        local a = f:FindFirstChild("Theme") or Instance.new("NumberValue", f)
        a.Name = "Theme" a.Value = theme
        local b = f:FindFirstChild("Trans") or Instance.new("NumberValue", f)
        b.Name = "Trans" b.Value = trans
    end)
end

local saved = loadSettings()

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

local to = {0, 0.15, 0.25, 0.30, 0.50, 0.60, 0.75, 0.90}
local tn = {"0%","15%","25%","30%","50%","60%","75%","90%"}
local ti2 = saved.trans
local tv = to[ti2]

local sg = Instance.new("ScreenGui", pg)
sg.Name = "DamirHub"
sg.ResetOnSpawn = false
sg.IgnoreGuiInset = true

local mini = Instance.new("Frame", sg) mini.Name = "DamirMini"
mini.Size = UDim2.new(0,130,0,28) mini.Position = UDim2.new(0.02,0,0.15,0)
mini.BackgroundColor3 = C.side mini.BackgroundTransparency = tv mini.BorderSizePixel = 0
mini.Visible = false mini.Active = true mini.Draggable = true
Instance.new("UICorner", mini).CornerRadius = UDim.new(0,6)
Instance.new("UIStroke", mini).Thickness = 1.5 Instance.new("UIStroke", mini).Color = C.purple

local rBtn = Instance.new("TextButton", mini)
rBtn.Size = UDim2.new(1,0,1,0) rBtn.BackgroundTransparency = 1
rBtn.Text = "⚡ DAMIR HUB" rBtn.TextColor3 = C.white rBtn.Font = Enum.Font.GothamBold rBtn.TextSize = 12

local main = Instance.new("Frame", sg)
main.Size = UDim2.new(0,460,0,310) main.Position = UDim2.new(0.5,-230,0.3,0)
main.BackgroundColor3 = C.bg main.BackgroundTransparency = tv main.BorderSizePixel = 0
main.Active = true main.Draggable = true
Instance.new("UICorner", main).CornerRadius = UDim.new(0,8)
Instance.new("UIStroke", main).Thickness = 1.5 Instance.new("UIStroke", main).Color = C.purple

local hdr = Instance.new("Frame", main)
hdr.Size = UDim2.new(1,0,0,30) hdr.BackgroundColor3 = C.side hdr.BorderSizePixel = 0
Instance.new("UICorner", hdr).CornerRadius = UDim.new(0,8)

local ht = Instance.new("TextLabel", hdr)
ht.Size = UDim2.new(1,-60,1,0) ht.Position = UDim2.new(0,12,0,0) ht.BackgroundTransparency = 1
ht.Text = "DAMIR HUB v8.1" ht.TextColor3 = C.white ht.Font = Enum.Font.GothamBold ht.TextSize = 13 ht.TextXAlignment = Enum.TextXAlignment.Left

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

local side = Instance.new("Frame", main)
side.Size = UDim2.new(0,115,1,-30) side.Position = UDim2.new(0,0,0,30)
side.BackgroundColor3 = C.side side.BackgroundTransparency = tv side.BorderSizePixel = 0

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
    return page
end

local farmPg = addTab("🚀 Фарм", "", 46)
local setPg = addTab("⚙️ Настр", "", 82)
local logPg = addTab("📋 Новое", "", 118)
local credPg = addTab("👤 Созд", "", 154)
pages[1].Visible = true
tabBtns[1].BackgroundColor3 = C.purple

-- Вкладка Создатели
local credTitle = Instance.new("TextLabel", credPg)
credTitle.Size = UDim2.new(1,0,0,30) credTitle.Position = UDim2.new(0,0,0,10) credTitle.BackgroundTransparency = 1
credTitle.Text = "👤 Создатели" credTitle.TextColor3 = C.gold credTitle.Font = Enum.Font.GothamBold credTitle.TextSize = 16 credTitle.TextXAlignment = Enum.TextXAlignment.Center

local credName = Instance.new("TextLabel", credPg)
credName.Size = UDim2.new(1,0,0,30) credName.Position = UDim2.new(0,0,0,50) credName.BackgroundTransparency = 1
credName.Text = "Damir_drun67" credName.TextColor3 = C.white credName.Font = Enum.Font.GothamBold credName.TextSize = 18 credName.TextXAlignment = Enum.TextXAlignment.Center

local credLine = Instance.new("Frame", credPg)
credLine.Size = UDim2.new(0,200,0,2) credLine.Position = UDim2.new(0.5,-100,0,85) credLine.BackgroundColor3 = C.purple
Instance.new("UICorner", credLine).CornerRadius = UDim.new(0,1)

local credMsg = Instance.new("TextLabel", credPg)
credMsg.Size = UDim2.new(1,0,0,120) credMsg.Position = UDim2.new(0,0,0,100) credMsg.BackgroundTransparency = 1
credMsg.Text = "Спасибо за использование скрипта!\n\nЭтот скрипт сделан с душой.\n\nЕсли вы это читаете - знайте,\nвы легенда.\n\nCar Crushers 2 - топ!"
credMsg.TextColor3 = C.grey credMsg.Font = Enum.Font.Gotham credMsg.TextSize = 12 credMsg.TextXAlignment = Enum.TextXAlignment.Center

local GUI = {
    colors = C, main = main, farm = farmPg, settings = setPg, changelog = logPg,
    saved = saved, saveSettings = saveSettings, to = to, tn = tn, tv = tv, ti2 = ti2,
    updateTrans = function(ti, val)
        tv = val
        main.BackgroundTransparency = val
        side.BackgroundTransparency = val
        hdr.BackgroundTransparency = val
        mini.BackgroundTransparency = val
    end
}

GUI.updateTrans(ti2, tv)

local spn = loadMod("spawn.lua") or {click = function() return false end}
local frm = loadMod("farm.lua")
local set = loadMod("settings.lua")
local log = loadMod("Changelog.lua")

if frm then frm.start(GUI, spn) end
if set then set.start(GUI) end
if log then log.start(GUI) end
