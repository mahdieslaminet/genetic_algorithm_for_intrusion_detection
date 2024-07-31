function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
 
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

 m = size(X, 1);
         
 J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));
D2=zeros(size(Theta2));
D1=zeros(size(Theta1));

 
disp(size(y));
a1=X;
a1=[ones(m,1) a1];
z2=a1*Theta1';
a2=sigmoid(z2);
a2=[ones(size(a2,1),1) a2];
z3=a2*Theta2';
a3=sigmoid(z3);
h=a3;
h=h';
disp(size(h));


yMatrix = zeros(num_labels, m);

for i=1:num_labels,
    yMatrix(i,:) = (y==i);
end

Theta1R=Theta1(:,2:end);
Theta2R=Theta2(:,2:end);

J = (sum( sum( -1*yMatrix.*log(h) - (1 - yMatrix).*log(1-h) ) ))/m;

reg=lambda*(sum(sum(Theta1R.^2))+sum(sum(Theta2R.^2)))/(2*m);

J=J+reg;
 
%
X = [ones(m,1) X];
for t=1:m
    a1=X(t,:);
    z2=Theta1*a1';
   
    a2=sigmoid(z2);
    a2=[1; a2];
    z3=Theta2*a2;
    a3=sigmoid(z3);
    d3=a3-yMatrix(:,t);

    z2 = [1 ; z2];
    d2=(Theta2'*d3).*sigmoidGradient(z2);
    
    d2=d2(2:end);
    
    D2=D2+d3*a2';
    
    D1=D1+d2*a1;
    
    
end
Theta1_grad(:,1)=D1(:,1)/m;
Theta2_grad(:,1)=D2(:,1)/m;

Theta1_grad(:,2:end)=(D1(:,2:end)/m)+(lambda*Theta1(:,2:end)/m);

Theta2_grad(:,2:end)=(D2(:,2:end)/m)+(lambda*Theta2(:,2:end)/m);

 
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
