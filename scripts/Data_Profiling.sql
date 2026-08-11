--Criação da Banco de Dados
Create DataBase VarejoDB
Go

--Usando o VarejoDB nessa Consulta
Use VarejoDB
Go


--Consultando os dados importados

Select * From Venda_Bruta
Go

-- Iniciando o processo de Data Profiling e validação da qualidade dos dados

--Contando a quantidade de vendas 
Select Count(*) As Total_Venda
From Venda_Bruta
Go

--Validando para ver se existe Ids Duplicados
Select Transaction_ID, Count(*) As TotalVendas
From Venda_Bruta
Group By Transaction_ID -- Agrupamos por Id
Having (Count(*) > 1) -- Com esse filtro aparece apenas os Ids que tiver mais de uma aparição
Go


--Verificando se existe algum valor nulo em todas as colunas
Select
    Sum(Case When Transaction_ID Is Null Then 1 Else 0 End) As TotalTransactionID_Nulos,
    Sum(Case When Date Is Null Then 1 Else 0 End) As TotalDate_Nulos,
    Sum(Case When Customer_ID Is Null Then 1 Else 0 End) As TotalCustomerID_Nulos,
    Sum(Case When Gender Is Null Then 1 Else 0 End) As TotalGender_Nulos,
    Sum(Case When Age Is Null Then 1 Else 0 End) As TotalAge_Nulos,
    Sum(Case When Product_Category Is Null Then 1 Else 0 End) As TotalProductCategory_Nulos,
    Sum(Case When Quantity Is Null Then 1 Else 0 End) As TotalQuantity_Nulos,
    Sum(Case When Total_Amount Is Null Then 1 Else 0 End) As TotalTotalAmount_Nulos,
    Sum(Case When Price_per_Unit Is Null Then 1 Else 0 End) As TotalPricePerUnit_Nulos
From Venda_Bruta;
Go

-- Contando para ver quantos clientes existem
Select Count(Distinct Customer_ID) 
From Venda_Bruta
Go


--Vendo Faixa Etaria dos clientes Cliente mais novo e o mais velho
Select Min(Age) As IdadeMinima , Max(Age) As IdadeMaxima
From Venda_Bruta
Go

-- Vendo Quantas pessoas estão em cada grupo de idade

Select 
    Case 
        When Age < 18 Then 'Menor De 18'
        When Age Between 18 And 29 Then '18 A 29 Anos'
        When Age Between 30 And 44 Then '30 A 44 Anos'
        When Age Between 45 And 59 Then '45 A 59 Anos'
        Else '60+ Anos'
    End As FaixaEtaria,
    Count(Distinct Customer_ID) As TotalClientes
From Venda_Bruta
Group By 
    Case 
        When Age < 18 Then 'Menor De 18'
        When Age Between 18 And 29 Then '18 A 29 Anos'
        When Age Between 30 And 44 Then '30 A 44 Anos'
        When Age Between 45 And 59 Then '45 A 59 Anos'
        Else '60+ Anos'
    End
Order By FaixaEtaria;
Go



--Contando quantas categoria existe e quantas vendas tem por categoria

Select Count( Distinct Product_Category)
From Venda_Bruta
Go

Select Product_Category, Count(*) As QuantidadeVendas
From Venda_Bruta
Group By Product_Category
Go



-- Verificando a faixa de proço unitário
Select Min(Price_per_Unit) As PrecoMinimo, Max(Price_per_Unit) As PrecoMaximno
From Venda_Bruta
Go


--  Total_Amount = Quantity × Price_per_Unit em todas as vendas?


Select *
From Venda_Bruta
Where Total_Amount <> Quantity * Price_per_Unit