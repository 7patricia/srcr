library("neuralnet")
library(hydroGOF)

#ler dataset de treino
dataset<-read.csv("C:\\Users\\Patrícia\\Desktop\\LEI 3.2\\SRCR\\srcr\\Exercicio3\\exercicio3.csv")

#dados de treino
trainset<-dataset[1:600,]

#dados de teste
testset<-dataset[601:844,]

# treinar rede neuronal chamada "infertnet" com 5 nodos intermédios
fatiguenet <- neuralnet(FatigueLevel~Performance.ADMSLMean+Performance.AEDMean+Performance.DMSMean+Performance.DDCMean+Performance.TBCMean+Performance.MVMean+Performance.MAMean+Performance.KDTMean, trainset, hidden = c(60,30), threshold = 0.00662, stepmax = 18014)

# imprimir resultados
print(fatiguenet)

#desenhar rede neuronal
plot(fatiguenet)

#variaveis utilizadas para testar
vartest <- subset(testset, select = c("Performance.KDTMean","Performance.MAMean","Performance.MVMean","Performance.TBCMean","Performance.DDCMean","Performance.DMSMean","Performance.AEDMean","Performance.ADMSLMean"))

#resultados do teste
fatiguenet.results <- compute(fatiguenet, vartest) 

#cria uma tabela com os dados de treino e os de teste
resultado <- data.frame(real = testset$FatigueLevel, previsao = fatiguenet.results$net.result)

#calcular desvio padrao do erro entre a previsao e o observado
rmse(c(testset$FatigueLevel),c(resultado$previsao))

