load('ex6data3.mat');


values = zeros(64,3);

vals = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30]

ctr_i=0;


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

values = sortrows(values,-3);
values(1,:)