# Programa Insiders - Fidelização de Clientes
<p align="center">
  <img src="https://github.com/TiagoTBarreto/Insiders/assets/137197787/81928318-1718-4b29-b767-e163690e19f7" width="100%" height="300">
</p>

# 1. Problema de Negócio

Outlet Multimarcas é uma empresa de e-commerce que se destaca pela venda de produtos de segunda linha. Ao longo do tempo, observou-se um comportamento de compra distinto em uma minoria de clientes, que representa uma parte considerável do faturamento da empresa.

Diante desse insight, a empresa decidiu agir proativamente, buscando segmentar seus clientes com base nesses padrões de consumo. O objetivo é criar um programa de fidelidade, nomeado de "Insiders", para atender às necessidades específicas desses clientes mais engajados.

Essa segmentação mais refinada permitirá à empresa direcionar suas estratégias de marketing de forma mais precisa, personalizando as ofertas e experiências para diferentes grupos de clientes. Dessa forma, a Outlet Multimarcas espera fortalecer ainda mais o relacionamento com seus clientes de alto valor e impulsionar o crescimento do negócio.
## 1.1 Relatório respondendo as seguintes perguntas:
1. Quem são as pessoas elegíveis para participar do programa de Insiders?
2. Quantos clientes farão parte do grupo?
3. Quais as principais características desses clientes?
4. Qual a % de contribuição do faturamento, vinda do Insiders?
5. Quais as condições para uma pessoa ser elegível ao Insiders?
6. Quais as condições para uma pessoa ser removida do Insiders?
7. Qual a garantia que o programa Insiders é melhor que o restante da base?
8. Quais ações o time de marketing pode realizar para aumentar o faturamento?

# 2. Ferramentas Utilizadas

**Ferramentas para Análise de Dados**
- Python 3.11.4: A linguagem de programação principal usada para desenvolver o projeto.
- Estatística.

**Biblioteca de Machine Learning e Otimização:**
- Scikit-learn: Empregado para a preparação de dados, treinamento de modelos, avaliação de desempenho.
- Scipy: Implementação de algoritmos de Clusterização.

**Biblioteca de Avaliação Clusterização**
- Yellowbrick: utilizada na plotagem de gráficos de silhueta, juntamente com outras métricas relevantes, facilitando o processo de ajuste fino do modelo de clusterização.

**Espaços de Embedding**
- UMAP: Utilizado para redução de dimensionalidade e preservação de relações de proximidade.
- t-SNE: Empregado para visualização de padrões e clusters em espaços de alta dimensionalidade.
- PCA: Aplicado para redução de dimensionalidade e identificação de principais características.
- Tree-Based Embedding (Random Forest): Utilizado para representação de dados em um espaço de embedding baseado em árvores de decisão.

**Desenvolvimento e Controle de Versão:**
- Git: Ferramenta de versionamento de código para rastrear alterações e colaboração em equipe.
- Pyenv (Ambiente Virtual): Utilizado para isolar dependências e gerenciar versões do Python.

**Implantação e Exposição do Modelo:**
- Papermill: Automatiza a execução e personalização do Jupyter Notebook.
- Cronjob: Agenda tarefas para manter o modelo atualizado e em execução regularmente.
- Amazon S3: Armazenamento do conjuntos de dados, modelos e artefatos importantes de forma segura e escalável.
- Amazon RDS (Postgres): Banco de dados relacional onde foi guardado o output do modelo.
- Amazon EC2: Hospeda e executa a aplicação do modelo na nuvem.

**Habilidades e Abordagem:**
- Pensamento Crítico e Resolução de Problemas: Habilidades fundamentais aplicadas para analisar, solucionar problemas e tomar decisões ao longo do projeto.

# 3. Descrição dos Dados 
| Campo        | Descrição                                                                    |
|--------------|------------------------------------------------------------------------------|
| InvoiceNo    | Número de identificação único da compra.                                      |
| StockCode    | Código único do item no estoque.                                              |
| Description  | Descrição do item.                                                            |
| Quantity     | Quantidade do item.                                        |
| InvoiceDate  | Data da compra.                                                               |
| UnitPrice    | Preço unitário do item.                                                       |
| CustomerID   | Identificador único do cliente.                                               |
| Country      | País do cliente.                                                              |
 
# 4. Descrição da solução
Foi empregado o método de gerenciamento CRIPS-DM, que tem como objetivo o desenvolvimento de projetos de Data Science de forma cíclica. Esse método é abrangente e, ao concluir um ciclo, você obterá:
- Uma versão completa da solução.
- Maior rapidez na entrega de valor.
- Mapeamento de todos os possíveis problemas.

O CRIPS-DM é composto pelos seguintes passos: 
![image](https://github.com/TiagoTBarreto/Rossmann_Sales/assets/137197787/f4cac96f-a228-4e28-b5a2-eb16f29d5a39)

# 5. Relatório
## 1- Quantos clientes farão parte do grupo?
O grupo Insiders será composto por 291 clientes, que correspondem a 9.81% do total.
## 2- Quais as principais características desses clientes?
Em média esses clientes gastam $14,985
## 3- Qual a % de contribuição do faturamento, vinda do Insiders?
O Insiders representa 54.85% do faturamento total da empresa.
## 4- Quais as condições para uma pessoa ser elegível ou remevida do Insiders?
Com a utilização do Espaço de Embedding, a explicabilidade do modelo é comprometida, tornando-se mais desafiador identificar as condições específicas para a elegibilidade ou não elegibilidade ao grupo Insiders. 
## 5- Qual a garantia que o programa Insiders é melhor que o restante da base?
### 5.1 Ao checar a distribuição das variáveis através do teste de shapiro nenhuma apresentava distribuição normal, então optei por utilizar o teste de Mann-Whitney U e comparar o Insiders com o segundo melhor grupo Top Consumers e obtive os seguintes resultados:
### 5.1.1 Métrica Receita:
**Resultados do Teste de Mann-Whitney U:**

- Estatística Mann-Whitney U: 43987.0
- Valor p: 1.52e-39 (p < 0.05)
- Interpretação: O valor-p extremamente baixo indica evidências fortes para rejeitar a hipótese nula de que as duas amostras vêm da mesma distribuição, sugerindo que há diferenças estatisticamente significativas entre os grupos.
  
**Intervalos de Confiança:**

- Intervalo de Confiança para a Média de Insiders: (11599.73, 18370.56)
- Interpretação: Com 95% de confiança, a média de insiders está entre 11599.73 e 18370.56.
- Intervalo de Confiança para a Média de Top Consumers: (3693.69, 4110.26)
- Interpretação: Com 95% de confiança, a média de top consumers está entre 3693.69 e 4110.26.
### 6- Quais ações o time de marketing pode realizar para aumentar o faturamento?
# 6. Redução de Dimensionalidade com Espaços de Embedding
## 6.1 PCA
![image](https://github.com/TiagoTBarreto/Insiders/assets/137197787/cd006cb1-fd38-4756-a483-a49aacf8009b)

## 6.2 t-SNE
![image](https://github.com/TiagoTBarreto/Insiders/assets/137197787/2f00501e-9e83-4091-bffc-3a6d0bd3be0d)

## 6.3 UMAP
![image](https://github.com/TiagoTBarreto/Insiders/assets/137197787/6341a3a4-43d6-40e5-ab67-525b62a2c6ea)

## 6.4 Tree-Based-Embedding
### 6.4.1 Feature Selection
Uma Random Forest composta por 250 árvores foi treinada e apenas as features que demonstraram mais de 1% de importância na separação das folhas foram selecionadas.
### 6.4.2 Treino
Posteriormente, o modelo foi novamente treinado utilizando a mesma Random Forest de 250 árvores, porém agora empregando apenas as features selecionadas. Em seguida, foi aplicado o comando "apply" para gerar 250 features adicionais, baseadas nas folhas das árvores.
### 6.4.3 Redução de Dimensionalidade
O algoritmo UMAP foi empregado para reduzir a dimensionalidade das 250 features obtidas anteriormente. Após testar diversos valores, a redução que resultou em uma melhor separação dos dados e um aumento na métrica foi de 250 para 10 dimensões. A imagem a seguir representa a combinação de duas dessas 10 dimensões.

![image](https://github.com/TiagoTBarreto/Insiders/assets/137197787/ff86467a-12d6-4d1a-be3d-3825716b93f7)
### 6.5 Escolha do Espaço
Nas imagens é possível observar claramente como o método Tree-Based-Embedding, combinando Random Forest + UMAP proporcionou uma organização mais eficiente dos dados em comparação com outras técnicas. Essa escolha foi respaldada pela clara separação e estruturação dos clusters, evidenciando a eficácia dessa abordagem na redução da dimensionalidade e na representação dos dados.

# 7. Machine Learning
- KMeans
- Hierarchical-Clustering
- Gaussian Mixture Model
- DBSCAN

## 7.1 Treinamento
**A métrica utilizada para comparação dos modelos foi a Silhouette Score.**

![image](https://github.com/TiagoTBarreto/Insiders/assets/137197787/d3b15b8e-13f8-42a6-a5e0-d0c1ad51ddae)

![image](https://github.com/TiagoTBarreto/Insiders/assets/137197787/af4769ba-2475-4261-80a1-7c19cf296811)

## 7.2 Escolha do Modelo
Apesar de o melhor valor de Silhouette ter sido obtido com 14 clusters, optei por selecionar o valor de **10 clusters**. Essa decisão foi tomada para facilitar a ação do time de negócio, reduzindo o número de grupos em 4, enquanto a métrica de Silhouette apresentou uma redução mínima.

Embora o DBSCAN tenha mostrado melhorias em alguns casos com 10 clusters, ele se revelou inconsistente durante os testes. Isso se deve, em parte, à complexidade dos ajustes necessários para seus parâmetros, como o epsilon e o número mínimo de pontos. Por outro lado, o H-Clustering é mais simples, exigindo apenas um parâmetro para ajuste, então optei por prosseguir com o **Hierarchical-Clustering**.

## 7.3 Análise do Modelo Final
### 7.3.1 Análise de Silhoueta
Podemos observar que, apesar de alguns clusters apresentarem um formato de "faca", indicando uma proximidade entre eles, a maioria dos clusters ainda obteve uma boa pontuação de silhueta. 

![image](https://github.com/TiagoTBarreto/Insiders/assets/137197787/1f6a53e7-edb1-4aa5-9f7d-18a11a67b9ae)

### 7.3.2 Espaço de Dados
Ao utilizar as mesmas dimensões selecionadas para comparação anterior do Espaço de Embedding, é possível observar uma excelente separação dos clusters.

![image](https://github.com/TiagoTBarreto/Insiders/assets/137197787/62b9522e-7357-43dc-9b26-9b4e94d0ff08)

# 7. Tradução e Interpretação
Considerando que a empresa esteja disposta a se comunicar com possíveis interessados e obtenha um lucro bruto de R$ 600,00 para cada cliente que adquira o seguro de veículo, mas também incorra um custo de R$ 50,00 a cada vez que entra em contato com um potencial cliente, podemos mensurar os seguintes planos de ação:

**Plano de Ação 1 - Entrar em contato somente com pessoas que não tem seguro de veículo.**
- Lucro ao entrar em contato com 68.595 clientes (54% da base): R$ 5.871.610,00
- Lucro ao entrar em contato com toda a base de clientes: R$ 2.842.391,00

Isso implica em um aumento de 2.06 vezes no lucro potencial se o plano for implementado em sua totalidade.

**Plano de Ação 2 - Entrar em contato somente com pessoas que tiveram incidentes com seus veículos.**
- Lucro ao entrar em contato com 63.835 clientes (50% da base): R$ 5.934.596,00
- Lucro ao entrar em contato com toda a base de clientes: R$ 2.842.391,00

Isso implica em um aumento de 2.09 vezes no lucro potencial se o plano for implementado em sua totalidade.

**Plano de Ação 3 - Utilizar o Modelo de Machine Learning para ranqueamento.**

O gráfico abaixo ilustra que, ao entrar em contato com os primeiros clientes da lista, a probabilidade de eles adquirirem o seguro é alta, resultando em lucros consideráveis. No entanto, à medida que a lista é explorada mais profundamente, a propensão a adquirir o seguro diminui, o que leva a uma redução na margem de lucro devido ao custo de contato.

![image](https://github.com/TiagoTBarreto/HealthInsurance-CrossSell/assets/137197787/d1b0f776-6601-4d19-9c8f-a8a4bbc9c3f7)

- Lucro ao entrar em contato com os primeiros 55.100 clientes (43% da base): R$ 6.056.576,00
- Lucro ao entrar em contato com toda a base de clientes: R$ 2.842.391,00
  
Isso implica em um aumento de 2.13 vezes no lucro potencial se o plano for implementado em sua totalidade.


# 8. O produto final do projeto
O produto final foi uma planilha do Google Sheets conectada com o modelo de Machine Learning em nuvem. Agora, essa planilha pode ser acessada de qualquer dispositivo compatível com o Google Sheets. 

No vídeo abaixo, apresento uma demonstração da planilha, destacando a funcionalidade de predição. Ao clicar em um botão, a planilha retorna uma lista ranqueada com os clientes mais propensos de adquirirem o seguro. Essa abordagem não apenas simplifica o processo, mas também oferece uma experiência intuitiva para usuários de diferentes dispositivos.

![Animação](https://github.com/TiagoTBarreto/HealthInsurance-CrossSell/assets/137197787/246de1c3-a38c-4919-894b-2fbcb5361c25)

# 9. Próximo passos
Ao embarcar em um segundo ciclo do CRISP-DM para aprimorar ainda mais este projeto, consideraria as seguintes abordagens:
- Expandir a coleta de dados e informações sobre os clientes para enriquecer ainda mais o conjunto de dados, possibilitando análises mais abrangentes e precisas.
- Explorar novos modelos de Machine Learning.
- Integração com o Excel: Levar a praticidade da predição aos usuários do Excel, integrando o sistema de predição diretamente na plataforma.
- Formulação de Novas Hipóteses: Desenvolver e testar novas hipóteses para gerar insights adicionais para o negócio.

