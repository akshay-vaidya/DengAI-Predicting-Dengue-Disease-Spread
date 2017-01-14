prin_train= subset(training,select= -c(total_cases))
prin_test= test
prin_comp <- prcomp(prin_train, scale. = T)
train.data <- data.frame(total_cases = training$total_cases, prin_comp$x)
train.data <- train.data[,1:11]
rpart.model <- rpart(total_cases ~ .,data = train.data, method = "anova")
test.data <- predict(prin_comp, newdata = pca.test)
test.data <- as.data.frame(test.data)
test.data <- test.data[,1:10]
rpart.prediction <- predict(rpart.model, test.data)
pred<-data.frame(round(rpart.prediction))

# using decision tree
rpart.model <-  tree(total_cases ~ ., data=train.data)
rpart.prediction <- predict(rpart.model, test.data)
pred<-data.frame(round(rpart.prediction))

3using k nearest neighbour
(train.con <- train.kknn(total_cases~., data = train.data,
kmax = 40, kernel = c("rectangular", "triangular", "epanechnikov",
"gaussian", "rank", "optimal")))

