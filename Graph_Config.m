function [G,CARD] = Graph_Config(Graph,CARD)
%This is a list of indices for graphs
%with the format: |Q_A|_|Y_A|

if strcmp(Graph.meth,'GP')
    FILE = strcat('G_',num2str(Graph.meth_para),'_',num2str(CARD.y),'.mat');
    load(FILE);
    CARD.q = Q_A;
    CARD.sq = CARD.s*CARD.q;
    CARD.J  = CARD.sq*CARD.sq*CARD.x*CARD.y;
    CARD.LB_exp = Graph.LB_EXP;
elseif strcmp(Graph.meth,'Markov')
    G = 1:Graph.meth_para;
    CARD.q = 1;
    CARD.sq = CARD.s*CARD.q;
    CARD.J  = CARD.sq*CARD.sq*CARD.x*CARD.y;
    CARD.LB_exp = Graph.LB_EXP;
elseif strcmp(Graph.meth,'SingleGraph')
    load('SingleGraph.mat');
    G = Qmat;
    CARD.q = size(G,1);
    CARD.sq = CARD.s*CARD.q;
    CARD.J  = CARD.sq*CARD.sq*CARD.x*CARD.y;
    CARD.LB_exp = Graph.LB_EXP;
else    
    disp('Graph method not defined');
end

