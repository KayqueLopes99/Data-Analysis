# Desafio de Modelagem Dimensional: Análise de Atuação Docente

Este projeto apresenta a solução para o desafio de modelagem dimensional, onde um banco de dados relacional acadêmico foi convertido em um **Star Schema** (Esquema em Estrela) voltado para Business Intelligence.

## Objetivo
Criar um diagrama dimensional focado na análise do **Professor** como objeto principal. O modelo permite analisar a distribuição de carga horária, alocação em departamentos e disciplinas ministradas ao longo do tempo. Dados focados puramente nos alunos foram intencionalmente abstraídos, conforme escopo do desafio.

## Estrutura do Modelo (Star Schema)

O modelo foi estruturado centralizando os eventos de atribuição de aulas em uma Tabela Fato, cercada por tabelas Dimensão descritivas.

### Tabela Fato
* **`Fato_Atribuicao`**: Registra o evento de um professor lecionando uma disciplina, para um curso específico, em um determinado departamento e período.
  * **Métricas analisadas**: `Qtd_Turmas`, `Qtd_Alunos`.
  * **Chaves**: Conexão exclusiva através de Chaves Substitutas (Surrogate Keys - SK) para otimização do modelo.

### Tabelas Dimensão
As dimensões fornecem o contexto (Quem, Onde, O Que e Quando) para a tabela fato:
* **`Professor`**: Dados cadastrais e titulação do docente.
* **`Departamento`**: Estrutura organizacional e campus.
* **`Curso`**: Cursos aos quais as disciplinas estão vinculadas.
* **`Disciplina`**: Detalhes da matéria, carga horária e tipo.
* **`Data`**: Dimensão de tempo criada especificamente para este modelo, permitindo análises granulares por `Semestre_Letivo`, `Ano` e `Mês`.

## Ferramenta Utilizada
* **MySQL Workbench**: Utilizado para a construção do Diagrama Entidade-Relacionamento (ER) com foco na arquitetura dimensional.

---
*Diagrama de referência anexado aos arquivos do projeto.*

**Obs:** Este projeto encontra-se organizado dentro de uma pasta específica no meu repositório geral de estudos do curso no GitHub.