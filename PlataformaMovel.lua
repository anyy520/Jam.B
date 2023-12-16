local TweenService = game:GetService("TweenService")--Fun��o do roblox para criar anima��es com objetos
local RunService = game:GetService("RunService")--Fun��o do roblox para rodar a anima��o

local plataformaMovel = script.Parent--Define a plataforma movel
--Cria uma anima��o nova. O 2 � a velocidade da anima��o, o -1 � quantas vezes vai repetir e o true � pra inverter a anima��o
local animacaoInfo = TweenInfo.new(2, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut, -1, true)

local animacao = TweenService:Create(plataformaMovel, animacaoInfo, { --Define a anima��o passando as informa��es criadas acima
	CFrame = plataformaMovel.CFrame * CFrame.new(25, 0, 0) --Distancia X, Y, Z
})

animacao:Play()--Roda a anima��o

local ultimaPosicao = plataformaMovel.Position--Salva a posi��o inicial como ultima posi��o para usar abaixo

--Usa o Stepped para rodar a anima��o mesmo com frame rate baixo
--Fun��o que calcula a velocidade a partir da distancia do ponto A at� o ponto B (posi��o atual/ultima posi��o)
RunService.Stepped:Connect(function (_, deltaTime)
	local posicaoAtual = plataformaMovel.Position
	local posicaoDelta = posicaoAtual - ultimaPosicao
	local velocidade = posicaoDelta / deltaTime
	plataformaMovel.AssemblyLinearVelocity = velocidade
	ultimaPosicao = posicaoAtual
end)