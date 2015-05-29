library("neuralnet")
library(hydroGOF)

#ler dataset de treino
dataset<-read.csv("C:\\Users\\Patrícia\\Desktop\\LEI 3.2\\SRCR\\srcr\\Exercicio3\\exercicio3b.csv")

#criar novo dataset para segunda alínea
dataset2<-dataset
#criar novo dataset para a segunda alínea
dataset3<-dataset

#transformar valores de fadiga em 0 ou 1
dataset2$FatigueLevel[dataset2$FatigueLevel <= 3] <- 0
dataset2$FatigueLevel[dataset2$FatigueLevel > 3] <- 1

#transformar valor de fadiga numa escala de 1 a 3
dataset3$FatigueLevel[dataset3$FatigueLevel == 1] <- 1
dataset3$FatigueLevel[dataset3$FatigueLevel == 2] <- 2
dataset3$FatigueLevel[dataset3$FatigueLevel == 3] <- 3
dataset3$FatigueLevel[dataset3$FatigueLevel == 4] <- 4
dataset3$FatigueLevel[dataset3$FatigueLevel == 5] <- 4
dataset3$FatigueLevel[dataset3$FatigueLevel == 6] <- 4
dataset3$FatigueLevel[dataset3$FatigueLevel == 7] <- 4

#dados de treino
trainset<-dataset[1:600,]
trainset2<-dataset2[1:600,]
trainset3<-dataset3[1:600,]

#dados de teste
testset<-dataset[601:844,]
testset2<-dataset2[601:844,]
testset3<-dataset3[601:844,]

# treinar rede neuronal 
fatiguenet <- neuralnet(FatigueLevel~+Performance.ADMSLMean+Performance.DMSMean+Performance.DDCMean+Performance.TBCMean+Performance.MVMean, trainset, hidden = c(10,5), threshold = 0.1, algorithm='rprop+')
fatiguenet2 <- neuralnet(FatigueLevel~Performance.ADMSLMean+Performance.DMSMean+Performance.DDCMean+Performance.TBCMean+Performance.MVMean, trainset2, hidden = c(5,3), threshold = 0.1)
fatiguenet3 <- neuralnet(FatigueLevel~+Performance.ADMSLMean+Performance.DMSMean+Performance.DDCMean+Performance.TBCMean+Performance.MVMean, trainset3, hidden = c(8,5), threshold = 0.1, algorithm='rprop+')

# imprimir resultados
print(fatiguenet)
print(fatiguenet2)
print(fatiguenet3)

#desenhar rede neuronal
plot(fatiguenet)
plot(fatiguenet2)
plot(fatiguenet3)

#variaveis utilizadas para testar
vartest <- subset(testset, select = c("Performance.ADMSLMean","Performance.DMSMean","Performance.DDCMean","Performance.TBCMean","Performance.MVMean"))
vartest2 <- subset(testset2, select = c("Performance.ADMSLMean","Performance.DMSMean","Performance.DDCMean","Performance.TBCMean","Performance.MVMean"))
vartest3 <- subset(testset3, select = c("Performance.ADMSLMean","Performance.DMSMean","Performance.DDCMean","Performance.TBCMean","Performance.MVMean"))

#resultados do teste
fatiguenet.results <- compute(fatiguenet, vartest) 
fatiguenet2.results <- compute(fatiguenet2, vartest2) 
fatiguenet3.results <- compute(fatiguenet3, vartest3) 

#cria uma tabela com os dados de treino e os de teste
resultado <- data.frame(OutputEsperado = testset$FatigueLevel, Output = fatiguenet.results$net.result)
resultado2 <- data.frame(OutputEsperado = testset2$FatigueLevel, Output = fatiguenet2.results$net.result)
resultado3 <- data.frame(OutputEsperado = testset3$FatigueLevel, Output = fatiguenet3.results$net.result)

#arredondar valor
resultado$Output <- round(resultado$Output,3)
resultado2$Output <- round(resultado2$Output,3)

#calcular desvio padrao do erro entre a previsao e o observado
rmse(c(testset$FatigueLevel),c(resultado$Output))
rmse(c(testset2$FatigueLevel),c(resultado2$Output))
rmse(c(testset3$FatigueLevel),c(resultado3$Output))



