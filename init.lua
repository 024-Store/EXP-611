-- EXP 611 Loader
local urls = {
	"https://cdn.jsdelivr.net/gh/024-Store/script-roblox@0988c13fe7/menuroblox.lua",
	"https://raw.githubusercontent.com/024-Store/script-roblox/0988c13fe7/menuroblox.lua",
	"https://raw.githubusercontent.com/024-Store/script-roblox/main/menuroblox.lua?" .. tostring(tick())
}

local loaded = false
for i, url in ipairs(urls) do
	local success, result = pcall(function()
		return game:HttpGet(url, true)
	end)
	
	if success and result and #result > 100000 then
		local func, err = loadstring(result)
		if func then
			pcall(func)
			loaded = true
			break
		end
	end
	
	task.wait(1)
end

if not loaded then
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "EXP 611",
		Text = "Cache do GitHub travado. Aguarde 10 minutos.",
		Duration = 7
	})
end
