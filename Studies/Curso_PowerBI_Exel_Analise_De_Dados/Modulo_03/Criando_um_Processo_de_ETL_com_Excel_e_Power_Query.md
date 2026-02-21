## Criando um Processo de ETL com Excel e Power Query
> Passos:
- Visualizar e entender o contexto da base de dados.


No **Microsoft Excel**, o ETL é feito usando o **Power Query**, ferramenta de importação e transformação de dados.

- O que é ETL?

**E – Extract (Extrair)**
Importar dados de fontes como:

* CSV
* Banco de dados
* Web
* Outra planilha

**T – Transform (Transformar)**
Tratar os dados:

* Remover colunas desnecessárias
* Filtrar informações
* Corrigir tipos de dados
* Limpar valores nulos
* Padronizar textos

**L – Load (Carregar)**
Enviar os dados tratados para:

* Uma nova planilha
* Modelo de dados
* Tabela dinâmica


#### Linguagem M de Tratamento de Dados

A **Linguagem M** é a linguagem usada pelo **Power Query** no **Microsoft Excel** e também no Power BI.

Ela é responsável por **executar as transformações feitas no processo de ETL**.

- O que ela faz?

Sempre que você:

* Remove uma coluna
* Filtra uma linha
* Altera tipo de dado
* Junta tabelas
* Cria coluna personalizada

O Power Query gera automaticamente código em **M** no Editor Avançado.

- Exemplo simples de código M

```m
let
    Fonte = Excel.CurrentWorkbook(){[Name="Tabela1"]}[Content],
    TipoAlterado = Table.TransformColumnTypes(Fonte, {{"Data", type date}})
in
    TipoAlterado
```

Esse código:

1. Extrai a tabela
2. Altera o tipo da coluna Data
3. Retorna a tabela tratada
