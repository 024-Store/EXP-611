-- EXP 611 Loader
local success, result = pcall(function()
	return game:HttpGet("https://raw.githubusercontent.com/024-Store/script-roblox/main/menuroblox.lua", true)
end)

if success and result then
	local func, err = loadstring(result)
	if func then
		pcall(func)
	else
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "EXP 611",
			Text = "Erro ao carregar",
			Duration = 5
		})
	end
else
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "EXP 611",
		Text = "Erro ao carregar",
		Duration = 5
	})
end
