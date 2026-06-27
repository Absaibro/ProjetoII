
/*
=========================================================
Projeto: Predição de Evasão Acadêmica utilizando Machine Learning

Descrição:
Consultas utilizadas para validar a distribuição dos dados,
indicadores de frequência e informações financeiras antes
da consolidação da base analítica.

Objetivo:
Garantir a consistência das informações utilizadas no
modelo preditivo.

=========================================================
*/

SELECT
    CASE
        WHEN HISTORICO_SITUACAO_ALUNO IN (
            'EVADIDO',
            'DESISTENTE',
            'CANCELAMENTO'
        )
        THEN 'EVASAO'

        WHEN HISTORICO_SITUACAO_ALUNO IN (
            'Formado.',
            'Formando.',
            'Matriculado.',
            'Matricula'
        )
        THEN 'PERMANENCIA'

        ELSE 'IGNORAR'
    END AS CLASSIFICACAO,

    COUNT(DISTINCT CODIGO_ALUNO) AS QTD

FROM F_Academico

GROUP BY
    CASE
        WHEN HISTORICO_SITUACAO_ALUNO IN (
            'EVADIDO',
            'DESISTENTE',
            'CANCELAMENTO'
        )
        THEN 'EVASAO'

        WHEN HISTORICO_SITUACAO_ALUNO IN (
            'Formado.',
            'Formando.',
            'Matriculado.',
            'Matricula'
        )
        THEN 'PERMANENCIA'

        ELSE 'IGNORAR'
    END

	SELECT
    IndicadorPresenca,
    COUNT(*)
FROM F_DiarioClasse
GROUP BY IndicadorPresenca


SELECT
    RESULTADO,
    COUNT(*)
FROM F_Academico_Disciplinas
GROUP BY RESULTADO
ORDER BY 2 DESC

SELECT
    SITUACAO_PARCELA,
    COUNT(*)
FROM F_Financeiro
GROUP BY SITUACAO_PARCELA

SELECT
    COUNT(*) Total,
    SUM(CASE WHEN INAD_SALDODEVIDO > 0 THEN 1 ELSE 0 END) ComDivida
FROM F_Financeiro