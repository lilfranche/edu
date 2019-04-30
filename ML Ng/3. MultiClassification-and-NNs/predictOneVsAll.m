function p = predictOneVsAll(all_theta, X)
%PREDICT Predict the label for a trained one-vs-all classifier. The labels 
%are in the range 1..K, where K = size(all_theta, 1). 

m = size(X, 1);
num_labels = size(all_theta, 1);

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);

% Add ones to the X data matrix
X = [ones(m, 1) X];

% You should set p to a vector of predictions (from 1 to num_labels).
%
% Hint: If your examples are in rows, then, you can use max(A, [], 2) 
% to obtain the max for each row.

h_x = sigmoid(X*all_theta');
[p_vals, p] = max(h_x, [], 2);

end
