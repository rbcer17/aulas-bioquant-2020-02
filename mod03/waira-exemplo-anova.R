################################# ANOVA ##################################### #ANALISE FISHERIANA 
#AVALIACAO DAS INTERACOES ENTRE MUITAS VARIAVEIS, COMPARA A MEDIA DE VARIAS  POPULACOES! 
#DEMOSTRA DE AS DIFERENCAS NAS AMOSTRAS SAO REAIS OU CASUAIS.  #EM SINTESE, QUER DEMOSTRAR A VARIANCIA DENTRO E ENTRE OS GRUPOS.  #MODELO LINEAR, VARIAVEL EXPLICANDO OUTRA VARIAVEL 
#RESIDUOS: AQUILO NAO EXPLICADO PELA VARIAVEL 
#TRES PRINCIPAIS PRESSUPOSTOS 
# 1. INDEPENDENCIA DAS AMOSTRAS 
# 2. HOMOCEDASTICIDADE (VARIANCIAS COMPARAVEIS, VARIANCIAS IGUAIS) # 3. DISTRIBUICAO NORMAL (TEST PARAMETRICO) 
#QUEREMOS SABER A RELACAO DE Y VARIANDO EM RELACAO A X 
#NOSSO PROBLEMA DE HOJE  
#ABUNDANCIA DE JACARES EM 3 TIPOS DE AMBIENTE 
#LAGOA ABERTA / LAGOA FECHADA / CANAL  
#FAZEMOS 15 OBSERVACOES POR AMBIENTE 
#DADOS:  
#LA = 13, 11, 14, 12, 12, 10, 10, 15, 10, 13, 11, 12, 11, 10, 14 
#LF = 9, 6, 9, 5, 8, 10, 11, 5, 8, 5, 11, 11, 8, 6 
#CA = 17, 15, 20, 19, 17, 23, 21, 18, 19, 21, 15, 15, 19, 15, 17 
lagoa_aberta<- c(13, 11, 14, 12, 12, 10, 10, 15, 10, 13, 11, 12, 11, 10, 14) lagoa_fechada<- c(9, 6, 9, 5, 8, 10, 11, 11, 5, 8, 5, 11, 11, 8, 6) 
canal<- c(17, 15, 20, 19, 17, 23, 21, 18, 19, 21, 15, 15, 19, 15, 17) 
#Para fazer uma anova, precisamos ter os dados organizados, iremos criar uma planilha. #Criar repeticao de nomes para fazer o data.frame 
la<-rep("lagoa.aberta", 15) #repeticao de lagoa aberta 15 vezes 
lf<-rep("lagoa.fechada", 15) 
ca<-rep("canal", 15) 
#Criar data.frame 
dtframe1<-data.frame(la, lagoa_aberta)  
dtframe2<-data.frame(lf, lagoa_fechada) 
dtframe3<-data.frame(ca, canal) 
#Mudar o titulo dos data.frame 
colnames(dtframe1)<-c("ambiente", "abundancia") 
colnames(dtframe2)<-c("ambiente", "abundancia") 
colnames(dtframe3)<-c("ambiente", "abundancia")
#Juncao de todas as tabelas 
dados<- rbind(dtframe1, dtframe2, dtframe3) 
dados 
##Analise de variancia 
??fitvariance #aov (Anova)  
test<- aov(abundancia~ambiente, dados)  
summary(test)  
#NOS ENTENDIMOS QUE EXISTE VARIACAO ENTRE OS AMBIENTES 
#OUTRA FORMA DE FAZER O MESMO ANOVA 
linear<-lm(abundancia~ambiente,data=dados) 
anova(linear) 
# 3 PRESSUPOSTOS 
#1. NORMALIDADE 
#Test de normalidade para compreender os residuos 
shapiro.test(resid(test))  
#2. HOMOCEDASTICIDADE 
#Homocedasticidade: Mesma variancia 
install.packages("lawstat") 
library(lawstat) 
levene.test(dados$abundancia, dados$ambiente) 
#Test de Tukey 
#EXISTE VARIACAO ENTRE OS AMBIENTES, MAS QUAIS QUE VARIAM? #PARA SABER ISSO, VERIFICAMOS QUAIS GRUPOS DIFEREM ENTRE SI. #OU SEJA, EM QUAIS PARES DE AMOSTRAS ACONTECEM AS DIFERENCIAS TukeyHSD(test)  
#TODOS OS VALORES DE LWR (LIMITE INFERIOR) POSITIVO SAO SIGNIFICATIVOS. # DIFF SIGNIFICA DIFERENCIA 
plot(test) 
boxplot(abundancia~ambiente, data=dados) 
plot(TukeyHSD(test)) 
###########################EXERCICIO SEMANA 5################## #BAIXE O BANCO DE DADOS DO PACOTE CRABS, UTILIZANDO O MESMO PACOTE. #ESTE BANCO DE DADOS TERA MEDIDAD MORFOLOGICAS DE CARANGEJO. #CALCULE: 1)VARIACAO DO LOBO FRONTAL EM RELACAO A ESPECIE E SEXO  #(SEXO+ESPECIES), 2) INTERACAO ENTRE ESPECIE E SEXO (ESPECIE:SEXO) E #APRESENTE O GRAFICO DE INTERACAO, 3) ANALISES EXPLORATORIAS COMO SER  #HOMOCEDASTICIDADE, LEVINI, ETC. 
#DICA! INSTALE O PACOTE MASS