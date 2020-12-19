function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
%C = 1;
%sigma = 0.3;

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
c_list = [0.01,0.03,0.1,0.3,1,3,10,30];
s_list = [0.01,0.03,0.1,0.3,1,3,10,30];

results = zeros(length(c_list)*length(s_list),3);


row = 1;
for current_c = c_list,
    for current_sigma = s_list,
    	model= svmTrain(X, y, current_c, @(x1, x2) gaussianKernel(x1, x2, current_sigma));
		predictions = svmPredict(model, Xval);
    	err_val = mean(double(predictions ~= yval));
        results(row,:) = [current_c current_sigma err_val];
        row = row + 1;
    end
end


[v,i] = min(results(:,3));

C = results(i,1);
sigma = results(i,2);

% =========================================================================

end
