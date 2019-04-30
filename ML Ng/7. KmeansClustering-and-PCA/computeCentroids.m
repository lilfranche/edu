function centroids = computeCentroids(X, idx, K)
%COMPUTECENTROIDS returns the new centroids by computing the means of the 
%data points assigned to each centroid, a matrix of centroids, 
% where each row of centroids is the mean of the data points assigned to it.

% Useful variables
[m n] = size(X);

% You need to return the following variables correctly.
centroids = zeros(K, n);

% Goes over every centroid and compute mean of all points that belong to it. 
for i=1:K,
  centroids(i,:)=mean(X(find(idx==i),:),1);
endfor

end

