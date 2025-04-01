
import pandas as pd
import re

# Caminho do arquivo original
entrada = "C:/temp/demonstrativos_consolidados_corrigido.csv"
saida = "C:/temp/demonstrativos_utf8_final.csv"

# Leitura do CSV
df = pd.read_csv(entrada, encoding='latin1')

# Conversão dos valores numéricos
df["VL_SALDO_INICIAL"] = df["VL_SALDO_INICIAL"].astype(str).str.replace(",", ".").astype(float)
df["VL_SALDO_FINAL"] = df["VL_SALDO_FINAL"].astype(str).str.replace(",", ".").astype(float)

# Limpeza de caracteres especiais
def limpar(texto):
    if isinstance(texto, str):
        return re.sub(r'[^ -~áéíóúÁÉÍÓÚãõçÇâêôÂÊÔàèÀÈüÜ]', '', texto)
    return texto

df = df.applymap(limpar)

# Exporta arquivo limpo
df.to_csv(saida, index=False, encoding='utf-8')
