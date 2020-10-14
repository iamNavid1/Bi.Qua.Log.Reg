% ........................................................................

% % My template Matlab codes for binary Logistic Regression for nonlinear
% classification
% Algorithm: fminunc (quasi-Newton)
% mapFeature.m
% Navid Salami Pargoo
% 2020

% ........................................................................

% mapFeature(X1, X2) maps the input features to quadratic features. Inputs
% must be the same size.

function newX = mapFeature(X, maxDegree)

m = size(X,1); % # of training sets
n = size(X,2); % # of features

stacked = zeros(0, n);    % This will collect all the coefficients    
for upTo = 1:maxDegree          % for degree 1 polynomial to degree 'order'
    stacked = [stacked; powerSums(n, upTo)];
end


newX = zeros(m, size(stacked,1));

for i = 1:size(stacked,1)
    accumulator = ones(m, 1);
    for j = 1:n
        accumulator = accumulator .* X(:,j).^stacked(i,j);
    end
    newX(:,i) = accumulator;
end

newX = [ones(m,1) newX];


end



% This function generates all possible rows such that every entry is a
% non-negative integer and the row sums to a positive integer. In every row, 
% each entry is the power to which the corresponding feature is taken. 

function powers = powerSums(n, upTo)
if n<=1
    powers = upTo;
else
    powers = zeros(0, n);    
    for i = upTo:-1:0
        rc = powerSums(n - 1, upTo - i);
        powers = [powers; i * ones(size(rc,1), 1), rc];
    end    
end
end