function [c, ceq] = funConditions(x_var, J_NonVar, CARD, Q, Aeq, Beq)
mat_var = reshape(x_var, [CARD.sq, CARD.x - 1]);
mat_var(:,CARD.x) = 1 - sum(mat_var(:,:),2);
J_VAR = LB_Joint(mat_var, J_NonVar, CARD);

ceq1 = BCJR_cond(Q,J_VAR,CARD)';
ceq2 = Aeq*reshape(J_VAR,[CARD.J 1]) - Beq';

ceq = [ceq1;ceq2];
c = [];