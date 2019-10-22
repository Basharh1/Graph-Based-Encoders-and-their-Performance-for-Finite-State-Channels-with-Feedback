function J_VAR = LB_Joint(mat_var,J_NonVar,CARD)

J_VAR_inputs = Joint_Subs_inputs(mat_var, J_NonVar, CARD);
J_VAR       = Joint_Subs_Stationary(J_VAR_inputs, CARD);