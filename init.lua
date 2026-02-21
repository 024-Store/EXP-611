-- EXP 611 Loader - Tenta local primeiro
local function tryLocal()
	local success, content = pcall(readfile, "menuroblox.lua")
	if success and content and #content > 100000 then
		local func = loadstring(content)
		if func then
			func()
			return true
		end
	end
	return false
end

local function tryGitHub()
	local success, result = pcall(function()
		return game:HttpGet("https://raw.githubusercontent.com/024-Store/script-roblox/main/menuroblox.lua", true)
	end)
	
	if success and result and #result > 100000 then
		local func = loadstring(result)
		if func then
			func()
			return true
		end
	end
	return false
end

-- Tenta local primeiro, depois GitHub
if not tryLocal() then
	if not tryGitHub() then
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "EXP 611",
			Text = "Erro ao carregar. Copie menuroblox.lua para autoexec",
			Duration = 7
		})
	end
end
