for (i in 1:dim(training)[2]) {
means=colMeans(training[i],na.rm=TRUE)
training[i][is.na(training[i])]= means }

correlationMatrix <- cor(training)
highlyCorrelated <- findCorrelation(correlationMatrix, cutoff=0.5)
v<-data.frame(highlyCorrelated)
newdata <- v[order(highlyCorrelated),]
training<- training[,newdata]

training_features1<- training[,newdata]
training_features=cbind(training_features1,training["total_cases"])

test_features<- test[,newdata]

(train.con <- train.kknn(total_cases~., data = training_features,
kmax = 25, kernel = c("rectangular", "triangular", "epanechnikov",
"gaussian", "rank", "optimal")))


prediction<-predict(train.con,test_features)
prediction<-data.frame(prediction)

test1<-dat_test["city"]
test2<-cbind(test1,dat_test["weekofyear"],dat_test["year"])
test2<-cbind(test2,round(prediction["prediction"]))
write.csv(test2, file = "F:\\Data driven competitions\\predict_dengue\\predictions_feature_Sel.csv", fileEncoding = "UTF-16LE")







