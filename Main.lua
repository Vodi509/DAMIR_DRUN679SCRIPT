local B = "https://raw.githubusercontent.com/Vodi509/DAMIR_DRUN679SCRIPT/refs/heads/main/Modules"

local function notify(text)
    pcall(function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "DAMIR HUB",
            Text = text,
            Duration = 3
        })
    end)
end

local function loadMod(name)
    notify("Гружу: " .. name)
    local ok, data = pcall(function() return game:HttpGet(B .. "/" .. name) end)
    if not ok then notify("ОШИБКА: " .. name) return nil end
    local fn, err = loadstring(data)
    if not fn then notify("ОШИБКА: " .. name) return nil end
    local ok2, result = pcall(fn)
    if not ok2 then notify("ОШИБКА: " .. name) return nil end
    notify(name .. " ОК")
    return result
end

notify("Старт")

local gui = loadMod("Gui.lua")
if not gui then return end

local spn = loadMod("spawn.lua")
if not spn then return end

local frm = loadMod("farm.lua")
if not frm then return end

local fun = loadMod("funzone.lua")
local set = loadMod("settings.lua")
local log = loadMod("Changelog.lua")

frm.start(gui, spn)
if fun then fun.start(gui) end
if set then set.start(gui) end
if log then log.start(gui) end

notify("ГОТОВО!")
