# Para a prática dessa semana usaremos os dados de detecção de pardais no pacote Rdistance
# Backstory: Você, e um estagiário (chamado Valdisnei) fizeram um transecto de linha para se detectar pardais
# em arvores, com o intuito de descobrir a abundância dele. Para isso Valdisnei montou uma tabela, na qual
# sigthdist é a distância do pardal do transecto e sightangle é o angulo de visão para detecta-lo 
# (relacionado à altura da arvore).
install.packages('Rdistance')
library('Rdistance')
data(sparrowDetectionData)

# Primeiro vamos corrigir o erro do Valdisney e renomear a coluna para distancia usando a função rename do pacote dplyr
install.packages('dplyr')
library('dplyr')
sparrowDetectionData = rename(sparrowDetectionData, 'distance' = 'sightdist')

# Agora é com vocês, calculem a densidade e a abundância observada e estimada para os grupos de pardal.

