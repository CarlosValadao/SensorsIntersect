# Modelagem e Avaliação de Qualidade de Cobertura de Barreira em RSVSF 🛰️📸

Este projeto detalha os resultados da **Iniciação Científica (2023-2024)** realizada por **Carlos Henrique de Oliveira Valadão** na **Universidade Estadual de Feira de Santana (UEFS)**. O trabalho concentra-se na otimização de Redes de Sensores Visuais Sem Fio (RSVSF) para monitoramento inteligent.

## 📌 Introdução
Diferente das redes tradicionais, as RSVSF possibilitam a coleta e transmissão de dados visuais e ondas do espectro eletromagnético, o que amplia a inteligência dos ambientes monitorados. A pesquisa focou na **cobertura de barreira**.

A eficácia dessas aplicações depende da **qualidade do monitoramento**, métrica que garante o alinhamento dos dados aos requisitos especificados. Essa qualidade é influenciada por fatores como o **Campo de Visão (CdV)** dos sensores, que foi o ponto central da modelagem desenvolvida.

## 🛠️ Metodologia
A metodologia foi estruturada em quatro etapas fundamentais para garantir o rigor científico e a precisão das simulações:

1.  **Revisão Bibliográfica Sistemática:** Levantamento do estado da arte sobre qualidade de monitoramento e cobertura de barreira em RSVSF para identificação de lacunas técnicas.
2.  **Modelagem Matemática:** Implementada para oferecer flexibilidade e agilidade, descrevendo cada câmera por parâmetros como **distância focal, ângulo de abertura, orientação e definição**, além de unidades de sensoriamento e blocos de monitorament.
4.  **Desenvolvimento de Métricas:** Estabelecimento de métricas quantitativas para avaliar a cobertura da barreira, considerando o perímetro, a densidade de sensores e a área total de interesse.
5.  **Implementação de Algoritmo:** Desenvolvimento em **MATLAB** do algoritmo final para a identificação e otimização das barreiras na rede modelad.

## 🚀 Funcionalidades do Algoritmo
O sistema executa o processamento por meio de etapas lógicas e matemáticas:
* **Adequação e Interseção:** O algoritmo determina o polígono interseção entre a Área de Monitoramento (MA) e os sensores, restringindo a área de cobertura (originalmente um triângulo isósceles) aos limites físicos da área de interesse.
* **Teoria dos Grafos:** Construção de um **Grafo de Interseção**, onde os sensores atuam como vértices e as arestas representam a sobreposição visual entre eles.
* **Análise de Qualidade (FoVs):** Classificação dos Blocos de Monitoramento (MB) em três níveis de qualidade (Alta, Média e Baixa) com base nos campos de visão (FoV).

## 📊 Principais Resultados
O autor implementou um sistema capaz de determinar, a partir do grafo de interseções, a **melhor barreira possível** em redes de tamanho variável. O algoritmo seleciona a trajetória que cobre a maior extensão com a melhor qualidade visual disponível, garantindo a restrição precisa dos sensores à área de monitoramento.

![no_pre_processed](https://github.com/user-attachments/assets/172f35da-edbe-4ccb-9624-98e622cea23b)

![pre_processed](https://github.com/user-attachments/assets/b9ba4a7c-56ce-4e6c-969e-4c2061feb83a)

![polygon](https://github.com/user-attachments/assets/f0d53f92-f922-4201-be51-67b355108abb)

![grafo](https://github.com/user-attachments/assets/88764309-789c-4664-8598-ebb03ca63090)

![mb](https://github.com/user-attachments/assets/bd414d5d-d458-4a05-8b6b-677054b86220)

---
**Autor:** [Carlos Henrique de Oliveira Valadão](https://www.linkedin.com/in/carlos-valadao-3b81531bb/)  
**Orientador:** [Thiago Cerqueira de Jesus](https://scholar.google.com.br/citations?hl=pt-BR&user=3psJAQoAAAAJ&view_op=list_works)
**Instituição:** [UEFS](https://uefs.br/)
