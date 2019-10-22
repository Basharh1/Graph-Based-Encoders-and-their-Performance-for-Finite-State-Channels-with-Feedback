function [LB, LB_Inputs] = LB_Fmincon(J_NonVar,Conditional,CARD,Aeq,Beq,Q)
warning off;
% options = optimoptions(@fmincon,'Algorithm','sqp','MaxIterations',1500);
options = optimoptions(@fmincon,'Algorithm','sqp'); % For Matlab 2015
LB = 0;
Num_var = (CARD.x - 1)*CARD.s*CARD.q;
LB_Inputs = zeros(Num_var, 1);
lb = zeros(Num_var,1)';
ub = ones(Num_var, 1)';

for i = 1: CARD.LB_exp
    x0 = (1/(CARD.x-1))*rand(Num_var, 1);
    [x,fval] = fmincon(@(x)Create_ofun(x,J_NonVar,CARD,Conditional),x0,[],[],[],[],lb,ub,@(x)funConditions(x,J_NonVar,CARD,Q,Aeq,Beq),options);
    [error,inequ] = ReturnError(x, J_NonVar, CARD, Q, Aeq, Beq);
    if (abs(error) < ((10^(-5))*ones(length(error),1)))
        if ((-fval) > 10000*LB) && (inequ <= 0)
            LB = -fval/10000;
            LB_Inputs = x;
        end
    end
end