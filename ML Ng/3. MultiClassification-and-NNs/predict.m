function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network

% Useful values
m = size(X, 1);
num_labels = size(Theta2, 1);

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);

% You should set p to a vector with labels between 1 to num_labels.

X = [ones(m, 1) X];
a2 = [ones(m, 1) sigmoid(X*Theta1')]; % 1 bias + 25 hidden 5000-rows units
a3 = sigmoid(a2*Theta2');
[p_vals, p] = max(a3, [], 2);

end
