function [error_train, error_val] = learningCurveRandom(X, y, Xval, yval, lambda)

m = size(X, 1);
mval = size(Xval, 1);
error_train = zeros(m, 1);
error_val   = zeros(m, 1);

for i = 1:m
  Jtr = 0;
  Jcv = 0;
  for l=1:20
    % TRAINING SET ERRORS:
    sel = randperm(m)(1:i);
    
    theta = trainLinearReg(X(sel, :), y(sel, :), lambda);
    Jtr += linearRegCostFunction(X(sel, :), y(sel, :), theta, 0)(1);   
    
    % CV SET ERRORS:
    sel = randperm(mval)(1:i);
    
    theta = trainLinearReg(Xval(sel, :), yval(sel, :), lambda);
    Jcv += linearRegCostFunction(Xval(sel, :), yval(sel, :), theta, 0)(1);
  endfor;
  error_train(i) = Jtr/20;
  error_val(i) = Jcv/20;
endfor;

endfunction