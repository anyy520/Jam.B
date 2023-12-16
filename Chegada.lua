local chegada = script.Parent --Define o objeto chegada

local som = Instance.new("Sound") --Cria um novo som
som.SoundId = "rbxassetid://12222253" --Seleciona o som que vai ser usado, pode trocar por outro na caixa de ferramentas pegando o ID
som.Looped = false --Define se vai fica tocando pra sempre
som.Parent = workspace 

chegada.Touched:connect(function(hit) --Testa a colisão do objeto chegada
	if hit and hit.Parent and hit.Parent:FindFirstChild("Humanoid") then --Se colidir com um humanoide
		local player = game.Players:GetPlayerFromCharacter(hit.Parent) --Define o jogador
		print((player.Name), "venceu")--Mostra no console o nome do jogador que venceu
		som:Play()--Toca o som
		chegada:Destroy()--Destroi o objeto chegada
	end
end)