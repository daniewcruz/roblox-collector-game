-- Protótipo: testar 2 candidatos de interação central (D024, GDD seção 4b)
-- Laranja = "toque físico com reação" | Azul = "coleta magnética"
local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local function createCasulo(position: Vector3, kind: string)
	local part = Instance.new("Part")
	part.Name = "Casulo_" .. kind
	part.Shape = Enum.PartType.Ball
	part.Size = Vector3.new(3, 3, 3)
	part.Position = position
	part.Anchored = true
	part.Material = Enum.Material.Neon
	part.Color = if kind == "toque" then Color3.fromRGB(255, 140, 60) else Color3.fromRGB(90, 200, 255)
	part.Parent = Workspace

	if kind == "toque" then
		local debounce = false
		part.Touched:Connect(function(hit)
			if debounce then
				return
			end
			local character = hit.Parent
			if not (character and Players:GetPlayerFromCharacter(character)) then
				return
			end
			debounce = true

			local originalSize = part.Size
			local squash = TweenService:Create(
				part,
				TweenInfo.new(0.1, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
				{ Size = originalSize * Vector3.new(1.4, 0.6, 1.4) }
			)
			squash:Play()
			squash.Completed:Connect(function()
				TweenService:Create(
					part,
					TweenInfo.new(0.25, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out),
					{ Size = originalSize }
				):Play()
			end)

			task.delay(1.2, function()
				debounce = false
			end)
		end)
	elseif kind == "magnetico" then
		part.CanCollide = false
		task.spawn(function()
			while part.Parent do
				task.wait(0.1)
				local closestHrp, closestDist = nil, 12
				for _, player in Players:GetPlayers() do
					local character = player.Character
					local hrp = character and character:FindFirstChild("HumanoidRootPart")
					if hrp then
						local dist = (hrp.Position - part.Position).Magnitude
						if dist < closestDist then
							closestDist = dist
							closestHrp = hrp
						end
					end
				end
				if closestHrp then
					local direction = closestHrp.Position - part.Position
					if direction.Magnitude < 2 then
						part:Destroy()
						break
					end
					part.Position = part.Position + direction.Unit * math.min(direction.Magnitude, 1.5)
				end
			end
		end)
	end

	return part
end

for i = 1, 3 do
	createCasulo(Vector3.new(i * 6, 3, 0), "toque")
end
for i = 1, 3 do
	createCasulo(Vector3.new(i * 6, 3, 10), "magnetico")
end

print("Mimo World: protótipo de 2 candidatos de Core Gameplay criado (toque físico + coleta magnética)")
