function idx = findClosestCentroids(X, centroids)
% computes the centroid memberships for examples, each row - a single example. 
% idx = m x 1 vector of centroid assignments (i.e. each entry in range [1..K])

K = size(centroids, 1);
idx = zeros(size(X,1), 1);

% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K

for i=1:size(idx, 1),
  len_temp=99999;
  for j=1:K,
    len=sum((X(i,:)-centroids(j,:)).^2);
    if len<len_temp,
      len_temp=len;
      idx(i)=j;
    endif
  endfor
endfor

end