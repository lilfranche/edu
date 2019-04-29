function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization

% Initialize some useful values
m = length(y); % number of training examples

% Compute the cost of a particular choice of theta.
% You should set J to the cost.
% Compute the partial derivatives and set grad to the partial
% derivatives of the cost w.r.t. each parameter in theta

tempTheta = theta;
tempTheta(1) = 0;

h_x = sigmoid(X*theta);

J = (-1/m)*sum(y.*log(h_x)+(1-y).*log(1-h_x))+ ...
lambda/(2*m)*(tempTheta'*tempTheta);

temp=sigmoid(X*theta);
error=temp-y;
grad = (1/m)*X'*error+lambda/m*tempTheta;


end
