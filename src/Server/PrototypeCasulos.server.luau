-- Protótipo v3: candidato vencedor "toque físico com reação" (D063), com reveal completo
-- Baseado em GDD 10-gdd.md seção 5 (momento de descoberta) e seção 4b (critério de validação)
-- v3: troca Touched (dispara só na 1a entrada em contato) por detecção de proximidade contínua
-- (RunService.Heartbeat) -- corrige bug relatado: interação não repetia se o jogador ficasse
-- parado/pulando em cima do casulo em vez de sair e voltar a encostar.
local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local RARE_CHANCE = 0.2 -- 20% de chance de ser "especial" (ajustável para teste)
local RESPAWN_DELAY = 1.0 -- segundos até o casulo poder reagir de novo
local TRIGGER_RADIUS = 3.5 -- distância (studs) para contar como "encostou"

local remoteFolder = ReplicatedStorage:FindFirstChild("PrototypeRemotes")
if not remoteFolder then
	remoteFolder = Instance.new("Folder")
	remoteFolder.Name = "PrototypeRemotes"
	remoteFolder.Parent = ReplicatedStorage
end

local revealEvent = remoteFolder:FindFirstChild("CasuloReveal")
if not revealEvent then
	revealEvent = Instance.new("RemoteEvent")
	revealEvent.Name = "CasuloReveal"
	revealEvent.Parent = remoteFolder
end

local commonColor = Color3.fromRGB(255, 140, 60)
local specialColor = Color3.fromRGB(255, 215, 60)

local function burstParticles(part: Part)
	local emitter = Instance.new("ParticleEmitter")
	emitter.Texture = "rbxasset://textures/particles/sparkles_main.dds"
	emitter.Lifetime = NumberRange.new(0.4, 0.7)
	emitter.Rate = 0
	emitter.Speed = NumberRange.new(8, 14)
	emitter.SpreadAngle = Vector2.new(180, 180)
	emitter.Size = NumberSequence.new(1.2, 0)
	emitter.Parent = part
	emitter:Emit(24)
	task.delay(1, function()
		emitter:Destroy()
	end)
end

local function squash(part: Part)
	local originalSize = part.Size
	burstParticles(part)

	local tween = TweenService:Create(
		part,
		TweenInfo.new(0.22, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
		{ Size = originalSize * Vector3.new(1.9, 0.35, 1.9) }
	)
	tween:Play()
	tween.Completed:Connect(function()
		TweenService:Create(
			part,
			TweenInfo.new(0.55, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out),
			{ Size = originalSize }
		):Play()
	end)
end

local function createCasulo(position: Vector3)
	local part = Instance.new("Part")
	part.Name = "Casulo_toque"
	part.Shape = Enum.PartType.Ball
	part.Size = Vector3.new(3, 3, 3)
	part.Position = position
	part.Anchored = true
	part.Material = Enum.Material.Neon
	part.Color = commonColor
	part.Parent = Workspace

	local onCooldown = false

	RunService.Heartbeat:Connect(function()
		if not part.Parent or onCooldown then
			return
		end

		local closestPlayer, closestDist = nil, TRIGGER_RADIUS
		for _, player in Players:GetPlayers() do
			local character = player.Character
			local hrp = character and character:FindFirstChild("HumanoidRootPart")
			if hrp then
				local dist = (hrp.Position - part.Position).Magnitude
				if dist < closestDist then
					closestDist = dist
					closestPlayer = player
				end
			end
		end

		if closestPlayer then
			-- dispara sempre que estiver perto e fora de cooldown, mesmo que o jogador
			-- fique parado ali (não exige sair e voltar a entrar no raio)
			onCooldown = true

			local isSpecial = math.random() < RARE_CHANCE
			part.Color = if isSpecial then specialColor else commonColor
			squash(part)

			if isSpecial then
				revealEvent:FireClient(closestPlayer, "special", "Mimo Teste")
			else
				revealEvent:FireClient(closestPlayer, "common", nil)
			end

			task.delay(RESPAWN_DELAY, function()
				onCooldown = false
			end)
		end
	end)

	return part
end

for i = 1, 4 do
	createCasulo(Vector3.new(i * 5, 3, 0))
end

print("Mimo World: prototipo v3 (proximidade continua, corrige bug de re-trigger) criado")
