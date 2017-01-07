(train.con <- train.kknn(total_cases~., data = training,
kmax = 25, kernel = c("rectangular", "triangular", "epanechnikov",
"gaussian", "rank", "optimal")))


prediction<-predict(train.con,test)
prediction<-data.frame(prediction)

test1<-dat_test["city"]
test2<-cbind(test1,dat_test["weekofyear"],dat_test["year"])
test2<-cbind(test2,round(prediction["prediction"]))
write.csv(test2, file = "F:\\Data driven competitions\\predict_dengue\\predictions_1fold.csv", fileEncoding = "UTF-16LE")




