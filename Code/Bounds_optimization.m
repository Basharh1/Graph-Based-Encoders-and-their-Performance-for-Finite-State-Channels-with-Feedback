function [UB,LB] = Bounds_optimization(Graph,FSC)

[Ch_Mat,S_Mat,CARD] = FSC_Model(FSC);
[G_List,CARD]       = Graph_Config(Graph,CARD);
    
if strcmp(Graph.meth,'Markov')
    [UB,LB] = Markov_Optimization(G_List,Ch_Mat,S_Mat,CARD);
elseif strcmp(Graph.meth,'GP')
    [UB,LB] = GP_Optimization(G_List,Ch_Mat,S_Mat,CARD);
elseif strcmp(Graph.meth,'SingleGraph')
    [UB,LB] = SingleG_Optimization(G_List,Ch_Mat,S_Mat,CARD);
else
    disp('No-Graph');
end