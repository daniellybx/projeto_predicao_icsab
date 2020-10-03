# projeto_tcc_pucmg

## 1. Introdução

### 1.1. Contextualização

A Atenção Básica em Saúde (ABS) é definida como um conjunto de ações de caráter individual e coletivo, que representam o primeiro nível de atenção dos sistemas de saúde, voltados para a promoção da saúde, prevenção de agravos, tratamento e reabilitação. Isso significa que a ABS compõe um conjunto de serviços de saúde que pouco dependem de tecnologias duras e que tem foco na integralidade do cuidado, com abordagem biopsicossocial e familiar dos usuários do Sistema Único de Saúde (SUS) (Paim, 2006).

O conceito de Atenção Básica em Saúde, utilizado pelas políticas públicas propostas pelo Ministério da Saúde, tem origem em uma discussão internacional sobre a Atenção Primária em Saúde (APS), internacionalmente chamada de Primary health care. Nesse contexto, a ABS possui os mesmos atributos propostos para a APS, o que inclui a atenção no primeiro contato, longitudinalidade, integralidade e coordenação. Além disso, são considerados dois atributos derivados: a competência cultural e a orientação familiar e comunitária (Oliveira e Pereira, 2013; Starfield, 2002).

No Brasil, a Política de Atenção Básica (PNAB) define os princípios e diretrizes da ABS. Os princípios e diretrizes são orientadores da implementação de estratégias de ABS nos estados e municípios brasileiros. Entre os princípios são dispotos:

•	Universalidade: permitir o acesso ao sistema de saúde para todos os cidadãos residentes no país;

•	Equidade: ofertar o cuidado reconhecendo as diferenças de condições de vida das populações, considerando a diversidade; e

•	Integralidade: ofertar serviços em todas as fases do desenvolvimento humano no âmbito da promoção e manutenção da saúde, da prevenção de doenças e agravos, da cura, da reabilitação, redução de danos e dos cuidados paliativos.
Para as diretrizes, são considerados: a regionalização e hierarquização; a territorialização e adstrição; a população adscrita; o cuidado centrado na pessoa, a resolutividade; a longitudinalidade do cuidado; o coordenar do cuidado; e a participação da comunidade (Brasil, 2017).

Nesse contexto, a estratégia principal de implementação da ABS é a Estratégia Saúde na Família (ESF). A ESF é uma parte das ações de saúde da ABS, considerando seus princípios e diretrizes, considerando uma estratégia de reorganização do serviço. A ESF se traduz pela formação de equipes de atenção básica e podem ser compostas de diferentes formas a depender do contexto local. A principal forma de equipe da ESF inclui um profissional médico, um enfermeiro, um técnico de enfermagem, entre três e cinco agentes comunitários de saúde (ACS), um dentista e um ou dois técnicos de saúde bucal (Brasil, 2017; Garuzi e Rocha, 2014).

O dimensionamento de equipes ESF é definido pela PNAB e considera que cada equipe pode atender um território com população adscrita que contenha entre 2000 e 3500 pessoas, sendo que cada ACS pode ser responsável por até 750 pessoas (Brasil, 2017). 
Apesar dessa definição, a PNAB não define os critérios que podem ser utilizados para dimensionar equipes com maior ou menor quantidade de população adscrita, sendo responsabilidade dos municípios realizar seu dimensionamento. Em um cenário local, os gestores de ABS podem definir critérios baseados na equidade e universalidade para propor a divisão territorial de abrangência de cada ESF.

A Secretaria de Atenção Primária em Saúde do Ministério da Saúde, por meio do e-Gestor, disponibilizou a cobertura de ESF no país. Em cada um dos meses de 2020, a cobertura de ESF esteve em torno de 64%, sendo responsável pelo cuidado de aproximadamente 136 mil cidadãos brasileiros. Além disso, quando consideradas outras modalidades de  (Brasil, 2020). 

Um dos indicadores de serviço úteis na ABS é referente às Internações por Condições Sensíveis da Atenção Básica (ICSAB). ICSAB são um conjunto de agra-vos e enfermidades que são passíveis de cuidados na ABS e que podem evoluir para uma internação caso não recebem os devidos cuidados na fase precoce do cuidado. A lista brasileira, definida pela Portaria nº 221, de 17 de abril de 2008, in-clui 19 grupos de doenças e define que a incidência de internações por essas cau-sas pode servir de indicador para a qualidade Atenção Básica e Atenção Hospitalar (Brasil, 2008).

### 1.2. O problema proposto

Propor agrupamentos com base em indicadores epidemiológicos e socioeco-nômicos para os territórios, utilizando como unidade os municípios brasileiros, em que se possa definir o dimensionamento de equipes ESF, em que os territórios mais vulneráveis. Além disso, propor modelo de predição para taxas de internação por ICSAB para os municípios, utilizando variáveis sociais, econômicas e epidemiológi-cas. 

### Justificativa (Por quê?)

Há uma diversidade de conceitos quando se trata de vulnerabilidade na área da saúde, o que pode incluir uma variedade de variáveis dentro dos campos da epi-demiologia, sociologia, economia, geografia entre outros. Diante dessa diversidade, há dificuldade de mensurar a vulnerabilidade dos territórios. A PNAB define o nú-mero de equipes de Saúde na Família com base no tamanho populacional, sendo que cada equipe pode cobrir uma área com uma população entre 2000 e 3500 pes-soas, entretanto não define os critérios que permitem uma equipe possuir uma po-pulação adscrita menor ou maior. Nesse cenário, propõe-se o uso de análise de agrupamentos para identificação de territórios semelhantes, utilizando variáveis epidemiológicas, sociais e econômicas na classificação de vulnerabilidade territorial para o dimensionamento de equipes de saúde.

Além do dimensionamento de equipes, as ICSAB são indicadores de quali-dade do serviço de saúde, pois indicam que não houve acesso ou assistência para a população em um nível precoce ou preventivo, que é o preconizado pela política de saúde. A cobertura de Atenção Básica, seja por meio de ESF ou não, tem sido um dos fatores que diminuem as ICSAB nos territórios, entretanto nem sempre é suficiente para minimizar ou extinguir as internações. Diante disso, propõe-se um modelo linear, utilizando variáveis sociais, econômicas e epidemiológicas dos terri-tórios para identificar que fatores contribuem para o aumento das taxas de interna-ção por condições sensíveis à Atenção Básica, considerando o recorte territorial de municípios. 

###	Fontes de dados (Quem?)


Os dados utilizados virão de duas fontes principais, o Ministério da Saúde (MS), o Instituto de Pesquisa Econômica Aplicada (Ipea) e o Instituto Brasileiro de Geografia e Estatística (IBGE). 

#### Dados do Ministério da Saúde

-Sistema de Informação Hospitalar (SIH): refere-se aos dados de internações pagas pelo SUS em todas as unidades da federa-ção, desagregados por município e estabelecimento de saúde; e

-Sistema de Informação de Mortalidade (SIM): refere-se aos da-dos de óbitos em todo o Brasil, incluindo informações de local de ocorrência, local de registro, local de registro, causas e ou-tros dados sociais.

-Disponível, por meio do Departamento de Informática em Saúde do Sistema Único de Saúde (DATASUS), no endereço eletrôni-co: http://www2.datasus.gov.br.

#### Dados do Ipea

-Atlas do Desenvolvimento Humano no Brasil (Atlas BR): refere-se a informações dos municípios brasileiros em relação ao de-senvolvimento humano, incluindo renda, educação e expectati-va de vida entre outros.

-Disponível, por meio do Atlas Brasil, no endereço eletrônico: https://atlasbrasil.org.br.

#### Dados do IBGE

-Base cartográfica contínua municipal do Brasil: inclui dados gráficos e atributos de mapeamento georreferenciado dos municípios brasileiros. Disponível, por meio do IBGE, no endereço eletrônico: https://www.ibge.gov.br/geociencias/cartas-e-mapas/bases-cartograficas-continuas.html.

### Objetivo da análise (O que?)

O objetivo do projeto é propor agrupamentos com base em indicadores epidemiológicos e socioeconômicos para os territórios, utilizando como unidade os municípios brasileiros, em que se possa definir o dimensionamento de equipes ESF, em que os territórios mais vulneráveis contem com uma população adscrita menor quando comparados aos territórios menos vulneráveis. Além disso, se propõe um modelo linear preditivo para ICSAB, considerando variáveis de serviço de saú-de, sociais, demográficas e epidemiológicas.

### Aspectos geográficos (Onde?)

Todo o território brasileiro foi considerado na análise. Foram considerados recortes regionais, estaduais e municipais.

### Período analisado (Quando?)
O período considerado no estudo, inclui o ano de 2019. 
