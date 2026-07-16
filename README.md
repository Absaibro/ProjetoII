# 🎓 Predição de Evasão Acadêmica utilizando Machine Learning

**Projeto de Desenvolvimento II**  
**Centro Universitário Senac-RS**

---

# 📖 Sobre o projeto

Este projeto tem como objetivo desenvolver um modelo preditivo capaz de identificar alunos com maior risco de evasão acadêmica utilizando técnicas de Ciência de Dados e Machine Learning.

Como estudo de caso, foi utilizado o Curso Superior de Tecnologia em Análise e Desenvolvimento de Sistemas (ADS) do Centro Universitário Senac-RS.

A solução integra dados acadêmicos, financeiros e de frequência para construir uma base analítica capaz de prever a probabilidade de evasão e demonstrar sua aplicação em um cenário real, apoiando a tomada de decisão institucional.

---

# 🎯 Objetivos

- Consolidar dados acadêmicos, financeiros e de frequência;
- Construir uma base analítica para Machine Learning;
- Realizar a análise exploratória dos dados;
- Desenvolver e comparar modelos preditivos de classificação;
- Identificar as variáveis mais relevantes para previsão da evasão;
- Aplicar o modelo treinado em alunos ativos de forma anonimizada.

---

# 🛠 Tecnologias utilizadas

- SQL Server
- Python
- Pandas
- NumPy
- Scikit-Learn
- Joblib
- Google Colab
- GitHub
- Visual Studio Code

---

# 🤖 Modelos avaliados

Durante o desenvolvimento foram avaliados três algoritmos de classificação:

- Regressão Logística
- Árvore de Decisão
- Random Forest

Após comparação das métricas de desempenho, o modelo **Random Forest** apresentou os melhores resultados, sendo utilizado na aplicação prática do projeto.

---

# 📂 Estrutura do projeto

```
ProjetoII/
│
├── docs/
│   └── Documentacao_Projeto.md
│
├── sql/
│   ├── 01_Exploracao_Dados.sql
│   ├── 02_Base_Evasao.sql
│   ├── 02_Classificacao_Evasao.sql
│   ├── 03_Validacao_Dados.sql
│
├── notebooks/
│   ├── Projeto_Evasao_ADS_Final.ipynb
│   ├── Analise_Exploratoria_Treinamento_Modelos.ipynb
│   └── Aplicacao_Modelo.ipynb
│
└── README.md
```

---

# 📊 Fluxo do projeto

1. Extração dos dados em SQL Server;
2. Construção da base analítica;
3. Tratamento e engenharia dos dados;
4. Análise exploratória;
5. Treinamento dos modelos de Machine Learning;
6. Avaliação e comparação dos algoritmos;
7. Persistência do modelo treinado;
8. Aplicação prática do modelo em alunos ativos.

---

# 📈 Resultados

Foram comparados três algoritmos de classificação, sendo o **Random Forest** o modelo escolhido devido ao melhor desempenho obtido nas métricas de avaliação.

Na etapa final foi realizada uma aplicação prática utilizando alunos ativos, demonstrando como o modelo pode auxiliar na identificação precoce de estudantes com maior probabilidade de evasão.

---

# 📅 Status do projeto

| Etapa | Status |
|--------|--------|
| Definição do problema | ✅ Concluído |
| Levantamento das bases | ✅ Concluído |
| Engenharia de Dados | ✅ Concluído |
| Construção da Base Analítica | ✅ Concluído |
| Análise Exploratória | ✅ Concluído |
| Machine Learning | ✅ Concluído |
| Aplicação do Modelo | ✅ Concluído |
| Documentação Final | ✅ Concluído |

---

# 👥 Equipe

- Alexia Borges Saibro
- Bárbara de Moraes Lindenmeyer

---

# 📌 Observações

Os dados utilizados pertencem ao Centro Universitário Senac-RS.

Por questões de confidencialidade e em conformidade com a Lei Geral de Proteção de Dados (LGPD), os dados disponibilizados neste repositório foram anonimizados e não representam informações pessoais dos estudantes.

Este projeto possui finalidade exclusivamente acadêmica.
