 ## Otimizando Modelos com Foco em Performance
> O que é otimização?
- Realização de modificações no estado atual do modelo de dados a fim de executar suas operações com maior eficiência. Dessa forma, aumentamos seu desempenho. 


> Desempenho? Pra que?
Desempenho do relatório em fase de testes
Desempenho do relatório em fase de produção

> O que impacta na visão do usuário?
- Lentidão no carregamento
- Demora na atualização dos visuais


> Qual o motivo?
- Modelagem inadequada
- Mau uso da linguagem DAX
- Combinação…

> Quais as vantagens da otimização?
- Melhor experiência do usuário.
- Desempenho e bons resultados.
- Cliente satisfeito.

> Processo de otimização

- Garantir que os tipos de dados corretos sejam usados.
- Excluir colunas e linhas desnecessárias.
- Evitar valores repetidos.
- Substituir colunas numéricas por medidas.
- Reduzir cardinalidades.
- Analisar metadados do modelo.
- Resumir dados sempre que possível.

> Como armazenar os dados?
- Importar
- DirectQuery
- Composto

> Facilidade x disponibilidade
Acesso aos dados
Tempo de carregamento
Permissão de acesso

#### Exemplificando um cenário com problemas de otimização
> Problema:
- O carregamento das páginas lento
- Tabelas não são atualizadas com rapidez em seleções

> O que fazer? 
- Examinar o desempenho de medidas, relações e visuais.
- Usar variáveis para aprimorar o desempenho e solucionar problemas.
- Aprimorar o desempenho reduzindo os níveis de cardinalidade.
- Otimizar modelos do DirectQuery com o armazenamento no nível da tabela.
- Criar e gerenciar agregações.

Existem alguns pontos a serem considerados:
- Identificação de gargalos de desempenho no relatório
- Analisar o desempenho com Perfomance Analyser
- Examinar os resultados


#### Resolvendo Problemas
> Visuais
- Melhorar o desempenho.
- Mínimo impacto na experiência do usuário.
- Menos visuais -> mais desempenho.

> DAX
- Tempo de execução da consulta.
- Performance Analyzer.
- Referência: 120 milseg.

> Modelo de dados
- Visuais com bom desempenho.
- DAX com execução rápida.
- Provável: relações, colunas ou metadados.

> Pontos de atenção
- Verifique as relações e cardinalidades.
- Delete as colunas desnecessárias.
- Preferência exclusão: na importação..
- Use o Power Query quando necessários.

> Técnicas para redução de dados
- Remover colunas desnecessárias.
- Remover linhas desnecessárias.
- Otimizar tipos de dados de coluna..
- Colunas personalizadas.
- Desabilitar data/hora automática.

> Site de ajuda: https://learn.microsoft.com/pt-br/power-bi/guidance/import-modeling-data-reduction


#### Funcionalidade Performance Analyzer
- Verifica a otimização e está na aba `Exibição` do power bi.
- Exportação Json.

#### PONTOS IMPORTANTES:
- Formas influenciam a velocidade de carregamento do relatório. 

#### Cache
- Armazenamento das informações. 
> Como avaliar o desempenho do relatório sem a influencia do cache?



