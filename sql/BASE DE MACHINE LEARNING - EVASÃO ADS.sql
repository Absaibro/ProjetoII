/*
=========================================================
Projeto: Predição de Evasão Acadêmica utilizando Machine Learning

Arquivo:
04_Base_Analitica.sql

Descrição:
Consulta responsável pela consolidação das informações
acadêmicas, financeiras e de frequência em uma única
base analítica.

A consulta gera uma linha por matrícula e cria as
variáveis utilizadas no treinamento dos modelos de
Machine Learning.

Curso analisado:
Curso Superior de Tecnologia em Análise e Desenvolvimento
de Sistemas (ADS)

Objetivo:
Gerar a base final para treinamento e avaliação dos
modelos preditivos de evasão acadêmica.

=========================================================
*/

WITH BASE_ACADEMICA AS
(
    SELECT

          MATRICULA
        , MAX(CODIGO_ALUNO) AS CODIGO_ALUNO
        , MAX(NOME_ALUNO) AS NOME_ALUNO

        , MAX(ID_CURSO) AS ID_CURSO
        , MAX(CODIGO_CURSO_PRODUTO) AS CODIGO_CURSO_PRODUTO
        , MAX(NOME_DOC_CURSO_PROTUTO) AS CURSO

        , MAX(TURMA) AS TURMA
        , MAX(TURNO) AS TURNO
        , MAX(MODALIDADE) AS MODALIDADE

        , MAX(DATA_MATRICULA) AS DATA_MATRICULA
        , MAX(DATA_SAIDA) AS DATA_SAIDA

        , MAX(HISTORICO_SITUACAO_ALUNO) AS HISTORICO_SITUACAO_ALUNO

        , CASE

            WHEN MAX(HISTORICO_SITUACAO_ALUNO)
                IN ('EVADIDO',
                    'DESISTENTE',
                    'CANCELAMENTO')

            THEN 1

            WHEN MAX(HISTORICO_SITUACAO_ALUNO)
                IN ('Formado.',
                    'Formando.',
                    'Matriculado.',
                    'Matricula')

            THEN 0

            ELSE NULL

          END AS EVASAO

    FROM SenacDW_Stg.dbo.F_Academico

    WHERE ID_CURSO='C1286'

    GROUP BY MATRICULA
),

BASE_FREQUENCIA AS
(

SELECT

      Matricula

    , COUNT(*) TotalAulas

    , SUM(
        CASE
            WHEN IndicadorPresenca='F'
            THEN 1
            ELSE 0
        END
      ) TotalFaltas

    , SUM(
        CASE
            WHEN IndicadorPresenca='FJ'
            THEN 1
            ELSE 0
        END
      ) TotalFaltasJustificadas

FROM SenacDW_Stg.dbo.F_DiarioClasse

GROUP BY Matricula

),

BASE_FINANCEIRO AS
(

SELECT

      MATRICULA

    , SUM(ISNULL(INAD_SALDODEVIDO,0)) SaldoDevedor

    , SUM(

        CASE

            WHEN SITUACAO_PARCELA LIKE 'PENDENTE%'
            THEN 1
            ELSE 0

        END

      ) ParcelasPendentes

    , MAX(

        CASE

            WHEN ISNULL(INAD_SALDODEVIDO,0)>0
            THEN 1
            ELSE 0

        END

      ) PossuiDivida

FROM SenacDW_Stg.dbo.F_Financeiro

WHERE ID_CURSO='C1286'

GROUP BY MATRICULA

)

SELECT

      A.MATRICULA
    , A.CODIGO_ALUNO
    , A.NOME_ALUNO

    , A.CURSO
    , A.TURMA
    , A.TURNO
    , A.MODALIDADE

    , A.DATA_MATRICULA
    , A.DATA_SAIDA

    , A.HISTORICO_SITUACAO_ALUNO
    , A.EVASAO

    , ISNULL(F.TotalAulas,0) TotalAulas

    , ISNULL(F.TotalFaltas,0) TotalFaltas

    , ISNULL(F.TotalFaltasJustificadas,0) TotalFaltasJustificadas

    , CAST(

        ISNULL(F.TotalFaltas,0)*100.0 /

        NULLIF(F.TotalAulas,0)

        AS DECIMAL(10,2)

      ) PercentualFaltas

    , ISNULL(FIN.SaldoDevedor,0) SaldoDevedor

    , ISNULL(FIN.ParcelasPendentes,0) ParcelasPendentes

    , ISNULL(FIN.PossuiDivida,0) PossuiDivida

FROM BASE_ACADEMICA A

LEFT JOIN BASE_FREQUENCIA F

ON A.MATRICULA=F.Matricula

LEFT JOIN BASE_FINANCEIRO FIN

ON A.MATRICULA=FIN.MATRICULA

WHERE A.EVASAO IS NOT NULL

ORDER BY A.MATRICULA;