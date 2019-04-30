function x = emailFeatures(word_indices)
%EMAILFEATURES takes in a word_indices vector and produces a feature vector
%from the word indices
n = 1899;

x = zeros(n, 1);

% Take one such word_indices vector and construct a binary feature vector 
% that indicates whether a particular word occurs in the email. 
% That is, x(i) = 1 when word i is present in the email.

x(word_indices)=1;

end
