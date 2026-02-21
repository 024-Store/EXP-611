-- EXP 611 Loader
local urls = {
	"https://pastee.dev/raw/QVYG4wAc",
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
