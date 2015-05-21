library("neuralnet")
library(hydroGOF)

#ler dataset de treino
dataset<-read.csv("C:\\Users\\Patrícia\\Desktop\\LEI 3.2\\SRCR\\srcr\\Exercicio3\\exercicio3.csv")

#criar novo dataset para segunda alínea
dataset2<-dataset

#transformar valores de fadiga em 0 ou 1

dataset2$FatigueLevel[dataset2$FatigueLevel <= 3] <- 0
dataset2$FatigueLevel[dataset2$FatigueLevel > 3] <- 1

#dados de treino
trainset<-dataset[1:600,]
trainset2<-dataset2[1:600,]

#dados de teste
testset<-dataset[601:844,]
testset2<-dataset2[601:844,]

# treinar rede neuronal chamada "infertnet" com 5 nodos intermédios
fatiguenet <- neuralnet(FatigueLevel~Performance.DMSMean+Performance.DDCMean+Performance.TBCMean+Performance.MVMean, trainset, hidden = c(20,15), threshold = 0.1, algorithm='rprop+')
fatiguenet2 <- neuralnet(FatigueLevel~Performance.KDTMean+Performance.MAMean+Performance.MVMean+Performance.TBCMean+Performance.DDCMean+Performance.DMSMean+Performance.AEDMean+Performance.ADMSLMean, trainset2, hidden = c(15,10), threshold = 0.1)

# imprimir resultados
print(fatiguenet)
print(fatiguenet2)

#desenhar rede neuronal
plot(fatiguenet)
plot(fatiguenet2)

#variaveis utilizadas para testar
vartest <- subset(testset, select = c("Performance.DMSMean","Performance.DDCMean","Performance.TBCMean","Performance.MVMean"))
vartest2 <- subset(testset2, select = c("Performance.KDTMean","Performance.MAMean","Performance.MVMean","Performance.TBCMean","Performance.DDCMean","Performance.DMSMean","Performance.AEDMean","Performance.ADMSLMean"))

#resultados do teste
fatiguenet.results <- compute(fatiguenet, vartest) 
fatiguenet2.results <- compute(fatiguenet2, vartest2) 

#cria uma tabela com os dados de treino e os de teste
resultado <- data.frame(OutputEsperado = testset$FatigueLevel, Output = fatiguenet.results$net.result)
resultado2 <- data.frame(OutputEsperado = testset2$FatigueLevel, Output = fatiguenet2.results$net.result)

#arredondar valor
resultado$Output <- round(resultado$Output,0)
resultado2$Output <- round(resultado2$Output,0)

#calcular desvio padrao do erro entre a previsao e o observado
rmse(c(testset$FatigueLevel),c(resultado$Output))
rmse(c(testset2$FatigueLevel),c(resultado2$Output))

