function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);

% X is 300x2
%centroids is 3x2

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%

temp = zeros(size(centroids,1),1);

for i= 1:size(X)
	% X(i,:) each row
	for j = 1:size(centroids)
		
		%X(i,:)
		%centroids(j,:) 
		temp(j) = sum((X(i,:) - centroids(j,:)).^2);
	end
	[w,q] = min(temp);
	idx(i) = q;
end


% =============================================================

end

