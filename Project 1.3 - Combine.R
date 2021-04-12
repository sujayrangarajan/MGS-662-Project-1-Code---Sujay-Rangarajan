getwd()
setwd("C:/Users/sujay/CloudStation/SIM_UB/UB -Grad School/Semester 2 - Spring 2021/MGS 662 - Optimization Methods for Machine Learning/Assignment 1/Combine")


i1 <- c("04_binladen.jpg",	"06_chandi.jpg",	"32_chandimangal.jpg",	"24_communalharmony.jpg",	"07_gujarat.jpg",	"17_krishna.jpg",	"01_binladen.jpg",	"05_binladen-179x1024.jpg",	"33_binladen11september.jpg",	"28_manasamangal.jpg",	"31_manasamangal.jpg",	"03_manasa.jpg",	
           "16_sitaramayana.jpg",	"13_santhallife.jpg",	"27_triballife.jpg",	"09_shotopir.jpg",	"35_shotopir.jpg",	"30_theabductionofsita.jpg",	"36_thegirlchild.jpg",	"21_girlchild.jpg",	"08_tsunami.jpg",	"25_tsunami.jpg",	"18_tsunami.jpg",	"19_tsunami.jpg",	"15_victimizationofgirls.jpg",	"12_victimizationofwomen.jpg",	"26_weddingofthefish.jpg",	"22_fishwedding.jpg",	"11_weddingofthefish.jpg")




mypic <- list()
for (i in 1:29) {mypic[[i]] <- readImage(i1[i])}

print(mypic[[1]])
display(picture[[1]])

for(i in 1:29) {mypic[[i]] <- resize(mypic[[i]],5, 5)}



file.choose()
folder <- "C:/Users/sujay/CloudStation/SIM_UB/UB -Grad School/Semester 2 - Spring 2021/MGS 662 - Optimization Methods for Machine Learning/Assignment 1/Text/Combine"

filelist <- list.files(path=folder)

filelist <- paste(folder, "\\", filelist, sep="")

a <- lapply(filelist, FUN=readLines)

#Cleaning the data
corpus <- lapply(a, FUN=paste, collapse="")
corpus <- gsub(pattern="\\W", replace=" ", corpus)
corpus <- gsub(pattern="\\d", replace=" ", corpus)
corpus <- tolower(corpus)
corpus <- removeWords(corpus, stopwords("english"))
corpus <- gsub(pattern="\\b[A-z]\\b{1}", replace=" ", corpus)
corpus <- stripWhitespace(corpus)


corpus = VectorSource(corpus)
corpus = VCorpus(corpus)

corpus = DocumentTermMatrix(corpus)
corpus = as.matrix(corpus)

View(corpus)
corpus[, 1000]


combine <- rbind(corpus, mypic)
View(combine)

train_combine_x <- combine[1:23, ]
str(train_combine_x)

test_combine_x <- combine[23:29, ]
str(test_combine_x)


model_combine <- keras_model_sequential()
model_combine %>%
  layer_dense(units=331, activation="relu", input_shape=1364) %>% 
  layer_dense(units=138, activation = "relu") %>% 
  layer_dense(units=2, activation="linear")

summary(model_text)

model_combine %>%
  compile(loss='mean_squared_error',
          optimizer=optimizer_rmsprop(),
          metrics=c('mean_squared_error'))


#-------------------------------------------------------------------------------

# Combine Concept - Tree

trainy_tree <- c(1,	1,	1,	1,	1,	1,	1,	1,	0,	0,	1,	0,	1,	1,	1,	1,	1,	1,	1,	1,	0,	1,	0)
testy_tree <- c(1,	1,	1,	0,	0,	0)

trainLabels_text_tree <- to_categorical(trainy_tree)
testLabels_text_tree <- to_categorical(testy_tree)


# Fit Model
history_tree_text <- model_combine %>%
  fit(train_combine_x, trainLabels_text_tree,
      epoch = 50, batch_size = 32, validation_split = 0.2)

plot(history_tree_text)


# Evaluation and Prediction - train data
model_combine %>%evaluate(train_combine_x, trainLabels_text_tree)
pred_text_tree <- model_combine %>% predict_classes(train_combinex)
table(Predicted = pred_text_tree, Actual = trainy_tree)


# Evaluation and Prediction - test data
model_combine %>%evaluate(test_combine_x, testLabels_text_tree)
pred_text_tree_test <- model_combine %>% predict_classes(test_combine_x)
table(Predicted = pred_text_tree_test, Actual = testy_tree)



#-------------------------------------------------------------------------------

# Text Concept - Mythical Creature

trainy_mythical <- c(1,	1,	1,	0,	1,	1,	1,	1,	0,	1,	1,	1,	1,	1,	1,	1,	1,	1,	0,	0,	1,	1,	1)
testy_mythical <- c(1,	0,	0,	0,	0,	0)

trainLabels_text_mythical <- to_categorical(trainy_mythical)
testLabels_text_mythical <- to_categorical(testy_mythical)


# Fit Model
history_mythical_text <- model_combine %>%
  fit(train_combinex, trainLabels_text_mythical,
      epoch = 50, batch_size = 32, validation_split = 0.2)

plot(history_mythical_text)


# Evaluation and Prediction - train data
model_combine %>%evaluate(train_combine_x, trainLabels_text_mythical)
pred_text_mythical <- model_combine %>% predict_classes(train_combine_x)
table(Predicted = pred_text_mythical, Actual = trainy_mythical)


# Evaluation and Prediction - test data
model_combine %>%evaluate(test_combine_x, testLabels_text_mythical)
pred_text_mythical_test <- model_combine %>% predict_classes(test_combine_x)
table(Predicted = pred_text_mythical_test, Actual = testy_mythical)


#-------------------------------------------------------------------------------

# Text Concept - Animal

trainy_animal <- c(1,	1,	1,	1,	1,	1,	1,	1,	1,	1,	1,	1,	1,	1,	1,	1,	1,	1,	0,	0,	1,	1,	0)
testy_animal <- c(1,	1,	0,	1,	1,	1)

trainLabels_text_animal <- to_categorical(trainy_animal)
testLabels_text_animal <- to_categorical(testy_animal)


# Fit Model
history_animal_text <- model_combine %>%
  fit(train_combine_x, trainLabels_text_animal,
      epoch = 50, batch_size = 32, validation_split = 0.2)

plot(history_animal_text)


# Evaluation and Prediction - train data
model_combine %>%evaluate(train_combinex, trainLabels_text_animal)
pred_text_animal <- model_combine %>% predict_classes(train_combine_x)
table(Predicted = pred_text_animal, Actual = trainy_animal)


# Evaluation and Prediction - test data
model_combine %>%evaluate(test_combine_x, testLabels_text_animal)
pred_text_animal_test <- model_combine %>% predict_classes(test_combine_x)
table(Predicted = pred_text_animal_test, Actual = testy_animal)





