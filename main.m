clear all
clc
format long
SearchAgents_no=50; % Number of search agents
Function_name='F1';
   
Max_iteration=500; % Maximum number of iterations
[lb,ub,dim,fobj]= Unimodal_Functions(Function_name);
[Best_score,Best_pos,Convergence_curve]=FFA(SearchAgents_no,Max_iteration,lb,ub,dim,fobj);
% function topology
figure('Position',[500 500 660 290])
subplot(1,2,1);
func_plot(Function_name);
title('Function Topology');
xlabel('x_1');
ylabel('x_2');
zlabel([Function_name,'( x_1 , x_2 )'])
% Convergence curve
subplot(1,2,2);
semilogy(Convergence_curve,'Color','r')
title('Objective space')
xlabel('Iteration');
ylabel('Best score obtained so far');
display(['The best solution obtained by FFA is : ', num2str(Best_pos,10)]);
display(['The best optimal value of the objective function found by FFA is : ', num2str(Best_score,10)]);
disp(sprintf('--------------------------------------'));
