clc;
save all;
clear all;
close all;

 
CostFunction=@(x) Sphere(x);         

nVar=10;            

VarSize=[1 nVar];    
VarMin=-10;         
VarMax= 10;         


 
MaxIt=1000;       

nPop=100;         

 
w=1;             
wdamp=0.99;      
c1=1.5;          
c2=2.0;          

 
% phi1=2.05;
% phi2=2.05;
% phi=phi1+phi2;
% chi=2/(phi-2+sqrt(phi^2-4*phi));
% w=chi;          % Inertia Weight
% wdamp=1;        % Inertia Weight Damping Ratio
% c1=chi*phi1;    % Personal Learning Coefficient
% c2=chi*phi2;    % Global Learning Coefficient

 
VelMax=0.1*(VarMax-VarMin);
VelMin=-VelMax;

 

empty_particle.Position=[];
empty_particle.Cost=[];
empty_particle.Velocity=[];
empty_particle.Best.Position=[];
empty_particle.Best.Cost=[];

particle=repmat(empty_particle,nPop,1);

GlobalBest.Cost=inf;

for i=1:nPop
    
    
    particle(i).Position=unifrnd(VarMin,VarMax,VarSize);
    
    
    particle(i).Velocity=zeros(VarSize);
    
     
    particle(i).Cost=CostFunction(particle(i).Position);
    
     
    particle(i).Best.Position=particle(i).Position;
    particle(i).Best.Cost=particle(i).Cost;
    
     
    if particle(i).Best.Cost<GlobalBest.Cost
        
        GlobalBest=particle(i).Best;
        
    end
    
end

BestCost=zeros(MaxIt,1);

 

for it=1:MaxIt
    
    for i=1:nPop
        
        
        particle(i).Velocity = w*particle(i).Velocity ...
            +c1*rand(VarSize).*(particle(i).Best.Position-particle(i).Position) ...
            +c2*rand(VarSize).*(GlobalBest.Position-particle(i).Position);
        
        
        particle(i).Velocity = max(particle(i).Velocity,VelMin);
        particle(i).Velocity = min(particle(i).Velocity,VelMax);
        
       
        particle(i).Position = particle(i).Position + particle(i).Velocity;
        
         
        IsOutside=(particle(i).Position<VarMin | particle(i).Position>VarMax);
        particle(i).Velocity(IsOutside)=-particle(i).Velocity(IsOutside);
        
        particle(i).Position = max(particle(i).Position,VarMin);
        particle(i).Position = min(particle(i).Position,VarMax);
        
        
        particle(i).Cost = CostFunction(particle(i).Position);
        
         
        if particle(i).Cost<particle(i).Best.Cost
            
            particle(i).Best.Position=particle(i).Position;
            particle(i).Best.Cost=particle(i).Cost;
            
            
            if particle(i).Best.Cost<GlobalBest.Cost
                
                GlobalBest=particle(i).Best;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                pause(0.15);
                
               
            end
            
        end
        
    end
    
    BestCost(it)=GlobalBest.Cost;
    
    disp(['Generation ' num2str(it) ': Best Cost = ' num2str(BestCost(it))]);
    
    w=w*wdamp;
    
end

BestSol = GlobalBest;

 load all;

%figure;
 
%semilogy(BestCost,'LineWidth',2);
%xlabel('Iteration');
%ylabel('Best Cost');
%grid on;
