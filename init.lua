local _0x1A2B = game
if not _0x1A2B then return end
local _0x3C4D = "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"
local _0x5E6F = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
if not _0x5E6F then
	warn("[INIT] HTTP não disponível!")
	return
end
local _0x7G8H = "https://raw.githubusercontent.com/024-Store/script-roblox/main/menuroblox.lua"
warn("[INIT] Carregando:", _0x7G8H)
local _0x9I0J, _0xK1L2 = pcall(function()
	local _0xM3N4 = _0x5E6F({
		Url = _0x7G8H,
		Method = "GET",
		Headers = {
			["Authorization"] = "token " .. _0x3C4D,
			["Accept"] = "application/vnd.github.v3.raw"
		}
	})
	warn("[INIT] Status:", _0xM3N4 and _0xM3N4.StatusCode or "nil")
	if _0xM3N4 and _0xM3N4.StatusCode == 200 and _0xM3N4.Body then
		warn("[INIT] Sucesso! Tamanho:", #_0xM3N4.Body)
		return _0xM3N4.Body
	else
		local status = _0xM3N4 and _0xM3N4.StatusCode or "sem resposta"
		local body = _0xM3N4 and _0xM3N4.Body or "sem body"
		warn("[INIT] Erro. Status:", status, "Body:", tostring(body):sub(1, 200))
		error("Erro ao carregar. Status: " .. tostring(status))
	end
end)
if _0x9I0J and _0xK1L2 and #_0xK1L2 > 1000 then
	warn("[INIT] Compilando...")
	local _0xQ7R8, _0xS9T0 = loadstring(_0xK1L2)
	if not _0xQ7R8 then
		warn("[INIT] Erro de compilação:", _0xS9T0)
		if _0x1A2B:GetService("StarterGui") then
			_0x1A2B:GetService("StarterGui"):SetCore("SendNotification", {Title = "EXP 611", Text = "Erro de compilação: " .. tostring(_0xS9T0):sub(1, 100), Duration = 5})
		end
		return
	end
	warn("[INIT] Executando...")
	local _0xU1V2, _0xW3X4 = pcall(_0xQ7R8)
	if not _0xU1V2 then
		warn("[INIT] Erro na execução:", _0xW3X4)
		if _0x1A2B:GetService("StarterGui") then
			_0x1A2B:GetService("StarterGui"):SetCore("SendNotification", {Title = "EXP 611", Text = "Erro: " .. tostring(_0xW3X4):sub(1, 100), Duration = 5})
		end
	end
else
	warn("[INIT] Falha. Success:", _0x9I0J, "Content:", _0xK1L2 and #_0xK1L2 or "nil")
	if _0x1A2B:GetService("StarterGui") then
		_0x1A2B:GetService("StarterGui"):SetCore("SendNotification", {Title = "EXP 611", Text = "Falha ao carregar script. Verifique console (F9).", Duration = 5})
	end
end
