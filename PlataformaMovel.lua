local TweenService = game:GetService("TweenService")--Função do roblox para criar animações com objetos
local RunService = game:GetService("RunService")--Função do roblox para rodar a animação

local plataformaMovel = script.Parent--Define a plataforma movel
--Cria uma animação nova. O 2 é a velocidade da animação, o -1 é quantas vezes vai repetir e o true é pra inverter a animação
local animacaoInfo = TweenInfo.new(2, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut, -1, true)

local animacao = TweenService:Create(plataformaMovel, animacaoInfo, { --Define a animação passando as informações criadas acima
	CFrame = plataformaMovel.CFrame * CFrame.new(25, 0, 0) --Distancia X, Y, Z
})

animacao:Play()--Roda a animação

local ultimaPosicao = plataformaMovel.Position--Salva a posição inicial como ultima posição para usar abaixo

--Usa o Stepped para rodar a animação mesmo com frame rate baixo
--Função que calcula a velocidade a partir da distancia do ponto A até o ponto B (posição atual/ultima posição)
RunService.Stepped:Connect(function (_, deltaTime)
	local posicaoAtual = plataformaMovel.Position
	local posicaoDelta = posicaoAtual - ultimaPosicao
	local velocidade = posicaoDelta / deltaTime
	plataformaMovel.AssemblyLinearVelocity = velocidade
	ultimaPosicao = posicaoAtual
end)