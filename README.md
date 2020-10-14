# Binary Quadratic Logistic Regression
This repository provides a sample MATLAB code in order to perform a supervised Machine Learning algorithm: Logistic Regression for binary classification.

# Organization of the Repository
The main MATLAB file is named "BinaryLogisticRegressionQuadratic.m" while the other MATLAB files are fuctions used in the main file. You may feed the algorithm with whatever dataset you wish, no matter what the dimension is (but take into account that the training set must be a binary classification). However, two sets of input data are included as an example to implement the algorithm. Depending on the number of variables your dataset has, the algorithm may plot the input data and decision boundry. Also, in addition to unregularized learning parameters, a regularized approach in forming the cost function is included in order to combat the problem of over-fitting. The codes are self-explanatory and contain comments to improve your understanding of what is going on. Furthermore, wherever any intervention is required, the comments in the code prompt you to do so.

# Input Data
The file dataQuad.txt is  a two-variable dataset and contains the data for logistic regression in order to predict if a microchip passes quality assurance based on the results of two tests conducted on them. We have the data for the two tests results on the first and second columns and the quality assurance desicion on the third column. Using this dataset, we would like to determine whether the micrichip should be accepted or rejected. </br>
The file dataQuad3d.txt is identical to dataQuad.txt, expect it includes an additional score for a third test, which means it is a three-variable dataset.

