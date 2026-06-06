return {
    click = function()
        local plr = game.Players.LocalPlayer
        local pg = plr:WaitForChild("PlayerGui")
        local btn = nil
        
        for _, g in pairs(pg:GetChildren()) do
            if g:IsA("ScreenGui") then
                for _, o in pairs(g:GetDescendants()) do
                    if (o:IsA("TextButton") or o:IsA("ImageButton")) and o.Visible and o.Active then
                        local t = o:IsA("TextButton") and o.Text or ""
                        local n = o.Name:lower()
                        if n:find("spawn") or t:lower():find("spawn") or t:lower():find("car") or t:lower():find("free") then
                            if not t:lower():find("vip") and not t:lower():find("pass") then
                                btn = o
                                break
                            end
                        end
                    end
                end
            end
            if btn then break end
        end
        
        if not btn then return false end
        
        if firesignal and btn.MouseButton1Click then
            pcall(function() firesignal(btn.MouseButton1Click) end)
        end
        
        pcall(function()
            local vim = game:GetService("VirtualInputManager")
            local pos = btn.AbsolutePosition + btn.AbsoluteSize / 2
            pos = Vector2.new(pos.X + 45, pos.Y + 40)
            vim:SendMouseButtonEvent(pos.X, pos.Y, 0, true, game, 1)
            wait(0.05)
            vim:SendMouseButtonEvent(pos.X, pos.Y, 0, false, game, 1)
        end)
        
        return true
    end
}
