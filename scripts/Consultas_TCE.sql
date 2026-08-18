--Usando o Banco de Dados nessa consulta
Use VarejoDB
Go


--Iniciando Consulatas de CTE criando uma tabela virtual para usar em determinada consultas

--Calculando o quanto cada cliente gastou

With TotalPorCliente As(
Select IdCliente, Sum(ValorTotalVenda) As FaturamentoTotal
From Vendas
Group By IdCliente
)
Select IdCliente, FaturamentoTotal
From TotalPorCliente
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