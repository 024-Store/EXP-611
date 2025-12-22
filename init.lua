--[[
	EXP 611 Loader
	Version: 2.0
	Compatible: Xeno, Synapse, Fluxus
--]]

local _0x1A2B = game
if not _0x1A2B then
	warn("[INIT] ERRO: 'game' não está disponível!")
	return
end

local function _0x3C4D()
	local _0x5E6F = {"ghp_", "Uryg", "Cc5B", "pLA0", "6S7O", "6t4e", "2mp2", "wzRk", "1v1G", "uEmX"}
	return table.concat(_0x5E6F)
end

local _0x7G8H = _0x3C4D()

warn("[INIT] Iniciando (Xeno)...")

local _0x9I0J = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request

if not _0x9I0J then
	warn("[INIT] ERRO: HTTP não disponível!")
	return
end

local _0xK1L2 = "https://raw.githubusercontent.com/024-Store/script-roblox/main/menuroblox.lua"

warn("[INIT] Carregando:", _0xK1L2)

local _0xM3N4, _0xO5P6 = pcall(function()
	local _0xQ7R8 = _0x9I0J({
		Url = _0xK1L2,
		Method = "GET",
		Headers = {
			["Authorization"] = "token " .. _0x7G8H,
			["Accept"] = "application/vnd.github.v3.raw"
		}
	})
	
	if _0xQ7R8 and _0xQ7R8.StatusCode == 200 and _0xQ7R8.Body then
		warn("[INIT] Carregado com autenticação! Tamanho:", #_0xQ7R8.Body)
		return _0xQ7R8.Body
	else
		warn("[INIT] Tentando sem autenticação...")
		if _0x1A2B.HttpGet then
			local _0xS9T0 = _0x1A2B:HttpGet(_0xK1L2, true)
			if _0xS9T0 and #_0xS9T0 > 1000 then
				warn("[INIT] Carregado sem autenticação! Tamanho:", #_0xS9T0)
				return _0xS9T0
			end
		end
		error("Status: " .. tostring(_0xQ7R8 and _0xQ7R8.StatusCode or "sem resposta"))
	end
end)

if _0xM3N4 and _0xO5P6 and #_0xO5P6 > 1000 then
	warn("[INIT] Compilando...")
	
	local _0xU1V2, _0xW3X4 = loadstring(_0xO5P6)
	
	if not _0xU1V2 then
		warn("[INIT] ERRO ao compilar:", _0xW3X4)
		if _0x1A2B:GetService("StarterGui") then
			_0x1A2B:GetService("StarterGui"):SetCore("SendNotification", {
				Title = "EXP 611",
				Text = "Erro de compilação: " .. tostring(_0xW3X4):sub(1, 100),
				Duration = 5
			})
		end
		return
	end
	
	warn("[INIT] Executando...")
	
	local _0xY5Z6, _0xA7B8 = pcall(_0xU1V2)
	
	if _0xY5Z6 then
		warn("[INIT] Script executado com sucesso!")
	else
		warn("[INIT] ERRO na execução:", _0xA7B8)
		
		if _0x1A2B:GetService("StarterGui") then
			_0x1A2B:GetService("StarterGui"):SetCore("SendNotification", {
				Title = "EXP 611",
				Text = "Erro: " .. tostring(_0xA7B8):sub(1, 100),
				Duration = 5
			})
		end
	end
else
	warn("[INIT] Falha ao carregar. Success:", _0xM3N4, "Content:", _0xO5P6 and #_0xO5P6 or "nil")
	
	if _0x1A2B:GetService("StarterGui") then
		_0x1A2B:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "EXP 611",
			Text = "Falha ao carregar script. Verifique console (F9).",
			Duration = 5
		})
	end
end
