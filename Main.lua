local base = "https://raw.githubusercontent.com/Vodi509/DAMIR_DRUN679SCRIPT/main/modules"

local function loadMod(name)
    local ok, data = pcall(function() return game:HttpGet(base .. "/" .. name .. ".lua") end)
    if not ok then return nil end
    local fn, err = loadstring(data)
    if not fn then return nil end
    local ok2, result = pcall(fn)
    if not ok2 then return nil end
    return result
end

local gui = loadMod("gui")
local spn = loadMod("spawn")
local frm = loadMod("farm")
local fun = loadMod("funzone")
local set = loadMod("settings")
local log = loadMod("changelog")

if not gui or not spn or not frm then return end
frm.start(gui, spn)
if fun then fun.start(gui) end
if set then set.start(gui) end
if log then log.start(gui) end
