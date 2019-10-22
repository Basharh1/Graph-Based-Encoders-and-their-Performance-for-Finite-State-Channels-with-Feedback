function [UB,LB] = Markov_Optimization(G_List,Ch_Mat,S_Mat,CARD)
for j = 1 : length(G_List) + 1
    Order               = j-1;
    CARD.q              = CARD.y^j;
    CARD.sq             = CARD.s*CARD.q;
    CARD.J              = CARD.sq*CARD.sq*CARD.x*CARD.y;
    Conditional         = Create_Conditional(CARD,Ch_Mat);
    Q_Mat               = Create_G_Markov(CARD);
    J_NonVar            = Create_Joint(S_Mat,Q_Mat,Ch_Mat,CARD);
    [UB(j),LB(j)]       = Graph_Optimization(J_NonVar,Ch_Mat,Conditional,CARD,Q_Mat);
end