-- EXP 611 Loader
local urls = {
	"https://gist.githubusercontent.com/024-Store/0f88a12f5a4f823ec8959e28f0d3c797/raw/menuroblox.lua",
	"https://raw.githubusercontent.com/024-Store/script-roblox/main/menuroblox.lua"
}

for _, url in ipairs(urls) do
	local success, result = pcall(function()
		return game:HttpGet(url, true)
	end)
	
	if success and result and #result > 100000 then
		local func, err = loadstring(result)
		if func then
			pcall(func)
			return
		end
	end
	wait(1)
end

game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "EXP 611",
	Text = "Erro ao carregar",
	Duration = 5
})
