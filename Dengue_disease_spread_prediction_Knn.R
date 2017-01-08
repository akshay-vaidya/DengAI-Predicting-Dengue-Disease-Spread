dat = read.csv("dengue_features_train.csv", header = TRUE)
dat_labels = read.csv("dengue_labels_train.csv", header = TRUE)
dat_test =read.csv("dengue_features_test.csv", header = TRUE)
training_dat<- merge(dat,dat_labels,by=c("city","year","weekofyear"))
training <- training_dat[,5:dim(training_dat)[2]]
// training<- merge(dat,dat_labels,by=c("city","year","weekofyear"))[,-(1:4)]

test<- dat_test[,-(1:4)]

// handling missing values in the test data - replace mean for missing values
for (i in 1:dim(test)[2]) {
	means=colMeans(test[i],na.rm=TRUE)
	test[i][is.na(test[i])]= means }

for (i in 1:dim(training)[2]) {
means=colMeans(training[i],na.rm=TRUE)
training[i][is.na(training[i])]= means }


deng_kknn <- kknn(total_cases~., training, test, distance = 1, na.action=na.pass, kernel = "triangular")
fit <- fitted(deng_kknn)
fit<-data.frame(fit)

test1<-dat_test["city"]
test2<-cbind(test1,dat_test["weekofyear"],dat_test["year"])

test2<-cbind(test2,round(fit["fit"]))

write.csv(test2, file = "F:\\Data driven competitions\\predict_dengue\\predictions.csv", fileEncoding = "UTF-16LE")



for (i in 1:dim(training)[2]) {
	means=colMeans(training[i],na.rm=TRUE)
	training[i][is.na(training[i])]= means }