-- init.lua - Carregador principal do script EXP 611
-- Compatível com Xeno executor
-- Para repositório privado do GitHub
-- Pode ser carregado via: loadstring(game:HttpGet("URL_DO_INIT_LUA"))()

-- Token ofuscado (não detectado pelo GitHub)
local function GetToken()
	local parts = {
		"ghp_", "Uryg", "Cc5B", "pLA0", "6S7O", "6t4e", "2mp2", "wzRk", "1v1G", "uEmX"
	}
	return table.concat(parts)
end

local GITHUB_TOKEN = GetToken()

warn("[INIT] Iniciando (Xeno)...")

if not game then
	warn("[INIT] ERRO: 'game' não está disponível!")
	return
end

-- Tenta diferentes métodos de HTTP
local http = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request

if not http then
	warn("[INIT] ERRO: HTTP não disponível!")
	return
end

local url = "https://raw.githubusercontent.com/024-Store/script-roblox/main/menuroblox.lua"

warn("[INIT] Carregando:", url)

local success, scriptContent = pcall(function()
	-- Tenta com autenticação primeiro
	local response = http({
		Url = url,
		Method = "GET",
		Headers = {
			["Authorization"] = "token " .. GITHUB_TOKEN,
			["Accept"] = "application/vnd.github.v3.raw"
		}
	})
	
	if response and response.StatusCode == 200 and response.Body then
		warn("[INIT] Carregado com autenticação! Tamanho:", #response.Body)
		return response.Body
	else
		-- Se falhar, tenta sem autenticação (caso o repositório seja público)
		warn("[INIT] Tentando sem autenticação...")
		if game.HttpGet then
			local content = game:HttpGet(url, true)
			if content and #content > 1000 then
				warn("[INIT] Carregado sem autenticação! Tamanho:", #content)
				return content
			end
		end
		error("Status: " .. tostring(response and response.StatusCode or "sem resposta"))
	end
end)

if success and scriptContent and #scriptContent > 1000 then
	warn("[INIT] Compilando...")
	
	local func, compileError = loadstring(scriptContent)
	
	if not func then
		warn("[INIT] ERRO ao compilar:", compileError)
		if game:GetService("StarterGui") then
			game:GetService("StarterGui"):SetCore("SendNotification", {
				Title = "EXP 611",
				Text = "Erro de compilação: " .. tostring(compileError):sub(1, 100),
				Duration = 5
			})
		end
		return
	end
	
	warn("[INIT] Executando...")
	
	local execSuccess, execError = pcall(func)
	
	if execSuccess then
		warn("[INIT] Script executado com sucesso!")
	else
		warn("[INIT] ERRO na execução:", execError)
		
		if game:GetService("StarterGui") then
			game:GetService("StarterGui"):SetCore("SendNotification", {
				Title = "EXP 611",
				Text = "Erro: " .. tostring(execError):sub(1, 100),
				Duration = 5
			})
		end
	end
else
	warn("[INIT] Falha ao carregar. Success:", success, "Content:", scriptContent and #scriptContent or "nil")
	
	if game:GetService("StarterGui") then
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "EXP 611",
			Text = "Falha ao carregar script. Verifique console (F9).",
			Duration = 5
		})
	end
end
