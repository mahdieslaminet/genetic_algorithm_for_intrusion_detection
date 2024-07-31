 clear ; close all; clc
 input_layer_size  = 37;   
hidden_layer_size = 25;    
num_labels = 2;                                  
 fprintf('Loading and Visualizing Data ...\n')
data=csvread('data.txt');
data(:,[1,2,3,4])=[];
y=data(:,[38]);
data(:,[38])=[];
X=data;
fprintf('Program paused. Press enter to continue.\n')
pause;
fprintf('\nInitializing Neural Network Parameters ...\n')
initial_Theta1 = randInitializeWeights(input_layer_size, hidden_layer_size);
initial_Theta2 = randInitializeWeights(hidden_layer_size, num_labels);
% Unroll parameters
initial_nn_params = [initial_Theta1(:) ; initial_Theta2(:)];
 fprintf('\nTraining Neural Network... \n')
 options = optimset('MaxIter', 50);
 lambda = 1;
 costFunction = @(p) nnCostFunction(p, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, X, y, lambda);

 [nn_params, cost] = fmincg(costFunction, initial_nn_params, options);

 Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));
fprintf('Program paused. Press enter to continue.\n');
pause;
pred = predict(Theta1, Theta2, X);
fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == y)) * 100);

