clear all
clc

% Cardinalities of the channel parameters
FSC.s       = 2; %channel state
FSC.x       = 2; %channel input
FSC.y       = 2; %channel output

% The channel
FSC.channel = 'ZS';     % 'BEC'/ 'BSC'/ 'Ising'/ 'Trapdoor'/ 'Pilot'/ 'Fading'/ 'DEC'/ 'Z_channel'
FSC.Ch_para = 0.5;      % Channel parameters: scalar or vector.

% The state evolution
FSC.state   = 'S=X';    % 'DMC'/ 'S=X'/ 'S=Y'/ 'XOR(SXY)'/ 'XOR(SX)' / 'No_consecutive'/ 'Trapdoor_M'/ 'Fading_Type2'

% The graphs construction method
Graph.meth      = 'GP'; % Choose method: 'GP'/ 'Markov'/ 'SingleGraph'
Graph.meth_para = 2;    % For 'GP' choose 1,...6. For 'Markov', up to 8.
Graph.LB_EXP    = 1;    % No. of experiments in the LB (initial random points). Default = 5.

tic
[UB,LB] = Bounds_optimization(Graph,FSC);
toc
[Best_UB,Q_UB_index] = min(UB);
[Best_LB,Q_LB_index] = max(LB);
