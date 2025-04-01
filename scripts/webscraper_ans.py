import os
import requests
from bs4 import BeautifulSoup

url = "https://www.gov.br/ans/pt-br/acesso-a-informacao/participacao-da-sociedade/atualizacao-do-rol-de-procedimentos"
headers = {"User-Agent": "Mozilla/5.0"}

print("🔍 Acessando página da ANS...")
response = requests.get(url, headers=headers)
soup = BeautifulSoup(response.content, "html.parser")

os.makedirs("anexos", exist_ok=True)

baixados = 0
for link in soup.find_all("a", href=True):
    href = link["href"]
    texto = link.get_text().lower()

    if "anexo i" in texto or "anexo ii" in texto:
        # Link pode ser relativo
        if href.startswith("/"):
            href = "https://www.gov.br" + href

        filename = href.split("/")[-1].split("?")[0]
        file_path = os.path.join("anexos", filename)

        print(f"⬇️  Baixando {filename}...")
        file_resp = requests.get(href)
        with open(file_path, "wb") as f:
            f.write(file_resp.content)

        baixados += 1

if baixados == 0:
    print("⚠️  Nenhum anexo encontrado na página. Verifique se os títulos foram alterados.")
else:
    print(f"✅ {baixados} anexos baixados com sucesso para a pasta 'anexos/'.")