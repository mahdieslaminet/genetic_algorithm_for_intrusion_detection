function A3 = crossover(A1,A2)
 
A3=zeros(size(A1));
flag = randsrc(1,1,[0 1;0.5 0.5]);
if flag
    A3(1:length(A3)/2) = A1(1:length(A3)/2);
    A3(1+length(A3)/2:end) = A2(1+length(A3)/2:end);
else
    A3(1:length(A3)/2) = A2(1:length(A3)/2);
    A3(1+length(A3)/2:end) = A1(1+length(A3)/2:end);
end
if sum(A3)~=sum(A2)
    A3 = mutation_restore_rate(A3,(sum(A2)/length(A2)));
end
end
