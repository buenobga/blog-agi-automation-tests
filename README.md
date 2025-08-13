#  Blog do Agi - Testes Automatizados com Robot Framework + Selenium

Este projeto contém testes automatizados para o [Blog do Agi](https://blog.agibank.com.br), utilizando o **Robot Framework** com foco em:

- ✅ Validação da funcionalidade de busca
- ✅ Validação na navegação da página

---

## 📂 Estrutura do Projeto

```
blog-agi-automation-tests/
├── .github/
│   └── workflows/
│       └── prd-actions.yml
├── resources/
│   ├── common.resource.robot
│   └── po/
│       ├── homepage.robot
│       ├── searchbar.robot
│       ├── searchresultspage.robot
│       └── segurospage.robot
├── results/
│   ├── log.html
│   ├── output.xml
│   ├── report.html
│   └── screenshots/
├── tests/
│   └── blog_agibank_automation_suite.robot
├── .gitignore
└── requirements.txt

```

---

## ⚙️ Tecnologias Utilizadas

- [Robot Framework](https://robotframework.org/)
- [SeleniumLibrary](https://github.com/robotframework/SeleniumLibrary)

---

## 🚀 Como Executar

### 1. Clone o repositório

```bash
git clone https://github.com/buenobga/blog-agi-automation-tests.git
cd blog-agi-automation-tests

```

### 2. (Opcional) Crie um ambiente virtual

```bash
python -m venv .venv
# Windows
.venv\Scripts\activate
# Linux/Mac
source .venv/bin/activate
```

### 3. Instale as dependências

```bash
pip install -r requirements.txt
```

## 🧪 Como Executar os Testes

### ✅ Executar todos os testes

```bash
robot -d results tests/


```


### 🔎 Executar apenas um cenário

```bash
robot -d results -t "Nome do Cenário" tests/blog_agibank_automation_suite.robot
```
> **📘 Entendendo os comandos**:
> - `robot` → Inicia a execução do Robot Framework  
> - `-d results` → Define a pasta onde serão salvos os relatórios  
> - `-t` → Especifica o nome de um teste para executar individualmente 

## 🔁 Como executar a PIPE

### Executar manualmente
> - Acesse a [actions](https://github.com/buenobga/blog-agi-automation-tests/actions/workflows/prd-actions.yml)
> - Click em 'run workflow' 
> - Ao final da execução será disponibilizado um artifact com o relatório gerado pelo robot framework

## 📄 Relatórios Gerados

Após a execução, os seguintes arquivos serão gerados:

- `log.html`: log detalhado da execução
- `report.html`: resumo dos testes executados
- `output.xml`: log técnico (útil para integração com CI/CD)

---

## 🛠️ Testes Implementados

| Cenários                            | Status |
|-------------------------------------|--------|
| `Busca com resultados`              | ✅     |
| `Busca sem resultados`              | ✅     |
| `Validação de layout e navegação`   | ✅     |
