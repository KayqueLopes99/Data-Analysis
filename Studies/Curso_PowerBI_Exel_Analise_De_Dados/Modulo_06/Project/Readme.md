# Desafio de Projeto: Integração e Transformação de Dados com Power BI e MySQL

## Descrição do Desafio de Projeto
Este projeto teve como objetivo principal a construção de um pipeline de dados unindo um banco de dados relacional em nuvem com uma ferramenta de Business Intelligence. As etapas principais incluíram:

* Criação de uma instância na Azure para MySQL.
* Criar o Banco de dados com base disponível no GitHub.
* Integração do Power BI com MySQL no Azure.
* Verificar problemas na base a fim de realizar a transformação dos dados.

---

##  Diretrizes para Transformação dos Dados

Abaixo estão as diretrizes seguidas e as ações realizadas durante o processo de ETL (Extração, Transformação e Carga) no Power Query:

* **Verifique os cabeçalhos e tipos de dados:**
* Tabela `works_on`: tipo de dado ajustado da coluna `Essn` de texto para inteiro.
* Tabela `employee`: tipo de dado ajustado da coluna `Salary` de número decimal para número decimal fixo.
* Tabela `employee`: tipo de dado ajustado da coluna `Super_ssn` de texto para inteiro.
* Tabela `dependent`: tipo de dado ajustado da coluna `Essn` de texto para inteiro.
* Tabela `department`: tipo de dado ajustado da coluna `Mgr_ssn` de texto para inteiro.
* Cabeçalhos verificados e em conformidade.


* **Modifique os valores monetários para o tipo double preciso:**
* Tabela `employee`: tipo de dado ajustado da coluna `Salary` de número decimal para número decimal fixo.


* **Verifique a existência dos nulos e analise a remoção:**
* Verificado e não foram encontrados valores nulos indevidos.


* **Os employees com nulos em `Super_ssn` podem ser os gerentes. Verifique se há algum colaborador sem gerente:**
* Sim, o colaborador Carlos Silva não possui gerente (`Super_ssn` nulo), pois ele atua como o Diretor/CEO da empresa e está no topo da hierarquia.


* **Verifique se há algum departamento sem gerente:**
* Não há departamentos sem gerente. Todos os registros possuem a coluna `Mgr_ssn` preenchida, respeitando a restrição `NOT NULL` definida na modelagem do banco de dados. *(Se houvesse lacunas, a diretriz seria preencher com os dados disponíveis, mas todos já possuem).*


* **Verifique o número de horas dos projetos:**
* Verificado, tudo certo.


* **Separar colunas complexas:**
* A coluna complexa de endereço (`Address`) foi dividida através de delimitadores (vírgula e hífen) para isolar as informações, transformando-a em três colunas estruturadas: Rua, Número e Cidade.


* **Mesclar consultas `employee` e `departament` para criar uma tabela employee com o nome dos departamentos associados aos colaboradores:**
* A consulta foi criada utilizando a junção Externa Esquerda no Power Query com base na tabela `employee`, ligando com a tabela `department` pelo `Dno`, garantindo que todos os colaboradores fossem mantidos e associados ao nome de seus respectivos departamentos.


* **Neste processo elimine as colunas desnecessárias:**
* Após a mescla, as colunas não solicitadas foram removidas, deixando apenas o nome do departamento.


* **Realize a junção dos colaboradores e respectivos nomes dos gerentes:**
* A relação entre colaboradores e gerentes foi estabelecida via Power Query através de uma autojunção (Externa Esquerda), mesclando a tabela de empregados com ela mesma utilizando as colunas `Super_ssn` e `Ssn` em um *Left Outer Join*.


* **Mescle as colunas de Nome e Sobrenome para ter apenas uma coluna definindo os nomes dos colaboradores:**
* FEITO.


* **Mescle os nomes de departamentos e localização:**
* Para criar essa combinação única de Departamento e Localização, foi selecionada a tabela `departament` e mesclada com a `dept_locations` pela coluna `Dnumber` usando junção Externa Esquerda. Após o OK, foi expandida apenas a coluna `Dlocation`. Isso auxiliará na criação do modelo estrela em um módulo futuro.
* **Explicação da escolha (Mesclar vs. Atribuir):** Neste cenário, utiliza-se a operação de Mesclar (*Merge*) pois o objetivo é realizar uma junção de atributos (colunas) de diferentes tabelas para consolidar uma entidade. O Atribuir (*Append*) apenas empilharia os registros verticalmente, o que não permitiria relacionar o nome do departamento à sua respectiva localização na mesma linha de dados.


* **Agrupe os dados a fim de saber quantos colaboradores existem por gerente:**
* Os dados foram agrupados utilizando a funcionalidade 'Agrupar Por', tendo como chave o nome do gestor, para contabilizar a quantidade de colaboradores vinculados a cada respectiva gerência.


* **Elimine as colunas desnecessárias, que não serão usadas no relatório, de cada tabela:**
* FEITO. Eliminadas: `Minit`.



---

## Processamento e Transformação de Dados

Nesta etapa do projeto, realizei a manipulação dos dados provenientes do banco de dados `azure_company`. É importante destacar que o conjunto de dados utilizado para as análises deste projeto foi estabelecido por meio da inserção manual de 30 registros em cada tabela do banco de dados (Employee, Departament, Project, Works_on, Dependent e Dept_locations), garantindo a robustez das análises e a integridade das relações.

### 1. Mesclar Consultas (Associada ao `JOIN` do SQL)

* **Definição:** O Mesclar é uma operação que combina duas tabelas horizontalmente com base em uma ou mais colunas que possuam valores correspondentes, sendo estas as chaves.
* **Justificativa:** Foi utilizado para enriquecer tabelas existentes com informações de outras entidades, permitindo que atributos de tabelas diferentes residam na mesma linha.
* **Porquê:** Utilizamos o Mesclar neste cenário para consolidar uma entidade única (como o Colaborador e seu Departamento), pois o objetivo era realizar uma junção de atributos (colunas) e não um empilhamento de registros.

### 2. Atribuir/Combinar Consultas (Associada ao SQL `CONCATENATE`)

* **Definição:** O Atribuir (ou Acrescentar) é uma operação que combina duas ou mais tabelas verticalmente, unindo os registros de uma abaixo da outra.
* **Justificativa:** Esta técnica é ideal para unificar fontes de dados que possuem a mesma estrutura (mesmas colunas), criando uma lista única.
* **Porquê:** No contexto do projeto, o Atribuir não foi utilizado para relacionar nomes de departamentos a localizações, pois essa operação apenas empilharia os dados verticalmente, o que impossibilitaria correlacionar o departamento à sua respectiva localização na mesma linha.


##  Como baixar e visualizar o projeto

Para abrir e interagir com este projeto na sua máquina, siga os passos abaixo:

1. Certifique-se de ter o **[Power BI Desktop](https://powerbi.microsoft.com/desktop/)** instalado no seu computador.
2. Faça o clone deste repositório ou baixe o arquivo.
3. Extraia os arquivos e abra o arquivo com a extensão `.pbix` diretamente no seu Power BI Desktop.

Obs: Você pode visualizar o relatório em formato pdf na pasta `pdf` ao lado.
