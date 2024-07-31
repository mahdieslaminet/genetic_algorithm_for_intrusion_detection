function A_new = population_update(A,BERs)
% See Algorithm 4 in the paper
[~,idx]=sort(BERs);
A_new=zeros(20,size(A,2));
A_new(1:5,:) = A( idx(1:5),: );
for i=1:5
    A_new(5+i,:) = mutation(A_new(i,:));
end
A_new(11,:) = crossover(A_new(1,:),A_new(2,:));
A_new(12,:) = crossover(A_new(1,:),A_new(3,:));
A_new(13,:) = crossover(A_new(1,:),A_new(4,:));
A_new(14,:) = crossover(A_new(1,:),A_new(5,:));
A_new(15,:) = crossover(A_new(2,:),A_new(3,:));
A_new(16,:) = crossover(A_new(2,:),A_new(4,:));
A_new(17,:) = crossover(A_new(2,:),A_new(5,:));
A_new(18,:) = crossover(A_new(3,:),A_new(4,:));
A_new(19,:) = crossover(A_new(3,:),A_new(5,:));
A_new(20,:) = crossover(A_new(4,:),A_new(5,:));
end
