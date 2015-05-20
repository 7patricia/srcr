library("neuralnet")

#ler dataset de treino
dataset<-read.csv("C:\\Users\\Patrícia\\Desktop\\LEI 3.2\\SRCR\\srcr\\Exercicio3\\exercicio3.csv")

# treinar rede neuronal chamada "infertnet" com 5 nodos intermédios
fatiguenet <- neuralnet(FatigueLevel ~ Performance.ADMSLMean+Performance.AEDMean+Performance.DMSMean+Performance.DDCMean+Performance.TBCMean+Performance.MVMean+Performance.MAMean+Performance.KDTMean, dataset, hidden = c(3,4), threshold = 0.01)

# imprimir resultados
print(fatiguenet)

#desenhar rede neuronal
plot(fatiguenet)