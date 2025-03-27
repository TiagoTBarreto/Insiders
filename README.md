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
- Estatística (Descritiva, Teste de Hipóteses e Intervalo de Confiança)

**Biblioteca de Machine Learning e Otimização:**
- Scikit-learn: Empregado para a preparação de dados, treinamento de modelos, avaliação de desempenho.
- Scipy: Implementação de algoritmos de Clusterização.
- Tensorflow: Implementação de Rede Neural para Time Series.

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


# 5. Redução de Dimensionalidade com Espaços de Embedding
## 5.1 PCA
![image](https://github.com/TiagoTBarreto/Insiders/assets/137197787/cd006cb1-fd38-4756-a483-a49aacf8009b)

## 5.2 t-SNE
![image](https://github.com/TiagoTBarreto/Insiders/assets/137197787/2f00501e-9e83-4091-bffc-3a6d0bd3be0d)

## 5.3 UMAP
![image](https://github.com/TiagoTBarreto/Insiders/assets/137197787/6341a3a4-43d6-40e5-ab67-525b62a2c6ea)

## 5.4 Tree-Based-Embedding
### 5.4.1 Feature Selection
Uma Random Forest composta por 250 árvores foi treinada e apenas as features que demonstraram mais de 1% de importância na separação das folhas foram selecionadas.
### 5.4.2 Treino
Posteriormente, o modelo foi novamente treinado utilizando a mesma Random Forest de 250 árvores, porém agora empregando apenas as features selecionadas. Em seguida, foi aplicado o comando "apply" para gerar 250 features adicionais, baseadas nas folhas das árvores.
### 5.4.3 Redução de Dimensionalidade
O algoritmo UMAP foi empregado para reduzir a dimensionalidade das 250 features obtidas anteriormente. Após testar diversos valores, a redução que resultou em uma melhor separação dos dados e um aumento na métrica foi de 250 para 10 dimensões. A imagem a seguir representa a combinação de duas dessas 10 dimensões.

![image](https://github.com/TiagoTBarreto/Insiders/assets/137197787/ff86467a-12d6-4d1a-be3d-3825716b93f7)
### 5.5 Escolha do Espaço
Nas imagens é possível observar claramente como o método Tree-Based-Embedding, combinando Random Forest + UMAP proporcionou uma organização mais eficiente dos dados em comparação com outras técnicas. Essa escolha foi respaldada pela clara separação e estruturação dos clusters, evidenciando a eficácia dessa abordagem na redução da dimensionalidade e na representação dos dados.

# 6. Machine Learning
- KMeans
- Hierarchical-Clustering
- Gaussian Mixture Model
- DBSCAN

## 6.1 Treinamento
**A métrica utilizada para comparação dos modelos foi a Silhouette Score.**

![image](https://github.com/TiagoTBarreto/Insiders/assets/137197787/d3b15b8e-13f8-42a6-a5e0-d0c1ad51ddae)

![image](https://github.com/TiagoTBarreto/Insiders/assets/137197787/af4769ba-2475-4261-80a1-7c19cf296811)

## 6.2 Escolha do Modelo
Apesar de o melhor valor de Silhouette ter sido obtido com 14 clusters, optei por selecionar o valor de **10 clusters**. Essa decisão foi tomada para facilitar a ação do time de negócio, reduzindo o número de grupos em 4, enquanto a métrica de Silhouette apresentou uma redução mínima.

Embora o DBSCAN tenha mostrado melhorias em alguns casos com 10 clusters, ele se revelou inconsistente durante os testes. Isso se deve, em parte, à complexidade dos ajustes necessários para seus parâmetros, como o epsilon e o número mínimo de pontos. Por outro lado, o H-Clustering é mais simples, exigindo apenas um parâmetro para ajuste, então optei por prosseguir com o **Hierarchical-Clustering**.

## 6.3 Análise do Modelo Final
### 6.3.1 Análise de Silhoueta
Podemos observar que, apesar de alguns clusters apresentarem um formato de "faca", indicando uma proximidade entre eles, a maioria dos clusters ainda obteve uma boa pontuação de silhueta. 

![image](https://github.com/TiagoTBarreto/Insiders/assets/137197787/1f6a53e7-edb1-4aa5-9f7d-18a11a67b9ae)

### 6.3.2 Espaço de Dados
Ao utilizar as mesmas dimensões selecionadas para comparação anterior do Espaço de Embedding, é possível observar uma excelente separação dos clusters.

![image](https://github.com/TiagoTBarreto/Insiders/assets/137197787/62b9522e-7357-43dc-9b26-9b4e94d0ff08)

# 7. Relatório
## 1- Quantos clientes farão parte do grupo?
O grupo Insiders será composto por 291 clientes, que correspondem a 9.81% do total.
## 2- Quais as principais características desses clientes?
### 2.1- Na média:
- Receita: $14,985
- Última Compra: 21 dias atrás
- Itens Comprados: 9,055
- Ordens de Retorno: 4
- Ticket Médio: $775
### 2.2- Na mediana:
- Receita: $6,924
- Última Compra: 9 dias atrás
- Itens Comprados: 4428
- Ordens de Retorno: 3
- Ticket Médio: $494.58
## 3- Qual a % de contribuição do faturamento, vinda do Insiders?
O Insiders representa 54.85% do faturamento total e 56.33% do volume de itens comprados na empresa.
## 4- Quais as condições para uma pessoa ser elegível ou remevida do Insiders?
Com a utilização do Espaço de Embedding, a explicabilidade do modelo é comprometida, tornando-se mais desafiador identificar as condições específicas para a elegibilidade ou não elegibilidade ao grupo Insiders. 
## 5- Qual a garantia que o programa Insiders é melhor que o restante da base?
### 5.1 Definição do tipo de Teste Estatístico
Após verificar a distribuição das variáveis utilizando o teste de Shapiro, constatei que nenhuma delas apresentava distribuição normal. Diante disso, optei por utilizar o teste de Mann-Whitney U para comparar o grupo de Insiders com o segundo melhor grupo, Top Consumers.
#### 5.1.2 Métrica Receita:
**Resultados do Teste de Mann-Whitney U:**

- Estatística Mann-Whitney U: 43987.0
- Valor p: 1.52e-39 (p < 0.05)
- Interpretação: O valor-p extremamente baixo indica evidências fortes para rejeitar a hipótese nula de que as duas amostras vêm da mesma distribuição, sugerindo que há diferenças estatisticamente significativas entre os grupos.
  
**Intervalos de Confiança:**
- Com 95% de confiança, a média de insiders está entre 11599.73 e 18370.56.
- Com 95% de confiança, a média de top consumers está entre 3693.69 e 4110.26.
  
#### 5.1.1 Métrica Ticket Médio:
**Resultados do Teste de Mann-Whitney U:**

- Estatística Mann-Whitney U: 31261.0
- Valor p: 3.81e-05 (p < 0.05)
- Interpretação: O valor-p extremamente baixo indica evidências fortes para rejeitar a hipótese nula de que as duas amostras vêm da mesma distribuição, sugerindo que há diferenças estatisticamente significativas entre os grupos.
  
**Intervalos de Confiança:**
- Com 95% de confiança, a média de insiders está entre 739.98 e 957.97.
- Com 95% de confiança, a média de top consumers está entre 493.68 e 621.43.

#### 5.1.3 Métrica Dias da Última Compra:
**Resultados do Teste de Mann-Whitney U:**

- Estatística Mann-Whitney U: 20638.0
- Valor p: 6.03e-04 (p < 0.05)
- Interpretação: O valor-p extremamente baixo indica evidências fortes para rejeitar a hipótese nula de que as duas amostras vêm da mesma distribuição, sugerindo que há diferenças estatisticamente significativas entre os grupos.
  
**Intervalos de Confiança:**
- Com 95% de confiança, a média de insiders está entre 16.70 e 25.56.
- Com 95% de confiança, a média de top consumers está entre 21.99 e 32.27.
  
  
## 6- Qual a perspectiva de faturamento do grupo?
### Após explorar várias abordagens para prever séries temporais, incluindo modelos como ARIMA, SARIMA e até mesmo técnicas de AutoML, enfrentei desafios significativos na redução do erro médio. Apesar disso, um modelo de rede neural de 7 camadas destacou-se como o mais promissor.

Com um conjunto de dados de um ano, onde reservei 11 meses para treinamento e validação e 1 mês para testes, os resultados foram os seguintes:

- Soma das previsões no 1º mês de teste: $460,855.1
- Soma dos valores reais no 1º mês de teste: $525,803.19
- Diferença percentual entre previsão e valor real: 12.35% menor que o valor real.

Enfrentei uma grande dificuldade em reduzir o erro médio individual, então optei por focar na minimização do erro total acumulado. Com isso, determinei um intervalo de faturamento para o próximo mês proveniente dos Insiders, levando em consideração o erro observado:

- Previsão de faturamento para o próximo mês: $521,493.0
- Intervalo: Entre $457,077.30 e $585,908.69.

# 8. O produto final do projeto
Montei uma infraestrutura utilizando serviços AWS:
![infra](https://github.com/TiagoTBarreto/Insiders/assets/137197787/eeb89d1c-9e56-4d65-a376-473f823e2f2f)
### 8.1 Armazenamento de Artefatos e Dados:
- O notebook salva os artefatos, como o modelo treinado, transformações no Amazon S3.
- Os conjuntos de dados também são armazenados no Amazon S3 para fácil acesso.

### 8.2 Controle de Versão e Colaboração:
- O código do projeto é mantido no GitHub, garantindo controle de versão, colaboração eficiente e rastreabilidade das alterações ao longo do tempo.

### 8.3 Processamento Automatizado na EC2:
- Uma instância EC2 é configurada para clonar o repositório do GitHub contendo o notebook.
- Um Cronjob scheduler é usado para automatizar a execução periódica do notebook na instância EC2.
### 8.4 Integração de Dados e Resultados:
- A instância EC2 lê os conjuntos de dados do Amazon S3 durante a execução do notebook.
- Os resultados finais, como métricas de desempenho do modelo ou resultados analíticos, são armazenados no Banco de Dados Postgres.
### 8.5 Papermill para Rastreabilidade:
- Utilizei o Papermill para executar o notebook de forma programática e guardar as execuções como registros.
- O Papermill gera uma cópia do notebook após cada execução, permitindo acompanhar as iterações e revisar os resultados anteriores conforme necessário.
### 8.6 Alimentação do Dashboard:
- O Banco de Dados Postgres sustenta um Dashboard, fornecendo informações atualizadas e insights em tempo real para os usuários.


| Mês          | Reajuste Tok | Reajuste Setor |
|--------------|:--------------:|:----------------:|
| Janeiro/Fev. |  0,22%       |  0,34%         |

<table>
  <thead style="background-color: #D3D3D3;">
    <tr>
      <th>Mês</th>
      <th>Reajuste Tok</th>
      <th>Reajuste Setor</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Janeiro/Fev.</td>
      <td>0,22%</td>
      <td>0,34%</td>
    </tr>
  </tbody>
</table>

| Categoria               | Modelos Selecionados | Share Impactado | Variações de Modelos |
|-------------------------|:---------------------:|:---------------:|:--------------------:|
| Fornecedores Nacionais  |          36           |      5,13%      |         155          |
| Importados              |          10           |      1,98%      |         57           |
| **Total**               |          **46**       |    **7,11%**    |      **212**         |


| **Prazo de Pagamento**         |  **Hoje**  | **Expectativa** | **Expectativa Aumento Absoluto** | **Expectativa Aumento Percentual** |
|------------------------------|:----------:|:---------------:|:--------------------:|:----------------------:|
| **Prazo Ponderado Toky**       |   96,00    |      112,49     |         16,49        |        17,18%          |
| **Prazo Ponderado Mobly**      |   91,81    |      119,22     |         27,41        |        29,86%          |
| **Prazo Ponderado Tok**        |   97,72    |      109,72     |         12,00        |        12,28%          |

| **Linha**             | **Número de Produtos** | **Share T&S** | **Média Ganho COGS** | **Ganho COGS TT** |
|-----------------------|:----------------------:|:-------------:|:--------------------:|:-----------------:|
| **MUY**               | 2                      | 1.02%         | 13%                  | 0.12%             |
| **LAW**               | 1                      | 0.62%         | 23%                  | 0.14%             |
| **SOFO**              | 6                      | 1.63%         | 18%                  | 0.19%             |
| **Total**             | **9**                  | **2.67%**     | **17%**              | **0.43%**         |


| Categoria                     |   Jan   |   Fev   |   Mar   |   Abril   |   Maio   |   Jun   |   Jul   |   Ago   |   Set   |   Out   |   Nov   |   Dez   |  2025   |
|--------------------------------|:-------:|:-------:|:-------:|:-------:|:-------:|:-------:|:-------:|:-------:|:-------:|:-------:|:-------:|:-------:|:---------:|
| **T&S (Total)**               | 32.82M  | 32.03M  | 32.03M  | 28.26M  | 28.48M  | 29.32M  | 31.95M  | 37.36M  | 29.82M  | 29.25M  | 42.40M  | 37.07M  | 390.79M   |
| **Ganhos Representante**       |    0    |  1.70K  |  3.39K  | 10.03K  | 17.20K  | 17.71K  | 18.47K  | 20.13K  | 23.54K  | 18.79K  | 18.43K  | 26.71K  | 176.10K   |
| **Ganhos Redução de Custo**    |    0    |    0    |    0    |    0    | 563.52K | 580.09K | 632.07K | 863.30K | 689.06K | 675.88K | 979.64K | 856.49K | 5.84M     |
| **Top 1000 Substituições**     |    0    |    0    |    0    |    0    |    0    |    0    | 42.77K  | 50.02K  | 75.71K  | 215.95K | 313.01K | 273.66K | 971.12K   |
| **Ganhos FOB**                 |    0    |    0    |    0    |    0    | 883.83K | 883.83K | 883.83K | 883.83K | 1.46M   | 1.46M   | 1.46M   | 1.46M   | 9.38M     |
| **Ganhos Tok Total**           |    0    |  1.70K  |  3.39K  | 10.03K  | 1.46M   | 1.48M   | 1.58M   | 1.82M   | 2.25M   | 2.37M   | 2.77M   | 2.62M   | 16.37M    |
| **Margem de Ganho**                    |  0.00%  |  0.01%  |  0.01%  |  0.04%  |  5.14%  |  5.05%  |  4.94%  |  4.86%  |  7.54%  |  8.11%  |  6.54%  |  7.06%  |  4.19%    |



