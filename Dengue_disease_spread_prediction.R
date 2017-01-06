dat = read.csv("F:\\Data driven competitions\\predict_dengue\\dengue_features_train.csv", header = TRUE)
dat_labels = read.csv("F:\\Data driven competitions\\predict_dengue\\dengue_labels_train.csv", header = TRUE)
dat_test =read.csv("F:\\Data driven competitions\\predict_dengue\\dengue_features_test.csv", header = TRUE)
training_dat<- merge(dat,dat_labels,by=c("city","year","weekofyear"))
library(tree)
tree.model <- tree(total_cases ~ ndvi_ne+
ndvi_nw+
ndvi_se+
ndvi_sw+
precipitation_amt_mm+
reanalysis_air_temp_k+
reanalysis_avg_temp_k+
reanalysis_dew_point_temp_k+
reanalysis_max_air_temp_k+
reanalysis_min_air_temp_k+
reanalysis_precip_amt_kg_per_m2+
reanalysis_relative_humidity_percent+
reanalysis_sat_precip_amt_mm+
reanalysis_specific_humidity_g_per_kg+
reanalysis_tdtr_k+
station_avg_temp_c+
station_diur_temp_rng_c+
station_max_temp_c+
station_min_temp_c+
station_precip_mm
, data=training_dat)
plot(tree.model)
text(tree.model, cex=.75)
my.prediction <- predict(tree.model, dat_test)
test1<-dat_test["city"]
test2<-cbind(test1,dat_test["weekofyear"],dat_test["year"])
prediction<-(data.frame(my.prediction))
test2<-cbind(test2,round(prediction["my.prediction"]))
write.csv(test2, file = "F:\\Data driven competitions\\predict_dengue\\predictions.csv", fileEncoding = "UTF-16LE")


