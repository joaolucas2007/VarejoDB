--Usando o Banco de Dados nessa Consulta
Use VarejoDB
Go

--Consultas usando Joins para junção de tabelas
Select C.IdadeCliente, C.GeneroCliente, V.IdCliente, V.IdVenda
From Clientes C
Inner Join Vendas V -- Inner Join Só traz Os dados que tiver Conrrespondência nas duas tabelas selecionadas
On C.IdCliente = V.IdCliente
Go

--Trazendo os Clientes agora com mais dados sobre a venda

Select C.IdadeCliente, C.GeneroCliente, V.PrecoUnitarioVenda, V.QuantidadeVenda, V.ValorTotalVenda, V.DataVenda
From Clientes C
Inner Join Vendas V 
On C.IdCliente = V.IdCliente
Go

--Trazendo dados das vendas agora relacionando com categoria
Select C.NomeCategoria, V.PrecoUnitarioVenda, V.QuantidadeVenda, V.ValorTotalVenda, V.DataVenda
From Categorias C
Inner Join Vendas V 
On C.IdCategoria = V.IdCategoria
Go


--Agora Usando Joins para ligar as três tabelas
Select CL.IdCliente, CL.IdadeCliente, V.DataVenda, V.QuantidadeVenda, CA.NomeCategoria
From Categorias CA
Inner Join Vendas V 
On CA.IdCategoria = V.IdCategoria
Inner Join Clientes CL
On CL.IdCliente = V.IdCliente
Go


--Usando Where para filtrar para aparecer somente as vendas de uma categoria

Select C.NomeCategoria, V.PrecoUnitarioVenda, V.QuantidadeVenda, V.ValorTotalVenda, V.DataVenda
From Categorias C
Inner Join Vendas V 
On C.IdCategoria = V.IdCategoria
Where C.NomeCategoria = 'Clothing' -- Dessa forma filtramos para só aparecer 
Go

--Listando Apenas clientes que tenham vendas registradas

Select C.IdCliente, C.GeneroCliente, V.IdVenda
From Vendas V
Left Join Clientes C -- left Join Só traz registros focando nos da esquerda mesmo se não tiver correspondência na direita
On C.IdCliente = V.IdCliente
Go

--Mostrandos clientes e os valores de cada venda realizada por eles 
Select C.IdCliente, V.ValorTotalVenda
From Vendas V
Left Join Clientes C 
On C.IdCliente = V.IdCliente
Go

--Mostrando o Id da venda o cliente o Sexo do cliente que comprou e a categoria dela

Select V.IdCategoria, CL.GeneroCliente, CA.NomeCategoria
From Categorias CA
Inner Join Vendas V 
On CA.IdCategoria = V.IdCategoria
Inner Join Clientes CL
On CL.IdCliente = V.IdCliente
Go

--Filtrando apenas uma linha e trazendo todas as informações dela

Select CL.IdCliente, CL.IdadeCliente,Cl.GeneroCliente,V.IdVenda, V.DataVenda, V.QuantidadeVenda, V.PrecoUnitarioVenda, V.ValorTotalVenda, CA.NomeCategoria,CA.IdCategoria
From Categorias CA
Inner Join Vendas V 
On CA.IdCategoria = V.IdCategoria
Inner Join Clientes CL
On CL.IdCliente = V.IdCliente
Where V.IdVenda = 546
Go

--Mostrando todos os dados possíveis do Banco de dados

Select CL.IdCliente, CL.IdadeCliente,Cl.GeneroCliente,V.IdVenda, V.DataVenda, V.QuantidadeVenda, V.PrecoUnitarioVenda, V.ValorTotalVenda, CA.NomeCategoria,CA.IdCategoria
From Categorias CA
Inner Join Vendas V 
On CA.IdCategoria = V.IdCategoria
Inner Join Clientes CL
On CL.IdCliente = V.IdCliente
Go

