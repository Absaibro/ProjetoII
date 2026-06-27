/*
=========================================================
Projeto: Predição de Evasão Acadêmica utilizando Machine Learning

Descrição:
Script responsável pela definição da variável alvo
(EVASAO), classificando os alunos em permanência,
evasão ou registros ignorados de acordo com o histórico
acadêmico.

Objetivo:
Criar a variável resposta utilizada no treinamento do
modelo de Machine Learning.

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