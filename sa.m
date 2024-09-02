clc;
clear;
close all;
%% Problem definition
model=CreateModel();  
CostFunction=@(tour) TourLength(tour,model);
%% SA Parameters
MaxIt=1000;    
MaxSubIt=10;    
T0=10;         
alpha=0.99;    
%% Initialization
sol.Position=CreateRandomSolution(model);
sol.Cost=CostFunction(sol.Position);
BestSol=sol;
BestCost=zeros(MaxIt,1);
T=T0;
%% SA MainLoop
for it=1:MaxIt
    
    for subit=1:MaxSubIt
        newsol.Position=CreateNeighbor(sol.Position);
        newsol.Cost=CostFunction(newsol.Position);
        
        if newsol.Cost<=sol.Cost 
            sol=newsol;
            
        else 
            DELTA=(newsol.Cost-sol.Cost)/sol.Cost;
             P=exp(-DELTA/T);
            if rand<=P
                sol=newsol;
            end
            
        end
       if sol.Cost<=BestSol.Cost
            BestSol=sol;
        end
    
    end
    
    BestCost(it)=BestSol.Cost;
    disp(['Iteration ' num2str(it) ': Best Cost = ' num2str(BestCost(it))]);
    
    T=alpha*T;
    
    figure(1);
    PlotSolution(BestSol,model);
    
end

%% Results
figure;
plot(BestCost,'LineWidth',2);
xlabel('Iteration');
ylabel('Best Cost');



