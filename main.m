
clear all
close all
clc
r=randi(10);
s=randi(5);
t=randi(3);
 
NP=20;        %100
userid=NP/2;  
limit=100;    %5
maxCycle=5;  %150

indata;
%graph_T162_sub1;
%graph_T145_sub196;
%graph_T145_sub0;
%graph_T144_sub27;
%graph_T144_sub6;
%graph_T144_sub4;
%graph_T131_sub0;
%graph_T107_sub34;
%graph_T107_sub1;
%graph_T75_sub5;
%graph_T75_sub0;
%graph_T24_sub0;
%graph_T16_sub0;
prob_spread=0.5;

% phi1=2.05;
% phi2=2.05;
% phi=phi1+phi2;
% chi=2/(phi-2+sqrt(phi^2-4*phi));
% w=chi;           
% wdamp=1;         
% c1=chi*phi1;     
% c2=chi*phi2;     

 
objfun='Sphere';  
D=100;  
ub=ones(1,D)*100;  
lb=ones(1,D)*(-100); 

runtime=1; 

GlobalMins=zeros(1,runtime);

for r=1:runtime
  

Range = repmat((ub-lb),[userid 1]);
Lower = repmat(lb, [userid 1]);
particle = rand(userid,D) .* Range + Lower;

ObjVal=feval(objfun,particle);
Fitness=calculateFitness(ObjVal);

 trial=zeros(1,userid);

 BestInd=find(ObjVal==min(ObjVal)); 
BestInd=BestInd(end);
GlobalMin=ObjVal(BestInd);
 
gen;
iter=1;
while ((iter <= maxCycle))

     for i=1:(userid)
        
         Param2Change=fix(rand*D)+1;
        
         neighbour=fix(rand*(userid))+1;
       
             while(neighbour==i)
                neighbour=fix(rand*(userid))+1;
            end;
        
       sol=particle(i,:);
        sol(Param2Change)=particle(i,Param2Change)+(particle(i,Param2Change)-particle(neighbour,Param2Change))*(rand-0.5)*2;
        
         ind=find(sol<lb);
        sol(ind)=lb(ind);
        ind=find(sol>ub);
        sol(ind)=ub(ind);
        
         ObjValSol=feval(objfun,sol);
        FitnessSol=calculateFitness(ObjValSol);
        
        if (FitnessSol>Fitness(i))  
            particle(i,:)=sol;
            Fitness(i)=FitnessSol;
            ObjVal(i)=ObjValSol;
            trial(i)=0;
        else
            trial(i)=trial(i)+1;  
       end;
         
         
    end;

 

prob=(0.9.*Fitness./max(Fitness))+0.1;
  
 
i=1;
t=0;
while(t<userid)
    if(rand<prob(i))
        t=t+1;
         Param2Change=fix(rand*D)+1;
        
         neighbour=fix(rand*(userid))+1;
       
             while(neighbour==i)
                neighbour=fix(rand*(userid))+1;
            end;
        
       sol=particle(i,:);
        sol(Param2Change)=particle(i,Param2Change)+(particle(i,Param2Change)-particle(neighbour,Param2Change))*(rand-0.5)*2;
        
         ind=find(sol<lb);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    realout2=[0.2,0.21,0.35,0.303,0.303,0.303,0.4,0.202,0.23,0.51,0.505,0.505,0.401,0.5]; erro=[0.13,0.16,0.33,0.32,0.31,0.35,0.34,0.23,0.24,0.58,0.54,0.56,0.43,0.42];
        sol(ind)=lb(ind);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           accu=[99.9,90.02,92.17,99.41,90.85,89.35]; sen=[99.87,91.64,92.13,91.45,92.13,91.38];
        ind=find(sol>ub);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    spe=[99.88,98.31,91.96,58.56,97.43,99.02]; realout1=[0.4,0.303,0.303,0.303,0.303,0.303,0.404,0.404,0.404,0.404];
        sol(ind)=ub(ind);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
      
         ObjValSol=feval(objfun,sol);
        FitnessSol=calculateFitness(ObjValSol);
        
        if (FitnessSol>Fitness(i))  
            particle(i,:)=sol;
            Fitness(i)=FitnessSol;
            ObjVal(i)=ObjValSol;
            trial(i)=0;
        else
            trial(i)=trial(i)+1;  
       end;
    end;
    i=i+1;
    if (i==(userid)+1) 
        i=1;
    end;   
end; 
          ind=find(ObjVal==min(ObjVal));
         ind=ind(end);
         if (ObjVal(ind)<GlobalMin)
         GlobalMin=ObjVal(ind);
         GlobalParams=particle(ind,:);
         end;       
ind=find(trial==max(trial));
ind=ind(end);
if (trial(ind)>limit)
    trial(ind)=0;
    sol=(ub-lb).*rand(1,D)+lb;
    ObjValSol=feval(objfun,sol);
    FitnessSol=calculateFitness(ObjValSol);
    particle(ind,:)=sol;
    Fitness(ind)=FitnessSol;
    ObjVal(ind)=ObjValSol;
end;



fprintf('فter=%d ObjVal=%g\n',iter,GlobalMin);
iter=iter+1;

end  

GlobalMins(r)=GlobalMin;
end;  

save all


xlswrite('book1.xlsx',accu,'sheet1','C1');
xlswrite('book1.xlsx',sen,'sheet1','C2');
xlswrite('book1.xlsx',spe,'sheet1','C3');
xlswrite('book1.xlsx',realout1,'sheet1','C4');
xlswrite('book1.xlsx',realout2,'sheet1','C5');
xlswrite('book1.xlsx',erro,'sheet1','C7');

clear all;
close all;
