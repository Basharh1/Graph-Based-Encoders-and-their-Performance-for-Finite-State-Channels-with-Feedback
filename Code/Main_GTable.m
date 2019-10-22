clear all
clc

% Main for the Q-graph LB and UB
FSC.s       = 2;
FSC.x       = 2;
FSC.y       = 2;
FSC.channel = 'ZS';     % 'BEC'/ 'BSC'/ 'ZS'(ising and Trapdoor)/ 'Pilot'/ 'Fading'/ 'DEC'/ 'Z_channel'
FSC.state   = 'S=X';    % 'DMC'/ 'S=X'/ 'S=Y'/ 'XOR(SXY)'/ 'XOR(SX)' / 'No_consecutive'/ 'Trapdoor_M'/ 'Fading_Type2'
FSC.Ch_para = 0.5;      % Channel parameters: scalar or vector.

Graph.meth      = 'GP'; % Choose method: 'GP'/ 'Markov'/ 'SingleGraph'
Graph.meth_para = 2;    % For 'GP' choose 1,...6. For 'Markov', up to 8.
Graph.LB_EXP    = 1;    % No. of experiments in the LB (initial random points). Default = 5.
tic
[UB,LB] = Bounds_optimization(Graph,FSC);
toc
[Best_UB,Q_UB_index] = min(UB);
[Best_LB,Q_LB_index] = max(LB);