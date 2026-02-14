# Versionamento de Código com Git e GitHub

## 1. Conceitos Fundamentais

### O que é Versionamento de Código?
* Registra o histórico de atualizações de um arquivo.
* Proporciona organização, controle e segurança.
* Gerencia quais foram as alterações, a data, o autor, etc.
* Controla as versões de um arquivo ao longo do tempo.

### Sistemas de Controle de Versão (VCS)
* **VCS Centralizado (CVCS):** Possui um servidor central único contendo o banco de versões (Ex: CVS, Subversion).
* **VCS Distribuído (DVCS):**
    * Os clientes não apenas baixam a última versão dos arquivos, mas clonam o repositório completo (incluindo histórico).
    * Cada clone funciona como um backup.
    * Possibilita trabalhar sem conexão à rede (offline).
    * Fluxo de trabalho flexível.
    * Ex: Git, Mercurial.

---

## 2. Ferramentas: Git e GitHub

### O que é Git?
* Sistema de Controle de Versão **Distribuído**.
* Gratuito e Open Source (Código Aberto).
* Leve, rápido e com ramificações (branching) e fusões (merging) eficientes.
* Criado por Linus Torvalds (criador do Linux) em 2005.

### O que é GitHub?
* Plataforma de **hospedagem** de código para controle de versão com Git e colaboração.
* **Diferença:** Git é a ferramenta (software) de versionamento; GitHub é o serviço na web que hospeda os projetos.

---

## 3. Instalação (Comandos)

**Linux (Ubuntu/Debian):**
```bash
apt update
apt install git

```

**macOS:**

```bash
brew install git

```

---

## 4. Configuração Inicial

Configurações globais de identidade do usuário.

**Verificar configurações:**

```bash
git config --list

```

**Configurar Nome e E-mail:**

```bash
git config --global user.name "Nome Sobrenome"
git config --global user.email seuemail@email.com

```

**Configurar Branch Padrão:**

```bash
git config --global init.defaultBranch main

```

**Armazenamento de Credenciais:**

```bash
# Salvar no cache (temporário)
git config --global credential.helper cache

# Salvar permanentemente
git config --global credential.helper store

```

---

## 5. Fluxo de Trabalho e Comandos Básicos

### Inicialização e Clonagem

* **`git init`**: Inicializa um repositório Git novo em um diretório local (transforma a pasta em um repositório).
* **`git clone [url]`**: Clona um repositório Git existente (remoto) para um novo diretório local (baixa todo o histórico).
* **`git remote add origin [url]`**: Conecta um repositório local criado recentemente a um repositório remoto.

### Manipulação de Alterações

* **`git add`**: Adiciona o conteúdo/arquivo que deseja inserir no próximo commit (prepara o arquivo).
* **`git commit -m "mensagem"`**: Grava as alterações no repositório com uma mensagem descritiva (cria um ponto na história).

### Sincronização (Local <-> Remoto)

* **`git pull`**: "Puxa" as alterações do repositório remoto para o local (busca e mescla automaticamente).
* **`git push`**: "Empurra" (envia) as alterações do repositório local para o repositório remoto.

---

## 6. Desfazendo Alterações

### Alterar Commit Recente

* **`git commit --amend`**: Permite refazer o último commit (ex: adicionar arquivos esquecidos).
* **`git commit --amend -m "nova mensagem"`**: Altera apenas a mensagem do último commit.

### Resetar Alterações (`git reset`)

* **`git reset`**: Comando geral para desfazer alterações.
* **`git reset --soft`**: Desfaz o commit, mas mantém as alterações prontas para serem commitadas novamente (staged).
* **`git reset --mixed`** (padrão): Desfaz o commit e retira os arquivos da área de preparação, mas mantém as alterações nos arquivos.
* **`git reset --hard`**: Desfaz tudo (commit e alterações nos arquivos), voltando exatamente ao estado anterior (perigoso, pois apaga trabalho não salvo).

---

## 7. Trabalhando com Branches (Ramificações)

**Definição:** Uma Branch ("Ramo") é uma ramificação do projeto, um ponteiro móvel para um commit. Permite desenvolvimento paralelo sem afetar a linha principal (`main`).

* **`git branch`**: Lista as branches existentes.
* **`git branch -v`**: Vê o último commit de cada branch.
* **`git checkout -b [nova-branch]`**: Cria uma nova branch e troca para ela imediatamente.
* **`git branch -d [nome-da-branch]`**: Deleta uma branch.

