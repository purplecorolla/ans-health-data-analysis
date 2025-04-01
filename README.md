
# Projeto ANS - Teste Técnico de Nivelamento

**Banco de Dados:** PostgreSQL  
**ETL/Data Cleaning:** Python + pandas  
**Volume de dados:** +6 milhões de linhas  
**Desafio:** Importar, tratar, consolidar e analisar dados públicos da ANS (Agência Nacional de Saúde Suplementar)

---

## 📄 Descrição do Teste (Resumo das Instruções)

O teste técnico foi dividido em três etapas principais:

### 🔹 Teste 1 – Manipulação de Arquivos
- Acessar a página da ANS: https://www.gov.br/ans/pt-br/acesso-a-informacao/participacao-da-sociedade/atualizacao-do-rol-de-procedimentos
- Baixar os arquivos PDF "Anexo I" e "Anexo II"
- (Opcional) Compactar os arquivos em um `.zip` com o nome `Teste_{seu_nome}.zip`

### 🔹 Teste 2 – Transformação de Dados
- Extrair tabelas do PDF (todas as páginas)
- Salvar os dados extraídos em CSV
- Substituir abreviações nas colunas (OD → Odontológico, AMB → Ambulatorial)
- Compactar o resultado como `Teste_{seu_nome}.zip`

### 🔹 Teste 3 – Análise de Dados
- Baixar e consolidar os dados trimestrais de demonstrações contábeis de 2023 e 2024
- Corrigir codificações, formatos numéricos e gerar CSV unificado
- Importar os dados em um banco relacional (PostgreSQL)
- Baixar e importar os dados de operadoras ativas da ANS
- Executar análises relacionando dados financeiros com os nomes das operadoras:
  - Top 10 operadoras com maiores despesas hospitalares no 4º trimestre de 2024
  - Top 10 operadoras com maiores despesas hospitalares em todo o ano de 2024

---

## 📥 Links para Download dos Dados Oficiais

- 📄 Rol de Procedimentos e Eventos em Saúde (PDF):  
  https://www.gov.br/ans/pt-br/acesso-a-informacao/participacao-da-sociedade/atualizacao-do-rol-de-procedimentos

- 📊 Demonstrativos Contábeis Trimestrais (2023 e 2024):  
  https://www.gov.br/ans/pt-br/assuntos/dados-e-indicadores/dados-financeiros/demonstrativos-contabeis/demonstrativos-contabeis

- 🧾 Cadastro de Operadoras Ativas (CSV):  
  https://www.gov.br/ans/pt-br/assuntos/operadoras/operadoras-ativas/cadastro-operadoras-ativas/cadastro-operadoras-ativas.csv

---

## 🔍 Objetivo

Realizar o tratamento e a consolidação dos dados financeiros e cadastrais das operadoras de saúde brasileiras, com o objetivo de extrair insights a partir de análises SQL e gerar um pipeline reprodutível de importação e análise de dados públicos.

---

## 🛠️ Como rodar o projeto localmente

### 📋 Requisitos:
- Python 3.8+
- PostgreSQL 13+ instalado e configurado localmente

### 📦 Instalação de dependências:
```bash
pip install pandas
```

### 📁 Estrutura esperada:
```
./projeto-ans/
├── demonstrativos_consolidados_corrigido.csv
├── operadoras_ativas.csv
├── demonstrativos_utf8_final.csv  # gerado após execução do script
├── limpeza_dados.py
├── script_teste3.sql
├── scraper_anexos_ans.py  # script do Teste 1
└── Entrega_Teste3_Caio.pdf
```

### 🐍 1. Executar o script Python de limpeza
```bash
python limpeza_dados.py
```

### 🐘 2. Criar e popular o banco de dados PostgreSQL
```sql
\i script_teste3.sql
```

### 📤 3. Importar os dados tratados para o banco:
```sql
\copy demonstrativos FROM 'CAMINHO/para/demonstrativos_utf8_final.csv' DELIMITER ',' CSV HEADER;
\copy operadoras FROM 'CAMINHO/para/operadoras_ativas.csv' DELIMITER ';' CSV HEADER ENCODING 'utf8';
```

### 📊 4. Executar as queries analíticas:
As queries estão no final do `script_teste3.sql`, mas você pode rodá-las diretamente com os comandos SQL incluídos.

---

## 📈 Exemplos de Resultados

| Operadora                             | Despesa Anual 2024 |
|--------------------------------------|---------------------|
| BRADESCO SAÚDE S.A.                  | R$ 87,2 bilhões     |
| SUL AMÉRICA COMPANHIA DE SEGURO      | R$ 65,3 bilhões     |
| AMIL ASSISTÊNCIA MÉDICA INTERNACIONAL| R$ 53,1 bilhões     |

---

## 📚 Arquivos incluídos

- `limpeza_dados.py` – script Python para normalização do CSV
- `script_teste3.sql` – estrutura do banco + queries
- `webscraper_ans.py` – web scraper do Teste 1 (Anexo I e II)
- `analise_final_dados_ans.pdf` – documentação geral da entrega

---

## ✅ Conclusão

Este projeto demonstra a capacidade de manipular grandes volumes de dados públicos, fazer limpeza e transformação com Python, estruturar uma base relacional no PostgreSQL e extrair insights relevantes por meio de SQL puro.
