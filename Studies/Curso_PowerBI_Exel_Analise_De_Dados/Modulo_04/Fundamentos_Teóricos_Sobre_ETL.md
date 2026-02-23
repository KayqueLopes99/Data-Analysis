## Fundamentos Teóricos Sobre ETL (Estract Transform Load)
> O que é ETL?
ETL é um processo fundamental no campo de análise de dados e business intelligence, que envolve três etapas principais: Extração, Transformação e Carga. O objetivo do ETL é coletar dados de diversas fontes, transformá-los em um formato adequado para análise e, finalmente, carregá-los em um sistema de destino, como um data warehouse ou um banco de dados analítico.


- De primeira os dados provem de diversas ou de uma única fonte, algumas vezes eles são desosganizados, logo vamos ao processo:

- **Extração**: Nesta etapa, os dados são coletados de várias fontes, que podem incluir bancos de dados relacionais, arquivos CSV, APIs, ou até mesmo fontes de dados em nuvem. O objetivo é reunir os dados brutos necessários para a análise.

- **Transformação**: Após a extração, os dados passam por um processo de transformação, onde são limpos, organizados e convertidos para um formato adequado para análise. Isso pode incluir a remoção de duplicatas, tratamento de valores ausentes, normalização de dados e aplicação de regras de negócios específicas. (Inegração de dados e gerenciamento de tabelas)

- **Carga**: Finalmente, os dados transformados são carregados em um sistema de destino, como um data warehouse ou um banco de dados analítico. Este processo garante que os dados estejam disponíveis para consultas e análises futuras. (Pensando onde serão inseridos e apresentados)

- Existem duas entre essas.
> Clean(Extra): Limpeza de Dados aliado a etapa da extração. 

> Analyze(Extra): Análise de Dados


#### O que é ELT – Extract, Load and Transform
- O ELT é uma variação do processo ETL, onde a ordem das etapas é alterada. Em vez de transformar os dados antes de carregá-los, o ELT carrega os dados brutos diretamente no sistema de destino e realiza a transformação posteriormente. Isso é especialmente útil em ambientes de big data, onde a capacidade de processamento do sistema de destino pode ser aproveitada para realizar transformações complexas.

- Necessita de outras ferramentas. 

- Diferença: abordagem de transformação. Pespectiva sobre os dados.
- Estrutura influencia a analise.
- Analista ficam com a tranformação.
- Ágil dentro de contxtos. 

> Processo de ELT:
- Extração: Coleta de dados brutos. fontes heterogênes. Objetivo: integração posterior. 
- Load: Transferência/carregamento. Dados brutos. Data Warehouse ou repo
obs: Warehouse = repositório centralizado. 

- Transform: Transformação dos dados dentro do repositório. Aplicação das análises. 
Responsável: Profissionais de analise de dados. Contato direto com regras de negócios.

> Vantagens do ELT
- Otimização de tempo
- Eficiência na implementação de projetos
- Menor dependência de TI
- Papel principal dos analistas

#### Diferenças entre ETL e ELT?
> **Vantagens do ELT**:
- Tempo de carregamento (Sistemas modernos de processamento)
- Tempo de transformação (Gargale na transformação)
- Tempo de Manutenção (Custo de atualização)
- Complexidade de implementação (Custo de atualização)

> **Vantagens do ELT**
- Limitação de dados (Quais dados estão disponíveis?)
- Suporte à Data Warehouses (Como lidar com os dados?)
- Usabilidade (ata Warehouses)
