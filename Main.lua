local base = "https://raw.githubusercontent.com/Vodi509/DAMIR_DRUN679SCRIPT/refs/heads/main/Modules"

local function loadMod(name)
    local ok, data = pcall(function() return game:HttpGet(base .. "/" .. name) end)
    if not ok then return nil end
    local fn, err = loadstring(data)
    if not fn then return nil end
    local ok2, result = pcall(fn)
    if not ok2 then return nil end
    return result
end

local gui = loadMod("Gui.lua")
local spn = loadMod("spawn.lua")
local frm = loadMod("farm.lua")
local fun = loadMod("funzone.lua")
local set = loadMod("settings.lua")
local log = loadMod("Changelog.lua")

if not gui or not spn or not frm then return end
frm.start(gui, spn)
if fun then fun.start(gui) end
if set then set.start(gui) end
if log then log.start(gui) end
