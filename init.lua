-- EXP 611 Loader
local MAX_ATTEMPTS = 10
local attempts = 0

repeat
	attempts = attempts + 1
	wait(1)

	local success, result = pcall(function()
		return game:HttpGet("https://raw.githubusercontent.com/024-Store/script-roblox/main/menuroblox.lua?v=" .. tostring(tick()), true)
	end)

	if success and type(result) == "string" and #result > 100000 then
		local func, err = loadstring(result)
		if func then
			func()
			break
		else
			warn("[EXP 611] Erro ao compilar script: " .. tostring(err))
		end
	else
		warn("[EXP 611] Tentativa " .. attempts .. "/" .. MAX_ATTEMPTS .. " falhou. Tamanho: " .. (type(result) == "string" and #result or 0))
	end

	if attempts >= MAX_ATTEMPTS then
		warn("[EXP 611] Falha ao carregar após " .. MAX_ATTEMPTS .. " tentativas.")
		break
	end
until false
