--Usando o Banco de dados nessa consulta
Use VarejoDB
Go

--Práticando consultas usando Windows Function 

--Criando um ranking de Clientes do que mais gastou para o que menos gastou

Select C.IdCliente, C.GeneroCliente, V.ValorTotalVenda,
Rank() Over(Order By V.ValorTotalVenda Desc) As Ranking  -- Rank cria um ranking quando der empate o próximo difderente fica no rankling da posição dele no Banco 
--O Over serve para abrirmos a janela e definimos o tamanho dela e como ela irá funcionar 
From Clientes C
Inner Join Vendas V
On C.IdCliente = V.IdCliente
Go

--Ranking de Categoria para a que mais faturou para a que menos faturou

Select C.NomeCategoria, V.ValorTotalVenda,
Dense_Rank() Over (Order By V.ValorTotalVenda Desc) As Ranking -- Dense_Rank cria uma ranking porém o próximo que for diferente segue o número do ranking
From Categorias C
Inner Join Vendas V
on	C.IdCategoria = V.IdCategoria
Go

-- Soma acumulada do faturamento alinhado por data

Select V.ValorTotalVenda, V.DataVenda,
Sum(V.ValorTotalVenda) Over(Order By DataVenda Asc) As FaturamentoAcomulado
From Vendas V
Go


--Mostrando as Vendas com a médias de todas as vendas

Select V.PrecoUnitarioVenda, V.ValorTotalVenda,
Avg(V.ValorTotalVenda) Over() As MediaDasVendas
From Vendas V

--Mostrando a venda e quantos foi a venda anterior usando Lag
Select V.ValorTotalVenda, V.DataVenda,
Lag(V.ValorTotalVenda, 1, 0) Over (Order By V.dataVenda) As VendaAnterior
From Vendas V
Go

-- Lag(V.ValorTotalVenda, 1, 0) Usamos assim para a primeira venda que não teria uma anterior ofsset 1, e o valor fica 0

--Agora Mostrando quanto foi a venda anterior e a diferença Usando Windows Function

Select V.ValorTotalVenda, V.DataVenda,
Lag(V.ValorTotalVenda, 1, 0) Over (Order By V.dataVenda) As VendaAnterior,
V.ValorTotalVenda - Lag(V.ValorTotalVenda, 1, 0) Over (Order By V.dataVenda) As DiferencaAnterior
From Vendas V
Go

--Mostrando a próxima venda Usando Lead

Select V.ValorTotalVenda, V.DataVenda,
Lead(V.ValorTotalVenda, 1, 0) Over (Order By V.dataVenda) As VendaAnterior
From Vendas V
Go

--Dessa vez o Offset serve para a última linha 


--Criando um Ranking de Clientes por Categoria