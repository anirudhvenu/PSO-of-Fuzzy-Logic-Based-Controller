tic 
clc 
clear all 
close all 
rng default 
parameters ;  
LowerLimit=[0 0 3000];         % lower limits of variables %
UpperLimit=[15 15 5000];      % upper limits of variables %
  
% pso parameters values %
m=3;            % number of variables %
n=4;          % population size %
w=0.9;       % inertia weight %
c1=1.2;           % acceleration factor %
c2=1.4;           % acceleration factor %
  
% pso main program start %
max_iterations= 15 ;    % set maximum number of iteration  

max_no_runs=1;      % set maximum number of runs need to be 
for run=1:max_no_runs 
    run 
    % pso initialization start %
    for i=1:n 
        for j=1:m 
            x0(i,j)=round(LowerLimit(j)+rand()*(UpperLimit(j)-LowerLimit(j))); 
        end 
    end 
    x=x0;       % initial population %
    for i=1:n 
        for j=1:m 
            v(i,j)=(round(LowerLimit(j)+rand()*(UpperLimit(j)-LowerLimit(j))))*.1; 
        end 
    end 
    
    for i=1:n 
        A = x0(i,1);
        B = x0(i,2) ;
        C = x0(i,3) ;
        sim('ActiveSuspensionv2');
        
        f0(i,1) = obj.Data(end);
        


    end 
    [fmin0,index0]=min(f0);     
    ParticleBest=x0;               % initial ParticleBest 
    GlobalBest=x0(index0,:);     % initial GlobalBest 
    % pso initialization end %
     
    % pso algorithm start %
    Iteration=1;     
    while Iteration<=max_iterations 
         
      
  
        % pso velocity updates %
        for i=1:n 
            for j=1:m 
                v(i,j)=w*v(i,j)+c1*rand()*(ParticleBest(i,j)-x(i,j))... 
                        +c2*rand()*(GlobalBest(1,j)-x(i,j)); 
            end 
        end 
  
        % pso position update %
        for i=1:n 
            for j=1:m 
                x(i,j)=x(i,j)+v(i,j); 
            end 
        end 
  
        % handling boundary violations %
        for i=1:n 
            for j=1:m 
                if x(i,j)<LowerLimit(j) 
                    x(i,j)=LowerLimit(j); 
                elseif x(i,j)>UpperLimit(j) 
                    x(i,j)=UpperLimit(j); 
                end 
            end 
        end 
  
        % evaluating fitness %
        for i=1:n 
            A = x(i,1);
            B = x(i,2) ;
            C = x(i,3) ;
            sim('ActiveSuspensionv2');
        
            f(i,1) = obj.Data(end);

        end 
  
        % updating ParticleBest and fitness %
        for i=1:n 
            if f(i,1)<f0(i,1) 
                ParticleBest(i,:)=x(i,:); 
                f0(i,1)=f(i,1); 
            end 
        end 
  
        [fmin,index]=min(f0);   % finding out the best particle 
        ffmin(Iteration,run)=fmin;    % storing best fitness 
        ffite(run)=Iteration;         % storing iteration count 
  
        % updating GlobalBest and best fitness %
        if fmin<fmin0 
            GlobalBest=ParticleBest(index,:); 
            fmin0=fmin; 
        end     

  
        % displaying iterative results %
        if Iteration==1 
            disp(sprintf('Iteration    Best particle    Objective function')); 
        end 
        disp(sprintf('%8g  %8g          %8.4f',Iteration,index,fmin0));     
        Iteration=Iteration+1; 
    end 
    % pso algorithm %
    GlobalBest; 
    fff(run)=fmin0; 
    rgbest(run,:)=GlobalBest; 
    A
    B
    C
end 
% pso main program end %
disp(sprintf('\n')); 


[BestFunction,bestrun]=min(fff) 
best_variables=rgbest(bestrun,:) 

toc 
  
% PSO convergence characteristic 

plot(ffmin(1:ffite(bestrun),bestrun),'-k'); 
xlabel('No of Iterations'); 
ylabel('Fitness function value'); 
title('PSO convergence') 
disp('\n')
disp('The optimized values of A, B and C are :')
A
B
C


