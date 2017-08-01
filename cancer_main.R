library(ggplot2)
source("sigmoid.R")
source("cost+gradient.R")
source("gradientDescent.R")
source("predict.R")

#load in the dataset
#dataset contains 569 examples with 33 variables each
cancerData = read.csv("breast-cancer-dataset.csv")

###################################################################################################################
#PRELIMINARY VISUALIZATION

#shows malignant tumors have higher concavity?
ggplot(data = cancerData, aes(x = concave.points_mean, y = concavity_mean, color = diagnosis)) + geom_point()
#shows benign tumors have smaller radius_mean?
ggplot(data = cancerData, aes(x = radius_mean, y = diagnosis)) + geom_point()

###################################################################################################################
#DATA PREPARATION

#X is 569 by 31 (segmented out the labels and a NA column)
X = as.matrix(cancerData[-c(2, 33)])
#add a column of ones for intercept term -- X is now 569 by 32 (features matrix)
X = cbind(as.vector(rep(1, 569)), X)

#obtain mean of each feature
means_X = colMeans(X)
#obtain standard deviation of each feature
std_X = apply(X, 2, sd)
#Apply mean normalization -- speeds up gradient descent and solves NaN issue
for (feature in 2:ncol(X)) {
  X[ , feature] = ( X[ , feature] - means_X[feature] ) / std_X[feature]
}

#extract the labels we want to predict
labels = cancerData[2]
#Malignant = 1, Benign = 0
numericLabels = ifelse(labels$diagnosis == 'M', 1, 0)
#y is 569 by 1 (labels matrix)
y = as.matrix(numericLabels)

set.seed(125)
sample = sample.int(n = nrow(X), size = floor(.75*nrow(X)), replace = F)

X_train = X[sample, ]
y_train = y[sample, ]
X_test = X[-sample, ]
y_test = y[-sample, ]

###################################################################################################################
#COMPUTE COST AND GRADIENT

#initialize parameters -- size is 32 x 1 (includes extra zero for the bias term)
initial_theta = matrix(0, 32, 1)

#calculate and store the cost & gradient (cost() returns them in a list)
cost_grad_list = cost(initial_theta, X_train, y_train)
#extract the cost
model_cost = cost_grad_list$cost
#gradient is 32 x 1 (one for each theta parameter)
#extract the gradient
gradient = cost_grad_list$gradient

###################################################################################################################
#MINIMIZE COST

#perform gradient descent to optimize parameters
result = gradientDescent(X_train, y_train, initial_theta, 0.05, 400)
#extract parameters
theta = result$theta
#extract cost history to check if cost is actually decreasing each iteration
cost_history = result$cost_history

###################################################################################################################
#PREDICT

#predict on the test data
predictions = predict(X_test, theta)
#compare our predictions to the actual values
accuracy = mean(predictions == y_test) 
print(cost_history)
print(accuracy)






