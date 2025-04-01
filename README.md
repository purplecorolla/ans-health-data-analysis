
# Projeto ANS - Teste Técnico de Nivelamento

**Desenvolvido por:** Caio  
**Banco de Dados:** PostgreSQL  
**ETL/Data Cleaning:** Python + pandas  
**Volume de dados:** +6 milhões de linhas  
**Desafio:** Importar, tratar, consolidar e analisar dados públicos da ANS (Agência Nacional de Saúde Suplementar)

---

## 📄 Descrição do Teste (Resumo das Instruções)

O teste técnico foi dividido em três etapas principais:

### 🔹 Teste 1 – Manipulação de Arquivos
- Descompactar o PDF "Rol de Procedimentos e Eventos em Saúde"
- Garantir que os arquivos estavam acessíveis para extração posterior

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
