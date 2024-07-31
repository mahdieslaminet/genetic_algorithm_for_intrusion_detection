function GenAlg_Based_Polar_Design
rng('shuffle');
data = load('population1.mat');
N = data.N;
k = data.k;
A = data.A;
clear data;
 pop_index = 1;
name = ['population' num2str(pop_index) '.mat'];
[BERs] = compute_BER(A);
save(name,'A','BERs');
while true 
    pop_index = pop_index + 1;
    name = ['population' num2str(pop_index) '.mat'];
    A = population_update(A,BERs);
    A=logical(A);
    [BERs] = compute_BER(A);
    save(name,'A','BERs');
end
end
