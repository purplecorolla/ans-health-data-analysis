
-- Criação da tabela demonstrativos
CREATE TABLE demonstrativos (
    DATA DATE,
    REG_ANS INTEGER,
    CD_CONTA_CONTABIL VARCHAR(20),
    DESCRICAO TEXT,
    VL_SALDO_INICIAL NUMERIC(18,2),
    VL_SALDO_FINAL NUMERIC(18,2),
    ANO INTEGER,
    TRIMESTRE VARCHAR(5)
);

-- Criação da tabela operadoras
CREATE TABLE operadoras (
  "REGISTRO_ANS" TEXT,
  "CNPJ" TEXT,
  "RAZAO_SOCIAL" TEXT,
  "NOME_FANTASIA" TEXT,
  "MODALIDADE" TEXT,
  "LOGRADOURO" TEXT,
  "NUMERO" TEXT,
  "COMPLEMENTO" TEXT,
  "BAIRRO" TEXT,
  "CIDADE" TEXT,
  "UF" TEXT,
  "CEP" TEXT,
  "DDD" TEXT,
  "TELEFONE" TEXT,
  "FAX" TEXT,
  "ENDERECO_ELETRONICO" TEXT,
  "REPRESENTANTE" TEXT,
  "CARGO_REPRESENTANTE" TEXT,
  "REGIAO_DE_COMERCIALIZACAO" TEXT,
  "DATA_REGISTRO_ANS" TEXT
);

-- Query 1: Despesas 4T/2024
SELECT 
    o."RAZAO_SOCIAL", d.REG_ANS,
    SUM(d.VL_SALDO_FINAL) AS total_despesas
FROM demonstrativos d
JOIN operadoras o ON o."REGISTRO_ANS"::INT = d.REG_ANS
WHERE d.ANO = 2024 AND d.TRIMESTRE = '4T'
  AND d.DESCRICAO ILIKE '%HOSPITALAR%'
  AND d.DESCRICAO ILIKE '%SINISTRO%'
  AND d.DESCRICAO ILIKE '%EVENTO%'
GROUP BY o."RAZAO_SOCIAL", d.REG_ANS
ORDER BY total_despesas DESC
LIMIT 10;

-- Query 2: Despesas ano 2024
SELECT 
    o."RAZAO_SOCIAL", d.REG_ANS,
    SUM(d.VL_SALDO_FINAL) AS total_despesas
FROM demonstrativos d
JOIN operadoras o ON o."REGISTRO_ANS"::INT = d.REG_ANS
WHERE d.ANO = 2024
  AND d.DESCRICAO ILIKE '%HOSPITALAR%'
  AND d.DESCRICAO ILIKE '%SINISTRO%'
  AND d.DESCRICAO ILIKE '%EVENTO%'
GROUP BY o."RAZAO_SOCIAL", d.REG_ANS
ORDER BY total_despesas DESC
LIMIT 10;
