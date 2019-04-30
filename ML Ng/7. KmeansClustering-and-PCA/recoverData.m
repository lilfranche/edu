function X_rec = recoverData(Z, U, K)
%RECOVERDATA Recovers an approximation of the original data when using the 
%projected data

% You need to return the following variables correctly.
X_rec = zeros(size(Z, 1), size(U, 1));

X_rec=Z*U(:,1:K)';

end
