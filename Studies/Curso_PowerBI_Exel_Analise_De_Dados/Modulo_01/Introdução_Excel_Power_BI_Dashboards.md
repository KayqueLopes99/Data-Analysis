## Introdução ao Excel e Power BI Dashboards
### Fundamentos de Business Intelligence (BI)
> Objetivo Geral

-  Pensamento Analítico 
-  SQL Analytics 
-  Extração e Análise de Dados 
-  Conhecimento em processo de ETL
-  Introduação ao Power BI

#### Contextualizando:
- Geramos constantemente dados por sites, apps e etc.
- Evolução da computação e oferta de serviço aos usuários.

- Os banco de dados é o local de armazenamaneto destes dados gerados, favorecendo a analise de conjuntos de informações agrupadas para resolução de problemas.
- E-commerce, Medicina, Social Media, Negócios e Engenharia.

- Comparações, entendimento de contextos e avaliações.

> Mercado:
- **Engenheiro de dados**
+ Desenho/Contrução/
+ Sustentação das soluções de dados
Extração de dados de fontes heterogêneas.
Disponibilizar os dados para serem consumidos pelos analistas e cientistas.
+ Banco de dados relacionais.

- **Cientista de dados**
+ Modelagem
+ Reconhecimento de padrões / Predição
Busca responder perguntas atreladas ao contexto do negócio. Buscando insights através de técnicas de modelagem.


- **Analista de dados**
+ Criação de dashboards
+ Apresentação visual dos dados
Busca entender o comportamento do negócio a partir dos dados. Realiza o
diagnóstico, identifica possíveis motivos para comportamentos e verifica métricas.


#### BI e sua matéria prima: Dados
- Linha lógica de raciocinio.
- 1. **Dados**: São estruturas organizadas em um determinado recurso, brutos e não muito organizados. Necessitam de tratamento e limpeza para resolução das suas lacunas e problemas existes. São elementos brutos, isolados e sem contexto definido.

- 2. **Informações**: Resultam do processamento e da organização dos dados. Possuem contexto e significado, permitindo compreensão sobre determinada situação ou fato.

- 3. **Conhecimento**: É a interpretação das informações com base na experiência, análise e entendimento. Permite a tomada de decisões e a aplicação prática em determinado contexto.


> Fluxo de dados em BI:
- O fluxo de dados em Business Intelligence representa o caminho que os dados percorrem até se transformarem em suporte estratégico para decisões.

- Business intelligence consiste em uma área composta por estratégias e tecnologias utilizadas pelas empresa a fim de realizar análise de dados e gerenciamento das informações.

- Sequência lógica:

Dados → Informações → Conhecimento → Decisões

> O que é Business Intelligence?
- Objetivo: transformar dados em conhecimento com o foco na melhoria e operações no negocio. 
- Entendimento: fatores conhecidos e não conhecidos
- Foco: operações e melhorias


- **Business Intelligence (BI)** representa a evolução da simples geração de relatórios para análises cada vez mais sofisticadas. Inicialmente, o foco estava apenas na produção de relatórios descritivos. Com o avanço das ferramentas e técnicas, o BI passou a permitir o monitoramento de ativos, a análise do comportamento de clientes e a previsibilidade de vendas. Assim, o conceito evoluiu de uma visão operacional para um suporte estratégico, oferecendo informações mais aprofundadas para tomada de decisão.

- Relátorios interativos e sofisticados.

> Futuro do BI
- Diferentes escopo
- Variedade dos dados
- Especificidade
- Granularidade de dados

> Softwares de BI: PowerBI
- Orquestração
- Recuperação de dados
- Integração
- Relatórios de visualização

> Big Data e BI estão relacionados, mas possuem focos distintos.

O Big Data é caracterizado pelos 4 V’s: volume elevado de dados, variedade de formatos, velocidade na geração e processamento das informações e veracidade, que se refere à confiabilidade dos dados. Trata-se de grandes massas de dados, muitas vezes complexas e não estruturadas.

Já o BI (Business Intelligence) trabalha, em geral, com dados típicos e estruturados, utilizados pela maioria das empresas. Normalmente envolve baixo ou médio volume de dados, organizados em bancos relacionais, com foco na geração de relatórios, dashboards e análises para apoio à decisão.

#### Tipos de análise em Business Intelligence
> BI & Data Science (DS)

- Tipos de Análise

- 1. **Análise Descritiva**
**Objetivo:** Descrever o que aconteceu.
* Primeira análise realizada.
* Caracterizar e sumarizar dados.
* Entender o comportamento dos dados.
* Uso comum em BI (relatórios e dashboards).

- 2. **Análise Diagnóstica**
**Objetivo:** Entender por que aconteceu.
* Encontrar relações de causa e efeito.
* Explicar o cenário descrito pelos dados.
* Pode envolver análises estatísticas e probabilísticas.


- 3. **Análise Preditiva**
**Objetivo:** Prever o que pode acontecer.
* Processo probabilístico.
* Análise de tendências.
* Modelos estatísticos e de Machine Learning.
* Forte atuação da Data Science.

- 4. **Análise Prescritiva**
**Objetivo:** Indicar o que deve ser feito.
* Diagnóstico e prescrição de ações.
* Sugestão de soluções para problemas.
* Avaliação de impactos das decisões.
* Nível mais avançado de análise.

- Relação entre BI e Data Science

* **BI** atua principalmente nas análises **Descritiva e Diagnóstica**.
* **Data Science** concentra-se mais nas análises **Preditiva e Prescritiva**, utilizando modelos estatísticos e algoritmos avançados.

- **Descrever → Diagnosticar → Prever → Prescrever**

- Aplicação do BI:
- Coleta das informações
- Estruturação (transformação)
- Representação visual (relatórios,
gráficos …)

> Respeite o processo
- Problema de negócio
- Perguntas sobre o contexto
- Escolha o tipo de análise
- Utilze as ferramentas


> Em síntese
- Descritiva: O que aconteceu? 
- Diagnóstica: Por que aconteceu?
- Preditiva: O que vai acontecer?
- Prescritivo: O que fazer?



#### Análise de Dados & Big Data
- Contextualizando: Evolução dos softwares. 
- Velocidade e variedade de dados dos gerados.
- Ferramentas de adminitração de dados.

- *Dados estruturados* são organizados em formato definido (como tabelas com linhas e colunas), enquanto *dados não estruturados* não seguem um padrão fixo, como textos, imagens, áudios e vídeos.

-**Como analisa isso?**
- No Power BI, o fluxo segue uma sequência lógica: os dados são obtidos das fontes de dados (Data Source), passam pelo processo de ETL (extração, transformação e carga), são organizados em um Data Warehouse, analisados na etapa de análise de dados e, por fim, apresentados por meio da visualização dos dados em relatórios e dashboards.


- Dados tradicionais: em tabelas e relacionamentos.
- Dados Orientados a documentos: em json.
