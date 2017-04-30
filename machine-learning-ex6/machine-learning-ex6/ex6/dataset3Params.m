function [C, sigma] = dataset3Params(X, y, Xval, yval)

%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;


values = zeros(64,3);

vals = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30]

ctr_i=0;


% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%
	
for i = vals
	
for j = vals

	C_temp = i;
	sig_temp = j;

	model= svmTrain(X, y, C_temp, @(x1, x2) gaussianKernel(x1, x2, sig_temp));
	predictions = svmPredict(model, Xval);
	err = mean(double(predictions ~= yval));
	ctr_i = ctr_i + 1;
	values(ctr_i,:) = [i, j, err];
	


endfor
endfor

values = sortrows(values,3);

C = values(1,1,1);
sigma = values(1,2,1);





% =========================================================================

end
