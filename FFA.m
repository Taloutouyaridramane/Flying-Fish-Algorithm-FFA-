
%_________________________________________________________________________
%  Flying Fish Algorithm (FFA) source code 
%
%  
% paper:
% Taloutou Yari DRAMANE,*, Seyedali MIRJALILI, Ali YASAR
% Flying Fish Algorithm (FFA): for solving real-world optimiza-tion problems 
%  
%  
% E-mails: 228173002007@ogr.selcuk.edu.tr; djougou1994@gmail.com            Taloutou Yari DRAMANE 
%          ali.mirjalili@torrens.edu.au                                     Seyedali MIRJALILI
%          aliyasar@selcuk.edu.tr                                           Ali YASAR
%_________________________________________________________________________


function [Top_flyingFish_fit,Top_flyingFish_pos,Convergence_curve]=FFA(SearchAgents_no,Max_iter,lb,ub,dim,fobj)
disp('FFA is now tackling your problem')


Top_flyingFish_pos=zeros(1,dim);
Top_flyingFish_fit=inf; 
Convergence_curve=zeros(1,Max_iter);
stepsize=zeros(SearchAgents_no,dim);
fitness=inf(SearchAgents_no,1);
flyingFish=initialization(SearchAgents_no,dim,ub,lb);
  
Xmin=repmat(ones(1,dim).*lb,SearchAgents_no,1);
Xmax=repmat(ones(1,dim).*ub,SearchAgents_no,1);
         
Iter=0;  %Loop Counter
FFRs=0.12; % Fish Failure Rates per year = Predator Success Rates 

v=rand(); %initial Velocity of FF


%Main Loop
while Iter<Max_iter    
     %------------------- Evaluating top flyingFish -----------------    
 for i=1:size(flyingFish,1)  
        
    Flag4ub=flyingFish(i,:)>ub;
    Flag4lb=flyingFish(i,:)<lb;    
    flyingFish(i,:)=(flyingFish(i,:).*(~(Flag4ub+Flag4lb)))+ub.*Flag4ub+lb.*Flag4lb;                    
        
    fitness(i,1)=fobj(flyingFish(i,:));
                     
     if fitness(i,1)<Top_flyingFish_fit 
       Top_flyingFish_fit=fitness(i,1); 
       Top_flyingFish_pos=flyingFish(i,:);
     end          
 end
     
     %------------------- Keeping tract of fitness values------------------- 
    
 if Iter==0
   fit_old=fitness;    Prey_old=flyingFish;
 end
     
  Inx=(fit_old<fitness);
  Indx=repmat(Inx,1,dim);
  flyingFish=Indx.*Prey_old+~Indx.*flyingFish;
  fitness=Inx.*fit_old+~Inx.*fitness;
        
  fit_old=fitness;    Prey_old=flyingFish;
     %------------------------------------------------------------   
     
 Elite=repmat(Top_flyingFish_pos,SearchAgents_no,1);  
 C=2; % a constant
 Q =(1-Iter/Max_iter)^(C*Iter/Max_iter);
 
 beta=15;
 alpha= 35;
 T1= 0.0418*sin(2*beta) ;
 T2 = 0.0418*sin(2*alpha);
                             
 RL=0.05*levy(SearchAgents_no,dim,1.5);   %Levy random number vector
 
           
  for i=1:size(flyingFish,1)
     for j=1:size(flyingFish,2)        
       
       r=rand();
       R=rand();
       
       
          %------------------ Exploitation ------------------- 
       if v<0.5 
          stepsize(i,j)= RL(i,j)*(Elite(i,j)- RL(i,j)*flyingFish(i,j));                    
          flyingFish(i,j)=flyingFish(i,j)+v*r*stepsize(i,j); 
             
          %--------------- Exploration----------------
       else 
          
         if R<0.5 
            stepsize(i,j)= T1*(T1*Elite(i,j))- flyingFish(i,j);
            flyingFish(i,j)= Elite(i,j)+ Q*stepsize(i,j); %Unsteady gliding level flight
         else
            stepsize(i,j)= T2*(T2*Elite(i,j))- flyingFish(i,j);
            flyingFish(i,j)=flyingFish(i,j)+ R*stepsize(i,j); %Steady gliding flight  
         end  
         
          
       end  
      end                                         
  end    
        
     %------------------ Updating top flyingFish ------------------        
  for i=1:size(flyingFish,1)  
        
    Flag4ub=flyingFish(i,:)>ub;  
    Flag4lb=flyingFish(i,:)<lb;  
    flyingFish(i,:)=(flyingFish(i,:).*(~(Flag4ub+Flag4lb)))+ub.*Flag4ub+lb.*Flag4lb;
  
    fitness(i,1)=fobj(flyingFish(i,:));
        
      if fitness(i,1)<Top_flyingFish_fit 
         Top_flyingFish_fit=fitness(i,1);
         Top_flyingFish_pos=flyingFish(i,:);
      end     
  end
        
     %---------------------- Updating history of fitness values ----------------
    
 if Iter==0
    fit_old=fitness;    Prey_old=flyingFish;
 end
     
    Inx=(fit_old<fitness);
    Indx=repmat(Inx,1,dim);
    flyingFish=Indx.*Prey_old+~Indx.*flyingFish;
    fitness=Inx.*fit_old+~Inx.*fitness;
        
    fit_old=fitness;    Prey_old=flyingFish;
     %---------- Applying FERs ----------- 
                             
  if rand()<FFRs
     U=rand(SearchAgents_no,dim)<FFRs;                                                                                              
     flyingFish=flyingFish+ Q*((Xmin+rand(SearchAgents_no,dim).*(Xmax-Xmin)).*U);
  else
     r=rand();  Rs=size(flyingFish,1);
     stepsize=(FFRs*(1-r)+r)*(flyingFish(randperm(Rs),:)-flyingFish(randperm(Rs),:));
     flyingFish=flyingFish+stepsize;
  end
                                                        
  Iter=Iter+1;  
  Convergence_curve(Iter)=Top_flyingFish_fit; 
       
end
