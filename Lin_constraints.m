function [Aeq,Beq] = Lin_constraints(J_NonVAr,Ch,CARD)

% Channel constraints - preserve p(y|x,s)
[Ac,Bc] = Channel_Constraints(J_NonVAr,Ch,CARD);

% Flow constraints (stationary distr.)
[Af,Bf] = Flow_constraints(J_NonVAr,CARD);                

% PMF constraint
[Ap,Bp] = PMF_constraint(CARD);

Aeq = [Ac;Af;Ap];
Beq = [Bc,Bf,Bp];

% Comments:
% B1 = Random_Graph_Constraints(SQ,Q,VEC_A);