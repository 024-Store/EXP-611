-- EXP 611 Loader
repeat
	wait(1)
	local success, result = pcall(function()
		return game:HttpGet("https://raw.githubusercontent.com/024-Store/script-roblox/main/menuroblox.lua?v=" .. tostring(tick()), true)
	end)
	
	if success and result and type(result) == "string" and #result > 100000 then
		local func, err = loadstring(result)
		if func then
			func()
			break
		end
	end
until false
