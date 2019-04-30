function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel based on a CV set
C = 1;
sigma = 0.3;

vec = [0.01,0.03,0.1,0.3,1,3,10,30]';
res=0;
max_err=10^9;

for i = 1:length(vec)
  Ctemp = vec(i);
  for j = 1:length(vec)
    sigmatemp = vec(j);
    model= svmTrain(X, y, Ctemp, @(x1, x2) gaussianKernel(x1, x2, sigmatemp));
    predictions = svmPredict(model, Xval);
    error = mean(double(predictions ~= yval))
    if error < max_err,
      max_err = error;
      C = Ctemp;
      sigma = sigmatemp;
    end
  end
end  

end
