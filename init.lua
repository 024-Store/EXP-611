-- EXP 611 Loader
local success, result = pcall(function()
	return game:HttpGet("https://raw.githubusercontent.com/024-Store/script-roblox/main/menuroblox.lua", true)
end)

if success and result and #result > 100000 then
	local func, err = loadstring(result)
	if func then
		func()
	else
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "EXP 611",
			Text = "Erro de sintaxe no script",
			Duration = 5
		})
	end
else
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "EXP 611",
		Text = "Aguarde 5 minutos (cache do GitHub)",
		Duration = 7
	})
end
