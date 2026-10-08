## Implementação de Row-Level Security (RLS) no Power BI para Análise de Churn Santander

Este documento detalha o passo a passo e a sintaxe DAX necessária para implementar RLS na tabela `vw_analise_churn_santander`, criando duas funções de acesso para diferentes segmentos de idade.

### A) Passo a passo rápido no Power BI Desktop para criar RLS:

1.  **Abra o Power BI Desktop** e carregue seu modelo de dados (incluindo a tabela `vw_analise_churn_santander`).
2.  Na guia **Modelagem** (Modeling), clique em **Gerenciar Funções** (Manage Roles).
3.  Na janela "Gerenciar Funções", clique em **Criar** (Create) para adicionar uma nova função.
4.  **Nomeie a função** como `Gerente de Contas Jovens` e pressione Enter.
5.  No painel "Tabelas", expanda `vw_analise_churn_santander`.
6.  Clique nos três pontos ao lado de `vw_analise_churn_santander` e selecione **Adicionar filtro** (Add filter) > `segmento_idade`.
7.  Cole a sintaxe DAX fornecida abaixo na caixa "Expressão DAX" para esta função.
8.  Repita os passos 3 a 7 para a função `Gerente de Contas Sênior`.
9.  Clique em **Salvar** (Save).
10. Para testar as funções, na guia **Modelagem**, clique em **Exibir como** (View as) e selecione as funções criadas para ver como os dados são filtrados.

### B) Sintaxe DAX exata e limpa para cada função:

**1. Função: Gerente de Contas Jovens**

```dax
[segmento_idade] = "Jovem (Até 29 anos)" || [segmento_idade] = "Adulto (30 a 37 anos)"
```

**2. Função: Gerente de Contas Sênior**

```dax
[segmento_idade] = "Alerta Vermelho (38+ anos)"