-- Recebe o evento de reveal do servidor e mostra a mensagem (protótipo, GDD seção 5)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")

local remoteFolder = ReplicatedStorage:WaitForChild("PrototypeRemotes", 10)
local revealEvent = remoteFolder and remoteFolder:WaitForChild("CasuloReveal", 10)

if revealEvent then
	revealEvent.OnClientEvent:Connect(function(kind: string, mimoName: string?)
		if kind == "special" then
			StarterGui:SetCore("SendNotification", {
				Title = "✨ Algo se mexeu!",
				Text = "Você descobriu um " .. tostring(mimoName) .. "! Raridade: Épica",
				Duration = 3,
			})
		else
			StarterGui:SetCore("SendNotification", {
				Title = "Casulo comum",
				Text = "+1 recurso",
				Duration = 1.5,
			})
		end
	end)
end
