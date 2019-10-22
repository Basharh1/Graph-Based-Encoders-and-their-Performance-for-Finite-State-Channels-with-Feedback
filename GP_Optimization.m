function [UB,LB] = GP_Optimization(G_List,Ch_Mat,S_Mat,CARD)
Conditional             = Create_Conditional(CARD,Ch_Mat);
Q_Table                 = Create_Q_Table(CARD);

for j = 1: length(G_List)
    Q_Mat               = Graph_return(CARD,G_List(j),Q_Table);
    J_NonVar            = Create_Joint(S_Mat,Q_Mat,Ch_Mat,CARD);
    [UB(j),LB(j)]       = Graph_Optimization(J_NonVar,Ch_Mat,Conditional,CARD,Q_Mat);
end
