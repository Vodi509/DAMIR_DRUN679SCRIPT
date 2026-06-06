-- [[ DAMIR HUB v8.0 - NO FUN ZONE ]] --
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
for _, v in pairs(pg:GetChildren()) do if v.Name == "DamirHub" then v:Destroy() end end

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

local sg = Instance.new("ScreenGui", pg) sg.Name = "DamirHub" sg.ResetOnSpawn = false
local main = Instance.new("Frame", sg)
main.Size = UDim2.new(0,460,0,310) main.Position = UDim2.new(0.5,-230,0.3,0)
main.BackgroundColor3 = C.bg main.BorderSizePixel = 0 main.Active = true main.Draggable = true
Instance.new("UICorner", main).CornerRadius = UDim.new(0,8)

local side = Instance.new("Frame", main)
side.Size = UDim2.new(0,115,1,0) side.BackgroundColor3 = C.side side.BorderSizePixel = 0

local logo = Instance.new("TextLabel", side)
logo.Size = UDim2.new(1,0,0,36) logo.BackgroundTransparency = 1
logo.Text = "DAMIR HUB" logo.TextColor3 = C.red logo.Font = Enum.Font.GothamBold logo.TextSize = 14

local pages = {}
local function addTab(name, icon, y)
    local btn = Instance.new("TextButton", side)
    btn.Size = UDim2.new(1,-14,0,28) btn.Position = UDim2.new(0,7,0,y)
    btn.BackgroundColor3 = C.btn btn.Text = icon .. " " .. name
    btn.TextColor3 = C.grey btn.Font = Enum.Font.GothamBold btn.TextSize = 10 btn.BorderSizePixel = 0
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0,4)
    local page = Instance.new("Frame", main)
    page.Size = UDim2.new(1,-125,1,-10) page.Position = UDim2.new(0,120,0,10)
    page.BackgroundTransparency = 1 page.Visible = false
    btn.MouseButton1Click:Connect(function() for _, p in pairs(pages) do p.Visible = false end page.Visible = true end)
    table.insert(pages, page) return page
end

local farmPg = addTab("Фарм", "🚀", 45)
local setPg = addTab("Настр", "⚙️", 80)
local logPg = addTab("Новое", "📋", 115)
pages[1].Visible = true

local GUI = {colors = C, main = main, farm = farmPg, settings = setPg, changelog = logPg}

-- Загрузка модулей
local spn = loadMod("spawn.lua") or {click = function() return false end}
local frm = loadMod("farm.lua")
local set = loadMod("settings.lua")
local log = loadMod("Changelog.lua")

if frm then frm.start(GUI, spn) end
if set then set.start(GUI) end
if log then log.start(GUI) end
