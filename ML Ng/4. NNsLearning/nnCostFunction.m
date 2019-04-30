function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
         
% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));    % 25*401
Theta2_grad = zeros(size(Theta2));    % 10*26


% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m

a1 = [ones(m, 1) X];                   % 5000*401
z2 = a1*Theta1';
a2 = [ones(m, 1) sigmoid(z2)];         % 5000*26, hidden layer
a3 = sigmoid(a2*Theta2');              % 5000*10, h_x

y_vecs = zeros(m, num_labels);  % Converting y into vector of 0's and 1's
for i = 1:m,                    % for multi-class classification.
    y_vecs(i, y(i)) = 1;        % Can be written as:
end                             %    y = eye(num_labels)(y,:)

lin_regr = y_vecs.*log(a3) + (1-y_vecs).*(log(1-a3));
J = -1/m*sum(sum(lin_regr)); % unregularized

% REGULARIZATION
tTheta1 = [zeros(size(Theta1, 1), 1) Theta1(:,2:end)];    % without bias unit !
tTheta2 = [zeros(size(Theta2, 1), 1) Theta2(:,2:end)];    % without bias unit !
reg = (lambda/(2*m))*((sum(sum(tTheta1.^2))) + sum(sum(tTheta2.^2)));
J = J + reg;   


% Part 2: Implement the backprop to compute Theta1_grad and Theta2_grad. 
%         After implementing Part 2, you can check that your implementation 
%         is correct by running checkNNGradients.
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.

% step 1 - calculate delta for L3 and L2
d3 = a3 - y_vecs;
d2 = d3*Theta2(:,2:end).*sigmoidGradient(z2);

% step 2 - accumulate the gradient
D2 = d3'*a2;   % D1(25*401) - сохранение a2-юнитов(25) и тета-параметров(401)
D1 = d2'*a1;   % D2(10*26)

% step 3 - obtain the gradient by dividing the accumulated gradients by m
%          sum of errors --> the average error over the examples
Theta2_grad += D2/m;
Theta1_grad += D1/m;

% Regularization (except bias unit)
Theta2_grad += lambda*Theta2/m;
Theta1_grad += lambda*Theta1/m;

Theta2_grad(:,1) -= lambda*Theta2(:,1)/m;
Theta1_grad(:,1) -= lambda*Theta1(:,1)/m;


% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
