-- public.vw_analise_churn_santander fonte

CREATE OR REPLACE VIEW public.vw_analise_churn_santander
AS SELECT target,
        CASE
            WHEN target = 1 THEN 'Risco de Evasão (Churn)'::text
            ELSE 'Satisfeito'::text
        END AS status_cliente,
    idade,
        CASE
            WHEN idade < 30 THEN 'Jovem (Até 29 anos)'::text
            WHEN idade >= 30 AND idade <= 37 THEN 'Adulto (30 a 37 anos)'::text
            WHEN idade >= 38 THEN 'Alerta Vermelho (38+ anos)'::text
            ELSE NULL::text
        END AS segmento_idade,
    ind_var5 + ind_var30 + ind_var8_0 AS score_engajamento,
    var36 AS taxa_oculta_var36,
    imp_op_var39_efect_ult1 AS volume_financeiro_operacional
   FROM tb_santander_churn;