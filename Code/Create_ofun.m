function f = Create_ofun(x_var, J_NonVar, CARD, Conditional)
mat_var = reshape(x_var,[CARD.sq, CARD.x-1]);
mat_var(:,CARD.x) = 1 - sum(mat_var(:,:),2);

J_VAR = LB_Joint(mat_var, J_NonVar, CARD);
f = - 10000*LB_Compute_Objective(J_VAR, J_NonVar, Conditional, CARD)/log(2);