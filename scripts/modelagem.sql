--Usando o VarejoDB nessa consulta
Use VarejoDB
Go


-- Agora vamos destrinchar a tabela Venda_Bruta, criando o modelo DER

-- Teremos 3 tabelas Clientes - Categorias - Vendas

--Criação da tabela Clientes

Create Table Clientes
(
IdCliente NVarChar(50) Primary Key,
GeneroCliente NVarChar(50),
IdadeCliente TinyInt
)
Go

--Criação da tabela Categorias

Create Table Categorias (
IdCategoria Int Identity (1,1) Primary Key,
NomeCategoria NVarChar(50) Not Null
)

--Criação da tabela Vendas 

Create Table Vendas (
IdVenda Int Primary Key,
DataVenda Date Not Null,
QuantidadeVenda TinyInt Not Null,
PrecoUnitarioVenda Decimal(10,2) Not Null,
ValorTotalVenda Decimal(10,2) Not Null,
IdCliente NVarChar(50) Not Null,-- Fk vinda de Clientes
IdCategoria Int Not Null, --Fk Vinda de Categorias

--Fazendo o relacionamento ja na criação da tabela
--Fk vinda de Clientes
Constraint Fk_Vendas_Clientes_IdClinte
Foreign Key (IdCliente)
References Clientes(IdCliente),

--Fk vinda de Categorias
Constraint Fk_Vendas_Categorias_IdCategoria
Foreign Key (IdCategoria)
References Categorias(IdCategoria)
)
Go

--Populando as tabelas a partir da tabela Venda Bruta

--Inserindo dados na tabela Clientes 
Insert Into Clientes (IdCliente, GeneroCliente, IdadeCliente)

Select Distinct Customer_ID, Gender, Age
From Venda_Bruta
Go --Select distinct usamos para evitar de inserir o mesmo dado duas vezes em caso de repetições

--Inseridno dados na tabela Categorias
Insert Into Categorias (NomeCategoria)
Select Distinct Product_Category
From Venda_Bruta
Go

--Inserindo dados na tabela Vendas 

--Agora teremos que usar join para a validação do IdCategoria pois não existe em Venda_Bruta
Insert Into Vendas (IdVenda,
    DataVenda,
    QuantidadeVenda,
    PrecoUnitarioVenda,
    ValorTotalVenda,
    IdCliente,
    IdCategoria)

Select VB.Transaction_ID,
    VB.Date,
    VB.Quantity,
    VB.Price_per_Unit,
    VB.Total_Amount,
    VB.Customer_ID,
    c.IdCategoria
From Venda_Bruta VB
Inner Join Categorias C
On C.NomeCategoria = VB.Product_Category --Dessa forma inserimos os Ids categoria de acordo com o nome da categoria em Venda_Bruta
Go
