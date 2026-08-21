--Usando o Banco de Dados nessa consulta
Use VarejoDB
Go


--Iniciando Consulatas de CTE criando uma tabela virtual para usar em determinada consultas

--Calculando o faturamento por cliente 
With TotalPorCliente As(
Select IdCliente, Sum(ValorTotalVenda) As FaturamentoTotal
From Vendas
Group By IdCliente
)
Select IdCliente, FaturamentoTotal
From TotalPorCliente -- Aqui Chamamos os dados da tabela virtual que criamos 
Where FaturamentoTotal > 1000 --Filtrando só para quem faturou mais de mil
Order By FaturamentoTotal Desc
Go

--Mostrando o faturamento por Categoria Usando Join junto ao CTE
With TotalCategoria As (
Select C.NomeCategoria, Sum (V.ValorTotalVenda) As TotalPorCategoria
From Vendas V
Inner Join Categorias C
On C.IdCategoria = v.IdCategoria
Group By C.NomeCategoria
)
Select NomeCategoria, TotalPorCategoria
From TotalCategoria
Go


--Usando CTE mais Windows Function

;With FaturamentoPorCategoria As (
Select C.NomeCategoria, Sum(V.ValorTotalVenda) As FaturamentoCategoria
From Categorias C
Inner Join Vendas V
On C.IdCategoria = v.IdCategoria
Group By C.NomeCategoria
)
Select NomeCategoria, FaturamentoCategoria,
Sum(FaturamentoCategoria) Over() FaturamentoTotalGeral,
-- Mostrando quanto em % cada Categoria representa do total 
Convert(Decimal(4,2),FaturamentoCategoria / Sum(FaturamentoCategoria) Over() * 100) As PorcentagemPorCategoria
-- Reutilizamos a Windows Function para fazer a porcentagem
From FaturamentoPorCategoria
Go

--Criando um ranking por categoria 
;With RankingPorCategoria As (
Select C.NomeCategoria, Sum(V.ValorTotalVenda) As FaturamentoCategoria,
Dense_Rank() Over (Order By Sum(V.ValorTotalVenda) Desc) As PosicaoRanking
From Categorias C
Inner Join Vendas V
On C.IdCategoria = v.IdCategoria
Group By C.NomeCategoria
)
Select NomeCategoria, FaturamentoCategoria, PosicaoRanking
From RankingPorCategoria
Go

-- Mostrando cada venda individualmente e a média por Categoria e a diferença da média
; With VendaIndividual As (
Select  C.NomeCategoria, V.ValorTotalVenda, Avg(V.ValorTotalVenda) Over(Partition By C.IdCategoria) As MediaPorCategoria
From Vendas V
Inner Join Categorias C
On V.IdCategoria = C.IdCategoria

)
Select NomeCategoria, Format(MediaPorCategoria, 'C', 'pt-BR') As MediaCategoria, 
-- Formatando para deixar no padrão da moeda brasileira para deixar melhor visualmente
Format(ValorTotalVenda - MediaPorCategoria, 'C', 'pt-BR') As DiferencaParaMedia
From VendaIndividual
Go