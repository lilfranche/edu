function [error_train, error_val] = ...
    learningCurve(X, y, Xval, yval, lambda)
% Generates the train and cross validation (CV) set errors needed to plot 
% a learning curve. Then, error_train(i) contains the training error for
%                          i examples (and similarly for error_val(i)).

m = size(X, 1); % Number of training examples

error_train = zeros(m, 1);
error_val   = zeros(m, 1);

% Note: You should evaluate the training error on the first i training
%       examples (i.e., X(1:i, :) and y(1:i)). For the CV error, evaluate on
%       the _entire_ cross validation set (Xval and yval).
% Note: If you are using linearRegCostFunction to compute the training and 
%       CV error, you should call the function with the lambda = 0. 
%       You will still need to use lambda when running the training to obtain the theta parameters.

for i = 1:m
  theta = trainLinearReg(X(1:i,:), y(1:i,:), lambda);
  error_train(i) = linearRegCostFunction(X(1:i,:), y(1:i,:), theta, 0)(1);   
  error_val(i) = linearRegCostFunction(Xval, yval, theta, 0)(1);
   % One way to compute the training error is to use 
   % your existing cost function and set ? to 0 only when using it 
   % to compute the training error and cross validation error. 
endfor
end