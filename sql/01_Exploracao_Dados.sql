
/*
=========================================================
Projeto: Predição de Evasão Acadêmica utilizando Machine Learning

Descrição:
Consultas utilizadas na etapa de exploração e entendimento
dos dados, permitindo identificar as situações acadêmicas,
quantidade de alunos e validar as principais informações da
base F_Academico.

Objetivo:
Compreender a estrutura dos dados antes da construção da
base analítica.

Autor(es):
Alexia Borges Saibro
Bárbara De Moraes Lindenmeyer


=========================================================
*/

SELECT
    HISTORICO_SITUACAO_ALUNO,
    COUNT(*)
FROM F_Academico
GROUP BY HISTORICO_SITUACAO_ALUNO
ORDER BY 2 DESC


SELECT DISTINCT HISTORICO_SITUACAO_ALUNO
FROM F_Academico

SELECT COUNT(DISTINCT CODIGO_ALUNO)
FROM F_Academico

SELECT
    HISTORICO_SITUACAO_ALUNO,
    COUNT(DISTINCT CODIGO_ALUNO)
FROM F_Academico
GROUP BY HISTORICO_SITUACAO_ALUNO