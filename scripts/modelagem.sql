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
