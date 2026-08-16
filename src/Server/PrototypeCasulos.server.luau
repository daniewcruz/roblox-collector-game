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

local MimoData = require(ReplicatedStorage:WaitForChild("Shared"):WaitForChild("MimoData"))

local RESPAWN_DELAY = 1.0 -- segundos até o casulo poder reagir de novo
local HORIZONTAL_RADIUS = 3 -- distância lateral (studs) para contar como "encostou"
local VERTICAL_RANGE = 6 -- diferença de altura tolerada (cobre ficar em pé em cima do casulo)

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

-- Cor por família visual (D026), só para o protótipo distinguir visualmente o resultado do sorteio
local familyColors: { [string]: Color3 } = {
	Cute = Color3.fromRGB(255, 140, 190),
	Cool = Color3.fromRGB(255, 140, 60),
	Mystic = Color3.fromRGB(150, 100, 220),
	Majestic = Color3.fromRGB(255, 215, 60),
}
local defaultColor = Color3.fromRGB(255, 140, 60)

local function burstParticles(part: Part)
	local emitter = Instance.new("ParticleEmitter")
	emitter.Texture = "rbxasset://textures/particles/sparkles_main.dds"
	emitter.Lifetime = NumberRange.new(0.6, 1.0)
	emitter.Rate = 0
	emitter.Speed = NumberRange.new(8, 14)
	emitter.SpreadAngle = Vector2.new(180, 180)
	emitter.Size = NumberSequence.new(1.2, 0)
	emitter.Acceleration = Vector3.new(0, -25, 0) -- gravidade: faz as partículas caírem em vez de flutuar
	emitter.Parent = part
	emitter:Emit(24)
	task.delay(1.2, function()
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
	part.Color = defaultColor
	part.CastShadow = false -- evita sombra "piscando" durante a animação de squash rápida
	part.CanCollide = true -- sólido: dá pra pisar/pular em cima como plataforma
	part.Parent = Workspace

	local onCooldown = false

	RunService.Heartbeat:Connect(function()
		if not part.Parent or onCooldown then
			return
		end

		local closestPlayer, closestHorizontalDist = nil, HORIZONTAL_RADIUS
		for _, player in Players:GetPlayers() do
			local character = player.Character
			local hrp = character and character:FindFirstChild("HumanoidRootPart")
			if hrp then
				local diff = hrp.Position - part.Position
				local horizontalDist = Vector2.new(diff.X, diff.Z).Magnitude
				local verticalDist = math.abs(diff.Y)
				if horizontalDist < closestHorizontalDist and verticalDist < VERTICAL_RANGE then
					closestHorizontalDist = horizontalDist
					closestPlayer = player
				end
			end
		end

		if closestPlayer then
			-- dispara sempre que estiver perto e fora de cooldown, mesmo que o jogador
			-- fique parado ali (não exige sair e voltar a entrar no raio)
			onCooldown = true
			part.CanCollide = false -- some por baixo do personagem no instante da explosão, ele cai

			local mimo = MimoData.rollMimo("ValeDasPrimeirasLuzes")
			part.Color = if mimo then (familyColors[mimo.family] or defaultColor) else defaultColor
			squash(part)

			if mimo then
				local isRare = mimo.family == "Mystic" or mimo.family == "Majestic"
				revealEvent:FireClient(closestPlayer, if isRare then "special" else "common", mimo.name)
			end

			task.delay(RESPAWN_DELAY, function()
				part.CanCollide = true -- volta a ser sólida para o próximo ciclo
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
