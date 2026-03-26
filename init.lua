-- EXP 611 Loader
local MAX_ATTEMPTS = 10
local attempts = 0
local TOKEN = "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"

local function fetchScript()
	local requester = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or (solara and solara.request) or request
	if not requester then
		return nil
	end
	local res = requester({
		Url = "https://raw.githubusercontent.com/024-Store/script-roblox/main/menuroblox.lua?v=" .. tostring(tick()),
		Method = "GET",
		Headers = {
			["Authorization"] = "token " .. TOKEN
		}
	})
	return res and res.Body
end

repeat
	attempts = attempts + 1
	wait(1)

	local success, result = pcall(fetchScript)

	if success and type(result) == "string" and #result > 100000 then
		local func, err = loadstring(result)
		if func then
			func()
			break
		else
			warn("[EXP 611] Erro ao compilar: " .. tostring(err))
		end
	else
		warn("[EXP 611] Tentativa " .. attempts .. "/" .. MAX_ATTEMPTS .. " falhou. Tamanho: " .. (type(result) == "string" and #result or 0))
	end

	if attempts >= MAX_ATTEMPTS then
		warn("[EXP 611] Falha ao carregar apos " .. MAX_ATTEMPTS .. " tentativas.")
		break
	end
until false
