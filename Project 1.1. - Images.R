install.packages("keras")
library(keras)
library("tensorflow")

if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("EBImage")
library(EBImage)


getwd()
setwd("C:/Users/sujay/CloudStation/SIM_UB/UB -Grad School/Semester 2 - Spring 2021/MGS 662 - Optimization Methods for Machine Learning/Assignment 1/Images")



i1 <- c("01_binladen_part1.jpg", "01_binladen_part2.jpg", "01_binladen_part3.jpg", "01_binladen_part4.jpg", "01_binladen_part5.jpg", "03_manasa_part1.jpg",	"03_manasa_part2.jpg",	"03_manasa_part3.jpg",	"03_manasa_part4.jpg",	"03_manasa_part5.jpg",	"03_manasa_part6.jpg", "04_binladen_part1.jpg",	"04_binladen_part2.jpg",	"04_binladen_part3.jpg",	"04_binladen_part4.jpg",	"04_binladen_part5.jpg",	"04_binladen_part6.jpg", "05_binladen_part1.jpg",	"05_binladen_part2.jpg",	"05_binladen_part3.jpg",	"05_binladen_part4.jpg",	"05_binladen_part5.jpg",	"05_binladen_part6.jpg",	"05_binladen_part7.jpg", "06_chandi_part1.jpg",	"06_chandi_part2.jpg",	"06_chandi_part3.jpg",	"06_chandi_part4.jpg",	"06_chandi_part5.jpg",	"06_chandi_part6.jpg",	"06_chandi_part7.jpg",	"06_chandi_part8.jpg",	"07_gujarat_part1.jpg",	"07_gujarat_part2.jpg",	"07_gujarat_part3.jpg",	"07_gujarat_part4.jpg",	"07_gujarat_part5.jpg",	"07_gujarat_part6.jpg",	"07_gujarat_part7.jpg",	"08_tsunami_part1.jpg",	"08_tsunami_part2.jpg",	"08_tsunami_part3.jpg",	"08_tsunami_part4.jpg",	"09_shotopir_part1.jpg",	"09_shotopir_part2.jpg",	"09_shotopir_part3.jpg",	"09_shotopir_part4.jpg",	"09_shotopir_part5.jpg",	"09_shotopir_part6.jpg",	"11_weddingofthefish_part1.jpg",	"11_weddingofthefish_part2.jpg",	"11_weddingofthefish_part3.jpg",	"11_weddingofthefish_part4.jpg",	"12_victimizationofwomen_part1.jpg",	"12_victimizationofwomen_part2.jpg",	"12_victimizationofwomen_part3.jpg",	"12_victimizationofwomen_part4.jpg",	"12_victimizationofwomen_part5.jpg",	"12_victimizationofwomen_part6.jpg",	"12_victimizationofwomen_part7.jpg",	"13_santallife_part1.jpg",	"13_santallife_part2.jpg",	"13_santallife_part3.jpg",	"13_santallife_part4.jpg",	"15_victimizationofgirls_part1.jpg",	"15_victimizationofgirls_part2.jpg",	"15_victimizationofgirls_part3.jpg",	"15_victimizationofgirls_part4.jpg",	"15_victimizationofgirls_part5.jpg",	"16_sitaramayana_part1.jpg",	"16_sitaramayana_part2.jpg",	"16_sitaramayana_part3.jpg",	"16_sitaramayana_part4.jpg",	"16_sitaramayana_part5.jpg",	"16_sitaramayana_part6.jpg", "17_krishna_part1.jpg",	"17_krishna_part2.jpg",	"17_krishna_part3.jpg",	"17_krishna_part4.jpg",	"18_tsunami_part1.jpg",	"18_tsunami_part2.jpg",	"18_tsunami_part3.jpg",	"18_tsunami_part4.jpg",	"18_tsunami_part5.jpg",	"19_tsunami_part1.jpg",	"19_tsunami_part2.jpg",	"19_tsunami_part3.jpg",	"19_tsunami_part4.jpg",	"19_tsunami_part5.jpg",	"21_girlchild_part1.jpg",	"21_girlchild_part2.jpg",	"21_girlchild_part3.jpg",	"21_girlchild_part4.jpg",	"21_girlchild_part5.jpg",	"21_girlchild_part6.jpg",	"21_girlchild_part7.jpg",	"22_fishwedding.jpg",	"23_animalsandbirds_part1.jpg",	"23_animalsandbirds_part2.jpg",	"23_animalsandbirds_part3.jpg",	"24_communalharmony_part1.jpg",	"24_communalharmony_part2.jpg",	"24_communalharmony_part3.jpg",	"24_communalharmony_part4.jpg",	"24_communalharmony_part5.jpg",	"24_communalharmony_part6.jpg",	"24_communalharmony_part7.jpg",	"25_tsunami_part1.jpg",	"25_tsunami_part2.jpg",	"25_tsunami_part3.jpg",	"25_tsunami_part4.jpg",	"25_tsunami_part5.jpg",	"25_tsunami_part6.jpg", "26_weddingofthefish_part1.jpg",	"26_weddingofthefish_part2.jpg",	"26_weddingofthefish_part3.jpg",	"26_weddingofthefish_part4.jpg",	"27_triballife_part1.jpg",	"27_triballife_part2.jpg",	"27_triballife_part3.jpg",	"27_triballife_part4.jpg",	"28_manasamangal_part1.jpg",	"28_manasamangal_part2.jpg",	"28_manasamangal_part3.jpg",	"28_manasamangal_part4.jpg",	"28_manasamangal_part5.jpg",	"28_manasamangal_part6.jpg",	"30_theabductionofsita_part1.jpg",	"30_theabductionofsita_part2.jpg",	"30_theabductionofsita_part3.jpg",	"30_theabductionofsita_part4.jpg",	"30_theabductionofsita_part5.jpg",	"30_theabductionofsita_part6.jpg",	"30_theabductionofsita_part7.jpg",	"30_theabductionofsita_part8.jpg",	"30_theabductionofsita_part9.jpg", 
        "31_manasamangal_part1.jpg",	"31_manasamangal_part2.jpg",	"31_manasamangal_part3.jpg",	"31_manasamangal_part4.jpg",	"31_manasamangal_part5.jpg",	"31_manasamangal_part6.jpg",	"32_chandimangal_part1.jpg",	"32_chandimangal_part2.jpg",	"32_chandimangal_part3.jpg",	"32_chandimangal_part4.jpg",	"32_chandimangal_part5.jpg",	"32_chandimangal_part6.jpg",	"32_chandimangal_part7.jpg",	"32_chandimangal_part8.jpg",	"33_binladen11september_part1.jpg",	"33_binladen11september_part2.jpg",	"33_binladen11september_part3.jpg",	"33_binladen11september_part4.jpg",	"33_binladen11september_part5.jpg",	"34_animalworld_part1.jpg",	"34_animalworld_part2.jpg",	"34_animalworld_part3.jpg",	"34_animalworld_part4.jpg",	"35_shotopir_part1.jpg",	"35_shotopir_part2.jpg",	"35_shotopir_part3.jpg",	"35_shotopir_part4.jpg",	"35_shotopir_part5.jpg",	"35_shotopir_part6.jpg",	"36_thegirlchild_part1.jpg",	"36_thegirlchild_part2.jpg",	"36_thegirlchild_part3.jpg",	"36_thegirlchild_part4.jpg",	"36_thegirlchild_part5.jpg",	"36_thegirlchild_part6.jpg",	"36_thegirlchild_part7.jpg",	"36_thegirlchild_part8.jpg")



mypic <- list()
for (i in 1:173) {mypic[[i]] <- readImage(i1[i])}





print(mypic[[56]])
display(mypic[[56]])


for(i in 1:173) {mypic[[i]] <- resize(mypic[[i]],5, 5)}


View(mypic)

#-------------------------------------------------------------------------------
# Image Concept: Tree

train_x_tree <- NULL
for (i in 1:138) {train_x_tree <- rbind(train_x_tree, mypic[[i]])}
str(train_x_tree)


test_x_tree <- rbind(mypic[[139]],	mypic[[140]],	mypic[[141]],	mypic[[142]],	mypic[[143]],	mypic[[144]],	mypic[[145]],	mypic[[146]],	mypic[[147]],	mypic[[148]],	mypic[[149]],	mypic[[150]],	mypic[[151]],	mypic[[152]],	mypic[[153]],	mypic[[154]],	mypic[[155]],	mypic[[156]],	mypic[[157]],	mypic[[158]],	mypic[[159]],	mypic[[160]],	mypic[[161]],	mypic[[162]],	mypic[[163]],	mypic[[164]],	mypic[[165]],	mypic[[166]],	mypic[[167]],	mypic[[168]],	mypic[[169]],	mypic[[170]],	mypic[[171]],	mypic[[172]],	mypic[[173]])
str(test_x_tree)


train_y_tree <- c(1,	1,	0,	0,	1,	0,	0,	0,	0,	0,	0,	1,	0,	1,	0,	0,	0,	0,	1,	0,	0,	0,	0,	0,	0,	1,	1,	0,	0,	0,	0,	0,	0,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	0,	0,	0,	1,	0,	0,	0,	1,	0,	0,	1,	1,	0,	1,	1,	1,	1,	1,	0,	1,	0,	0,	0,	0,	0,	1,	1,	1,	1,	0,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	1,	1,	0,	0,	1,	1,	0,	1,	1,	0,	1,	0,	1,	0,	0,	0,	0,	1,	1,	1,	1,	0,	0,	0,	0,	0,	0,	1,	1,	1,	1,	1,	1,	1,	1,	0,	0,	0)
train_y_tree

test_y_tree <- c(1,	0,	0,	0,	0,	1,	1,	0,	1,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	0,	0,	1,	0,	0,	0,	0,	1,	0,	0,	1,	0,	0,	0,	0,	1)
test_y_tree

trainLabels_tree <- to_categorical(train_y_tree)
testLabels_tree <- to_categorical(test_y_tree)


model_tree <- keras_model_sequential()
model_tree %>%
  layer_dense(units=331, activation="relu", input_shape=75) %>% 
  layer_dense(units=138, activation = "relu") %>% 
  layer_dense(units=2, activation="linear")


summary(model_tree)




model_tree %>%
  compile(loss='mean_squared_error',
              optimizer=optimizer_rmsprop(),
              metrics=c('mean_squared_error'))



# Fit Model
history_tree <- model_tree %>%
  fit(train_x_tree, trainLabels_tree,
      epoch = 50, batch_size = 32, validation_split = 0.2)

plot(history_tree)




# Evaluation and Prediction - train data
model_tree %>%evaluate(train_x_tree, trainLabels_tree)
pred_tree <- model_tree %>% predict_classes(train_x_tree)
table(Predicted = pred_tree, Actual = train_y_tree)


# Evaluation and Prediction - test data
model_tree %>%evaluate(test_x_tree, testLabels_tree)
pred_tree_test <- model_tree %>% predict_classes(test_x_tree)
table(Predicted = pred_tree_test, Actual = test_y_tree)


#-------------------------------------------------------------------------------
# Image Concept: Mythical Creature

train_x_mythical <- NULL
for (i in 1:138) {train_x_mythical <- rbind(train_x_mythical, mypic[[i]])}
str(train_x_mythical)


test_x_mythical <- rbind(mypic[[139]],	mypic[[140]],	mypic[[141]],	mypic[[142]],	mypic[[143]],	mypic[[144]],	mypic[[145]],	mypic[[146]],	mypic[[147]],	mypic[[148]],	mypic[[149]],	mypic[[150]],	mypic[[151]],	mypic[[152]],	mypic[[153]],	mypic[[154]],	mypic[[155]],	mypic[[156]],	mypic[[157]],	mypic[[158]],	mypic[[159]],	mypic[[160]],	mypic[[161]],	mypic[[162]],	mypic[[163]],	mypic[[164]],	mypic[[165]],	mypic[[166]],	mypic[[167]],	mypic[[168]],	mypic[[169]],	mypic[[170]],	mypic[[171]],	mypic[[172]],	mypic[[173]])
str(test_x_mythical)


train_y_mythical <- c(0, 	1,	0,	0,	0,	1,	0,	0,	1,	1,	1,	0,	0,	0,	1,	1,	0,	1,	0,	0,	0,	0,	0,	0,	1,	0,	1,	1,	0,	0,	1,	1,	0,	0,	0,	0,	0,	1,	0,	1,	1,	1,	1,	0,	0,	0,	0,	0,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	1,	1,	1,	1,	0,	0,	0,	0,	0,	0,	0,	1,	0,	0,	1,	1,	1,	1,	1,	1,	0,	0,	1,	1,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	0,	0,	1,	0,	1,	1,	1,	1,	0,	0,	0,	0,	1,	1,	1,	1,	1,	1,	1)
train_y_mythical

test_y_mythical <- c(0,	0,	1,	1,	1,	1,	0,	1,	0,	1,	0,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	0,	0,	0,	0,	0,	0,	0)
test_y_mythical

trainLabels_mythical <- to_categorical(train_y_mythical)

testLabels_mythical <- to_categorical(test_y_mythical)


model_mythical <- keras_model_sequential()
model_mythical %>%
  layer_dense(units=331, activation="relu", input_shape=75) %>% 
  layer_dense(units=138, activation = "relu") %>% 
  layer_dense(units=2, activation="linear")


summary(model_mythical)



model_mythical %>%
  compile(loss='mean_squared_error',
          optimizer=optimizer_rmsprop(),
          metrics=c('mean_squared_error'))



# Fit Model
history_mythical <- model_mythical %>%
  fit(train_x_mythical, trainLabels_mythical,
      epoch = 50, batch_size = 32, validation_split = 0.2)

plot(history_mythical)




# Evaluation and Prediction - train data
model_mythical %>%evaluate(train_x_mythical, trainLabels_mythical)
pred_mythical <- model_mythical %>% predict_classes(train_x_mythical)
table(Predicted = pred_mythical, Actual = train_y_mythical)


# Evaluation and Prediction - train data
model_mythical %>%evaluate(test_x_mythical, testLabels_mythical)
pred_mythical_test <- model_mythical %>% predict_classes(test_x_mythical)
table(Predicted = pred_mythical_test, Actual = test_y_mythical)


#-------------------------------------------------------------------------------
# Image Concept: Animal

train_x_animal <- NULL
for (i in 1:138) {train_x_animal <- rbind(train_x_animal, mypic[[i]])}
str(train_x_animal)


test_x_animal <- rbind(mypic[[139]],	mypic[[140]],	mypic[[141]],	mypic[[142]],	mypic[[143]],	mypic[[144]],	mypic[[145]],	mypic[[146]],	mypic[[147]],	mypic[[148]],	mypic[[149]],	mypic[[150]],	mypic[[151]],	mypic[[152]],	mypic[[153]],	mypic[[154]],	mypic[[155]],	mypic[[156]],	mypic[[157]],	mypic[[158]],	mypic[[159]],	mypic[[160]],	mypic[[161]],	mypic[[162]],	mypic[[163]],	mypic[[164]],	mypic[[165]],	mypic[[166]],	mypic[[167]],	mypic[[168]],	mypic[[169]],	mypic[[170]],	mypic[[171]],	mypic[[172]],	mypic[[173]])
str(test_x_animal)


train_y_animal <- c(1,	0,	0,	0,	1,	1,	0,	1,	1,	1,	0,	1,	0,	0,	0,	1,	1,	0,	0,	0,	0,	0,	0,	1,	1,	0,	0,	0,	0,	0,	0,	1,	0,	0,	0,	0,	0,	1,	0,	0,	1,	1,	0,	1,	0,	0,	1,	1,	1,	1,	1,	1,	1,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	0,	0,	0,	1,	0,	0,	1,	0,	0,	1,	0,	0,	1,	0,	0,	1,	0,	0,	0,	0,	0,	1,	1,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	1,	1,	1,	1,	1,	1,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	0,	1,	1,	1,	1,	1,	1,	1,	1,	1,	0,	1,	1,	0,	1,	1,	0,	0,	0,	1,	1,	1,	0,	1,	1,	1)
train_y_animal

test_y_animal <- c(1,	1,	1,	1,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	1,	1,	1,	1,	1,	1,	0,	0,	0,	1,	1,	0,	0,	0,	0,	0,	0,	0,	0)
test_y_animal

trainLabels_animal <- to_categorical(train_y_animal)

testLabels_animal <- to_categorical(test_y_animal)


model_animal <- keras_model_sequential()
model_animal %>%
  layer_dense(units=331, activation="relu", input_shape=75) %>% 
  layer_dense(units=138, activation = "relu") %>% 
  layer_dense(units=2, activation="linear")


summary(model_animal)



model_animal %>%
  compile(loss='mean_squared_error',
          optimizer=optimizer_rmsprop(),
          metrics=c('mean_squared_error'))



# Fit Model
history_animal <- model_animal %>%
  fit(train_x_animal, trainLabels_animal,
      epoch = 50, batch_size = 32, validation_split = 0.2)


summary(model_animal)

plot(history_animal)



# Evaluation and Prediction - train data
model_animal %>%evaluate(train_x_animal, trainLabels_animal)
pred_animal <- model_animal %>% predict_classes(train_x_animal)
table(Predicted = pred_animal, Actual = train_y_animal)


# Evaluation and Prediction - test data
model_animal %>%evaluate(test_x_animal, testLabels_animal)
pred_animal_test <- model_animal %>% predict_classes(test_x_animal)
table(Predicted = pred_animal_test, Actual = test_y_animal)



#-------------------------------------------------------------------------------




