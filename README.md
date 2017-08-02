# Breast-Cancer-Detection

KEYWORDS:  Machine Learning, Logistic Regression, Built-from-scratch, R

WHY:  Doctors make mistakes.  Computers can help resolve that.

WHAT:  This program is ~97% accurate at predicting whether or not a given tumor is cancerous.  Its input is a set
of features extracted from an image and its output is a classification as either malignant (cancerous) or benign.

HOW:  This project performs logistic regression on a dataset from the UCI Machine Learning Repository.  I implemented the
ML algorithm from scratch.  Algorithm components that I built myself include:
      1.  The Cost Function
      2.  Gradient Descent
      3.  Sigmoid Function
I also conducted some data visualization, dataset splitting, and data manipulation (e.g. mean normalization).

CODE ORIENTATION:  The main script that controls the flow of the program is "cancer_main.R".  Several of the mathematically 
implemented sections are split off into separate files (e.g. "gradientDescent.R").
