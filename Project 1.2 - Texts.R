install.packages("tm")
install.packages("wordcloud")
install.packages("stringr")
install.packages("readtext")
install.packages("SnowballC")

library(tm)
library(wordcloud)
library(stringr)
library(SnowballC)
library(readtext)

file.choose()
folder <- "C:\\Users\\sujay\\CloudStation\\SIM_UB\\UB -Grad School\\Semester 2 - Spring 2021\\MGS 662 - Optimization Methods for Machine Learning\\Assignment 1\\Text"

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

trainx <- corpus[1:19, ]
str(trainx)

testx <- corpus[20:24, ]
View(testx)


model_text <- keras_model_sequential()
model_text %>%
  layer_dense(units=331, activation="relu", input_shape=1364) %>% 
  layer_dense(units=138, activation = "relu") %>% 
  layer_dense(units=2, activation="linear")


summary(model_text)

model_text %>%
  compile(loss='mean_squared_error',
          optimizer=optimizer_rmsprop(),
          metrics=c('mean_squared_error'))



#-------------------------------------------------------------------------------

# Text Concept - Tree

trainy_tree <- c(1,	1,	1,	1,	1,	1,	1,	0,	1,	1,	1,	1,	1,	1,	1,	1,	1,	0,	1)
testy_tree <- c(1,	1,	1,	0,	0)

trainLabels_text_tree <- to_categorical(trainy_tree)
testLabels_text_tree <- to_categorical(testy_tree)


# Fit Model
history_tree_text <- model_text %>%
  fit(trainx, trainLabels_text_tree,
      epoch = 50, batch_size = 32, validation_split = 0.2)

plot(history_tree_text)


# Evaluation and Prediction - train data
model_text %>%evaluate(trainx, trainLabels_text_tree)
pred_text_tree <- model_text %>% predict_classes(trainx)
table(Predicted = pred_text_tree, Actual = trainy_tree)


# Evaluation and Prediction - test data
model_text %>%evaluate(testx, testLabels_text_tree)
pred_text_tree_test <- model_text %>% predict_classes(testx)
table(Predicted = pred_text_tree_test, Actual = testy_tree)



#-------------------------------------------------------------------------------

# Text Concept - Mythical Creature

trainy_mythical <- c(1,	1,	0,	1,	1,	1,	1,	0,	1,	1,	1,	1,	1,	1,	1,	0,	0,	1,	1)
testy_mythical <- c(1,	0,	0,	0,	0)

trainLabels_text_mythical <- to_categorical(trainy_mythical)
testLabels_text_mythical <- to_categorical(testy_mythical)


# Fit Model
history_mythical_text <- model_text %>%
  fit(trainx, trainLabels_text_mythical,
      epoch = 50, batch_size = 32, validation_split = 0.2)

plot(history_mythical_text)


# Evaluation and Prediction - train data
model_text %>%evaluate(trainx, trainLabels_text_mythical)
pred_text_mythical <- model_text %>% predict_classes(trainx)
table(Predicted = pred_text_mythical, Actual = trainy_mythical)


# Evaluation and Prediction - test data
model_text %>%evaluate(testx, testLabels_text_mythical)
pred_text_mythical_test <- model_text %>% predict_classes(testx)
table(Predicted = pred_text_mythical_test, Actual = testy_mythical)


#-------------------------------------------------------------------------------

# Text Concept - Animal

trainy_animal <- c(1,	1,	1,	1,	1,	1,	1,	1,	1,	1,	1,	1,	1,	1,	1,	0,	0,	1,	1)
testy_animal <- c(1,	1,	0,	1,	1)

trainLabels_text_animal <- to_categorical(trainy_animal)
testLabels_text_animal <- to_categorical(testy_animal)


# Fit Model
history_animal_text <- model_text %>%
  fit(trainx, trainLabels_text_animal,
      epoch = 50, batch_size = 32, validation_split = 0.2)

plot(history_animal_text)


# Evaluation and Prediction - train data
model_text %>%evaluate(trainx, trainLabels_text_animal)
pred_text_animal <- model_text %>% predict_classes(trainx)
table(Predicted = pred_text_animal, Actual = trainy_animal)


# Evaluation and Prediction - test data
model_text %>%evaluate(testx, testLabels_text_animal)
pred_text_animal_test <- model_text %>% predict_classes(testx)
table(Predicted = pred_text_animal_test, Actual = testy_animal)
