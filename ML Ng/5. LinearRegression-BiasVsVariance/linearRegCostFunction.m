function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables

m = length(y); % number of training examples

J = 0;
grad = zeros(size(theta));


reg = lambda / (2*m) * sum(theta(2:end).^2); % shouldnt regularize theta_0
J = sum((X*theta-y).^2) / (2*m) + reg;

reg = theta'*lambda/m;
reg(1) = 0;

temp = X*theta;
error = temp-y;
grad = sum(error.*X)/m + reg;


grad = grad(:);
end
