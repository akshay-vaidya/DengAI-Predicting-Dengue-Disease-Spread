train1_features<- subset(training, select= c(reanalysis_max_air_temp_k
,reanalysis_tdtr_k
,reanalysis_avg_temp_k
,reanalysis_dew_point_temp_k
,reanalysis_min_air_temp_k
,station_diur_temp_rng_c
,ndvi_nw
,reanalysis_specific_humidity_g_per_kg
,ndvi_se
,reanalysis_relative_humidity_percent,total_cases)

test_features<- subset(test, select= c(reanalysis_max_air_temp_k
,reanalysis_tdtr_k
,reanalysis_avg_temp_k
,reanalysis_dew_point_temp_k
,reanalysis_min_air_temp_k
,station_diur_temp_rng_c
,ndvi_nw
,reanalysis_specific_humidity_g_per_kg
,ndvi_se
,reanalysis_relative_humidity_percent)


rknn<-rknnBeg(train, training$total_cases, k = 25, r = 500, mtry = trunc(sqrt(ncol(train))),
fixed.partition = FALSE, pk = 0.5, stopat = 4, cluster=NULL, seed = NULL)



p<-rknnReg(train_features, test_features, training$total_cases, k=25, r=500, mtry=trunc(sqrt(ncol(train_features))),
cluster=NULL, seed=NULL)
