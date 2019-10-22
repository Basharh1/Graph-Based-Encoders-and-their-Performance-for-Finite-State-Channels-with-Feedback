function LB_Obj = LB_Compute_Objective(J_VAR,J_NonVar,Conditional,CARD)

Conditional = reshape(Conditional.*(J_NonVar>0),[1 CARD.J]);
[YQ,Q_DUP]  = Marginals(J_VAR,CARD);
LB_Obj      = -sum(Rel_entropy(YQ,Q_DUP)) + sum(Conditional.*reshape(J_VAR,[1 CARD.J]));