function [UB,LB] = Graph_Optimization(J_NonVar,Channel,Conditional,CARD,Q)

[Aeq,Beq] = Lin_constraints(J_NonVar,Channel,CARD);

[UB,UB_Inputs,UB_Joint] = UB_CVX(J_NonVar,Conditional,Aeq,Beq,CARD);

[LB,LB_Inputs] = LB_Fmincon(J_NonVar,Conditional,CARD,Aeq,Beq,Q);
end