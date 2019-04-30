function [J, grad] = lrCostFunction(theta, X, y, lambda)
%LRCOSTFUNCTION Compute cost and gradient for logistic regression with 
%regularization

m = length(y); % number of training examples
J = 0; % = cost
grad = zeros(size(theta));

tempTheta = theta;
tempTheta(1) = 0;

h_x = sigmoid(X*theta);

J = (-1/m)*sum(y.*log(h_x)+(1-y).*log(1-h_x))+ ...
lambda/(2*m)*(tempTheta'*tempTheta);                % computing cost

error=h_x-y;
grad = (1/m)*(X'*error)+lambda/m*tempTheta;         % computing gradient

grad = grad(:);

end
