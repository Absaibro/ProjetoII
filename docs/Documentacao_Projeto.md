# 🎓 Predição de Evasão Acadêmica utilizando Machine Learning

**Projeto de Desenvolvimento II**  
**Centro Universitário Senac-RS**

---

## 📖 1. Contexto

A evasão acadêmica representa um desafio relevante para instituições de ensino, pois pode impactar a trajetória dos estudantes, o planejamento das turmas, a alocação de recursos e a sustentabilidade institucional.

A identificação precoce de estudantes com maior probabilidade de evasão pode apoiar a criação de ações preventivas, como acompanhamento pedagógico, apoio financeiro, orientação acadêmica e contato institucional.

Neste projeto, foi utilizado como estudo de caso o Curso Superior de Tecnologia em Análise e Desenvolvimento de Sistemas — ADS, do Centro Universitário Senac-RS.

---

## ❓ 2. Problema

A instituição possui diferentes informações relacionadas à trajetória dos estudantes, como registros acadêmicos, dados financeiros e frequência.

Entretanto, essas informações encontram-se distribuídas em diferentes fontes e, isoladamente, não fornecem uma estimativa objetiva do risco de evasão.

Diante disso, o projeto busca responder à seguinte pergunta:

> É possível utilizar dados acadêmicos, financeiros e de frequência para identificar estudantes com maior probabilidade de evasão?

---

## 🎯 3. Objetivo geral

Desenvolver e validar um modelo de Machine Learning capaz de estimar a probabilidade de evasão acadêmica dos estudantes do curso de Análise e Desenvolvimento de Sistemas.

---

## ✅ 4. Objetivos específicos

- Consolidar dados acadêmicos, financeiros e de frequência;
- Construir uma base analítica para utilização em modelos de Machine Learning;
- Realizar a análise exploratória dos dados;
- Identificar valores ausentes, inconsistências e padrões relevantes;
- Preparar e transformar as variáveis utilizadas no modelo;
- Desenvolver e comparar modelos preditivos de classificação;
- Avaliar os modelos por meio de métricas de desempenho;
- Identificar as variáveis mais relevantes para a previsão da evasão;
- Persistir o modelo selecionado;
- Aplicar o modelo treinado em alunos ativos de forma anonimizada;
- Demonstrar como a solução pode apoiar ações institucionais preventivas.

---

## 🗃️ 5. Origem dos dados

Os dados utilizados pertencem ao Centro Universitário Senac-RS e correspondem ao Curso Superior de Tecnologia em Análise e Desenvolvimento de Sistemas.

As informações foram obtidas a partir de bases institucionais e organizadas em três grupos principais:

- dados acadêmicos;
- dados de frequência;
- dados financeiros.

A consolidação foi realizada em SQL Server, resultando em uma base analítica única para utilização nos notebooks Python.

Por questões de confidencialidade, os nomes internos das tabelas de origem e os identificadores pessoais dos estudantes não são apresentados na documentação pública.

---

## 🧩 6. Definição da evasão

A variável-alvo do projeto foi denominada `EVASAO`.

Sua classificação foi definida da seguinte forma:

```text
EVASAO = 1
Aluno classificado como evadido ou desistente.

EVASAO = 0
Aluno que permaneceu vinculado ao curso ou concluiu sua formação.