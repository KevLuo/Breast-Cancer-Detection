# Breast-Cancer-Detection

This program is ~98% accurate at predicting whether or not a given tumor is cancerous.  Its input is a set
of features extracted from an image and its output is a classification as either malignant (cancerous) or benign.

I wrote this program so I could learn my way around both the R language and the inner workings of logistic regression.  By designing my own version of logistic regression to apply to this UCI Machine Learning Repository dataset, I had the opportunity to code algorithm components like gradient descent and the cost measurements myself.  Although the dataset itself was simple, it introduced me to implementing concepts like mean normalization, dataset splitting, and data visualization.

CODE ORIENTATION:  The main script that controls the flow of the program is "cancer_main.R".  Several of the mathematically
implemented sections are split off into separate files (e.g. "reg_gradientDescent.R").
