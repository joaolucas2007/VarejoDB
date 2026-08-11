# VarejoDB

Projeto desenvolvido em SQL Server utilizando uma base de dados do setor varejista, com foco em tratamento de dados, consultas SQL e Business Intelligence.

---

# 🎯 Objetivo

O objetivo deste projeto é praticar todo o processo de análise de dados, desde a importação e tratamento da base no SQL Server até a construção de dashboards interativos no Power BI, simulando um cenário real de mercado.

---

# 🛠 Tecnologias Utilizadas

- SQL Server
- T-SQL
- Power BI
- Git
- GitHub

---

# 📚 Conceitos que serão Aplicados

- Importação de Dados
- Data Profiling
- Qualidade e Integridade dos Dados
- Tratamento de Dados
- Modelagem Relacional
- Normalização
- CRUD
- JOINs
- GROUP BY e HAVING
- CASE
- Subqueries
- CTE
- Window Functions
- Views
- Procedures
- Dashboard no Power BI

---

# 🔍 Processo de Desenvolvimento

O projeto está sendo desenvolvido seguindo um fluxo de análise de dados, começando pela importação e investigação dos dados antes da realização das etapas de tratamento e modelagem.

### Fluxo atual

Dataset Bruto
      ↓
Importação para o SQL Server
      ↓
Data Profiling
      ↓
Validação da qualidade e integridade dos dados
      ↓
Modelagem das tabelas 

# 🗂️ Modelo de Dados

Após o processo de Data Profiling, foi realizada a modelagem relacional dos dados, separando as informações em três entidades principais:

- **Clientes** — armazena as informações dos clientes.
- **Categorias** — armazena as categorias dos produtos.
- **Vendas** — armazena as informações das transações e seus relacionamentos com clientes e categorias.

### DER

O modelo foi estruturado utilizando chaves primárias e estrangeiras para estabelecer os relacionamentos entre as tabelas.

![Modelo Entidade-Relacionamento](imagens/Modelagem/DER-VarejoDB.png)

# 📁 Estrutura do Projeto

```text
VarejoDB/
├── data/
│   └── raw/
│       └── retail_sales_dataset.csv
│
├── scripts/
│   ├── data_profiling.sql
│   └── modelagem.sql
│
├── dashboards/
│
├── imagens/
│   ├── Importacao/
│   │   ├── importacao.png
│   │   └── schema_importacao.png
│   │
│   └── Modelagem/
│       └── DER-VarejoDB.png
│
└── README.md
```

#  Status do Projeto

🚀 Em desenvolvimento.

- [x] Importação do dataset para o SQL Server
- [x] Data Profiling inicial
- [x] Validação da qualidade e integridade dos dados
- [x] Tratamento e transformação dos dados
- [x] Modelagem relacional
- [ ] Análises SQL
- [ ] Dashboards no Power BI
---

# 📬 Contato

📧 Email: **joao.lucas.devsql@gmail.com**

💼 LinkedIn: **www.linkedin.com/in/joão-lucas-freire-da-silva-a1b139420**