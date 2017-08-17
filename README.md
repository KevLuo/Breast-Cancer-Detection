# Breast-Cancer-Detection

Overview:  This program is ~98% accurate at predicting whether or not a given tumor is cancerous.  Its input is a set
of features extracted from an image and its output is a classification as either malignant (cancerous) or benign.

Specifics:  This project performs logistic regression on a dataset from the UCI Machine Learning Repository.  It does not utilize the pre-made ML algorithms already available in R.  I implemented the ML algorithm myself, to attain a higher understanding of its underlying mechanics, mathematics, and proficiencies.  Algorithm components that I built myself include:

      1.  The Cost Function
      2.  Gradient Descent
      3.  Sigmoid Function

I also conducted some data visualization, dataset splitting, and data manipulation (e.g. mean normalization).

CODE ORIENTATION:  The main script that controls the flow of the program is "cancer_main.R".  Several of the mathematically
implemented sections are split off into separate files (e.g. "reg_gradientDescent.R").
