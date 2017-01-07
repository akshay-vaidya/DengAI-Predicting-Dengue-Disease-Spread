m <- dim(training)[1]
val <- sample(1:m, size = round(m/3), replace = FALSE,
prob = rep(1/m, m))
train <- training[-val,]
fix(val)
validation <- training[val,]

for (i in 1:dim(validation)[2]) {
means=colMeans(validation[i],na.rm=TRUE)
validation[i][is.na(validation[i])]= means }


deng_kknn <- kknn(total_cases~., train, validation, k=35,distance = 1, na.action=na.pass, kernel = "triangular")

fit <- fitted(deng_kknn)
fit<-data.frame(fit)

pred<-fit$fit
true<- validation$ total_cases

mae(true,pred)




