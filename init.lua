-- EXP 611 Loader
-- Tenta múltiplas URLs para evitar cache
local timestamp = tostring(tick())
local urls = {
	"https://cdn.jsdelivr.net/gh/024-Store/script-roblox@main/menuroblox.lua?v=" .. timestamp,
	"https://raw.githubusercontent.com/024-Store/script-roblox/main/menuroblox.lua?cache=" .. timestamp,
	"https://raw.githubusercontent.com/024-Store/script-roblox/main/menuroblox.lua"
}

local loaded = false
for i, url in ipairs(urls) do
	local success, result = pcall(function()
		return game:HttpGet(url, true)
	end)
	
	if success and result and #result > 1000 then
		local func, err = loadstring(result)
		if func then
			pcall(func)
			loaded = true
			break
		end
	end
	
	task.wait(0.5)
end

if not loaded then
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "EXP 611",
		Text = "Erro ao carregar. Aguarde alguns minutos e tente novamente.",
		Duration = 5
	})
end
