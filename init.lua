-- EXP 611 Loader
local function tryLoad()
	local success, result = pcall(function()
		return game:HttpGet("https://raw.githubusercontent.com/024-Store/script-roblox/main/menuroblox.lua?v=" .. tostring(math.random(1000000)), true)
	end)
	
	if success and result and #result > 100000 then
		-- Verificar se não tem erro de sintaxe óbvio
		if not result:match("^%s*%)") then
			local func, err = loadstring(result)
			if func then
				pcall(func)
				return true
			end
		end
	end
	return false
end

-- Tentar 3 vezes com delay
for i = 1, 3 do
	if tryLoad() then
		return
	end
	wait(2)
end

game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "EXP 611",
	Text = "Erro ao carregar. Tente novamente em 5 minutos.",
	Duration = 7
})
