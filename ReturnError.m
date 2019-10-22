function [ceq,inequ] = ReturnError(x_var,J_NonVar,CARD,Q,Aeq,Beq)
mat_var = reshape(x_var,[CARD.sq, CARD.x-1]);
mat_var(:,CARD.x) = 1-sum(mat_var(:,:),2);
J_VAR = LB_Joint(mat_var, J_NonVar, CARD);

c = zeros(2*(CARD.x - 1)*CARD.sq, 1);
for i = 1: (CARD.x - 1)*CARD.sq
    c(2*i-1) = -x_var(i);
    c(2*i) = x_var(i)-1;
end

ceq1 = BCJR_cond(Q, J_VAR, CARD)';
ceq2 = Aeq*reshape(J_VAR,[CARD.J 1]) - Beq';
ceq = [ceq1; ceq2];
inequ = max(c);
