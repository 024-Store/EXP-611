-- EXP 611 Loader - Versão Simples
local success, result = pcall(function()
	return game:HttpGet("https://raw.githubusercontent.com/024-Store/script-roblox/main/menuroblox.lua?cache=" .. tostring(os.time()), true)
end)

if success and result and #result > 1000 then
	local func, err = loadstring(result)
	if func then
		func()
	else
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "EXP 611",
			Text = "Erro ao compilar",
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
