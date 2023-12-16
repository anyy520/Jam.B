script.Parent.Touched:connect(function(hit)--Testa colisão do objeto ChaoLava
	if hit and hit.Parent and hit.Parent:FindFirstChild("Humanoid") then--Se colidir com humanoide
		hit.Parent.Humanoid.Health = 0--Define a vida do jogador como 0
	end
end)