function [UB,LB] = SingleG_Optimization(Q_Mat,Ch_Mat,S_Mat,CARD)

Conditional   = Create_Conditional(CARD,Ch_Mat);
J_NonVar      = Create_Joint(S_Mat,Q_Mat,Ch_Mat,CARD);
[UB,LB]       = Graph_Optimization(J_NonVar,Ch_Mat,Conditional,CARD,Q_Mat);
