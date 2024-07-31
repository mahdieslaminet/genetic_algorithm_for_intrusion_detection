function A2 = mutation_restore_rate(A1,rate)
% See Fig. 3b in the paper

flag = ( sum(A1)/length(A1) ) ~= rate;
while flag
    infoPos = find(A1==1);
    frozenPos = find(A1==0);
    if ( sum(A1)/length(A1) ) > rate
        A1(datasample(infoPos,1))=0;
    else
        A1(datasample(frozenPos,1))=1;
    end
    flag = ( sum(A1)/length(A1) ) ~= rate;
end
A2=A1;
end
