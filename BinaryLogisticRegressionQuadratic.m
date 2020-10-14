% ........................................................................

% % My template Matlab codes for binary Logistic Regression for nonlinear
% classification
% Algorithm: fminunc (quasi-Newton)
% BinaryLogisticRegressioQuadratic.m
% Navid Salami Pargoo
% 2020

% ........................................................................

% Clear memory 
clear;

% Load the dataset into variables X and y
data = load('dataQuad3d.txt');
X = data(:, 1:end-1);
y = data(:, end);
m = length(y); % # of training sets
n = size(X,2); % # of features

% Print out first 10 examples from the dataset
disp('First 10 eamples from the dataset are:');
disp([X(1:10,:) y(1:10,:)]);

% ========================= 2D/3D plot of input data =========================

% Plot the data with + indicating (y = 1) examples and o indicating (y = 0) examples.
plotData(X, y);

% ============================== Feature mapping ==============================

% Add Polynomial Features (it also adds a column of ones for us, so the
% intercept term is handled)

upToOrder = 6;
X = mapFeature(X, upToOrder);

% Initialize the fitting parameters
initial_theta = zeros(size(X,2), 1);

% ===========================================================================
% ============ LEARNING PARAMETERS (UNREGULARIZED) USING FMINUNC ============
% ===========================================================================

% Set options for fminunc
options = optimoptions(@fminunc,'Algorithm','Quasi-Newton','GradObj', 'on', 'MaxIter', 1000, 'PlotFcns', 'optimplotfval');

% Run fminunc to obtain the optimal theta
[theta, cost] = fminunc(@(t)(costFunction(t, X, y)), initial_theta, options);

% Print cost & theta
fprintf('Cost at theta found by fminunc: %f\n', cost);
disp('theta:');
disp(theta);

% ============================== Plot Boundary ===============================

plotDecisionBoundary(theta, X, y, n, upToOrder);

% ====================== Evaluating Logistic Regression ======================

%  Predict probability for an example with score 45 on feature 1  and score
%  85 on feature 2
x = zeros(1, n);   % Replace this matrix with the parameters of prediction
z = mapFeature(x, upToOrder)*theta;
prob = sigmoid(z);
fprintf('For an example with scores x, we predict a positivity probability of %f\n\n', prob);

% Compute accuracy on our training set
p = predict(theta, X);
fprintf('Training Accuracy: %f\n', mean(double(p == y)) * 100);

% ===========================================================================
% ============= LEARNING PARAMETERS (REGULARIZED) USING FMINUNC =============
% ===========================================================================

% Set options for fminunc
options = optimoptions(@fminunc,'Algorithm','Quasi-Newton','GradObj', 'on', 'MaxIter', 1000, 'PlotFcns', 'optimplotfval');
lambda = 0.5;

% Run fminunc to obtain the optimal theta
[theta, cost] = fminunc(@(t)(costFunctionReg(t, X, y, lambda)), initial_theta, options);

% Print cost & theta
fprintf('Cost at theta found by fminunc: %f\n', cost);
disp('theta:');
disp(theta);

% ============================== Plot Boundary ===============================

plotDecisionBoundary(theta, X, y, n, upToOrder);

% ====================== Evaluating Logistic Regression ======================

%  Predict probability for an example with score 45 on feature 1  and score
%  85 on feature 2
x = zeros(1, n);   % Replace this matrix with the parameters of prediction
z = mapFeature(x, upToOrder)*theta;
prob = sigmoid(z);
fprintf('For an example with scores x, we predict a positivity probability of %f\n\n', prob);

% Compute accuracy on our training set
p = predict(theta, X);
fprintf('Training Accuracy: %f\n', mean(double(p == y)) * 100);

% ============================================================================





