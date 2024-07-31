function A2 = mutation(A1)
% See Fig. 3a and Algorithm 5 in the paper
infoPos = find(A1==1);
frozenPos = find(A1==0);
A1(datasample(infoPos,1))=0;
A1(datasample(frozenPos,1))=1;
A2=A1;
end
