function [UB,PX_SQ,J_Mat] = UB_CVX(J_NonVar,Conditional,Aeq,Beq,CARD)
V_A = sum(J_NonVar(:)>0);
cvx_begin quiet
    cvx_solver sedumi
    cvx_precision best
    variable x(V_A) nonnegative
    J_VAR = Joint_Subs(x,J_NonVar);
    UB_Obj = UB_Compute_Objective(J_VAR,J_NonVar,Conditional,CARD);
    maximize UB_Obj
    Aeq*reshape(J_VAR,[CARD.J 1]) == Beq'
cvx_end

UB = cvx_optval/log(2);
J_Mat = Joint_Subs(x,J_NonVar);
[PX_SQ, pi_SQ] = Joint_2_input(J_Mat,CARD);