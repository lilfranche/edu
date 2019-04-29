function J = computeCostMulti(X, y, theta)
%COMPUTECOSTMULTI Compute cost for linear regression with multiple variables
% Initialize some useful values
m = length(y); % number of training examples

J = 1/(2*m) * (X*theta-y)' * (X*theta-y);

end