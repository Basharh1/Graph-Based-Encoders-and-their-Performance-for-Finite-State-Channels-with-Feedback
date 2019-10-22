# Overview
This repository contains an implementation of a technique to compute upper and lower bounds on the capacity of unifilar finite-state channels (FSCs) with feedback. The theoretical background of the technique are presented in the following paper:

[Graph-Based Encoders and their Performance for Finite-State Channels with Feedback](https://arxiv.org/abs/1907.08063), by Oron sabag, Bashar Huleihel, Haim Permuter.

# Main files
The following Matlab files, found in the code directory, are the most relevant for this project:  
- [main_GTable.m](https://github.com/Basharh1/Bounds_on_Finite_State_Channels/blob/master/Code/Main_GTable.m)  -  The main interface where you set up the model and run it to obtain the bounds.  
- [Create_Channel.m](https://github.com/Basharh1/Bounds_on_Finite_State_Channels/blob/master/Code/Create_Channel.m) - In this function you can add a channel model: P_{Y|X,S}.  
- [Create_S.m](https://github.com/Basharh1/Bounds_on_Finite_State_Channels/blob/master/Code/Create_S.m) - In this function you can add a state evaluation function: S^+ = f(S,X,Y).  

# Instructions
1.) Add a channel model by following the instructions in [Create_Channel.m](https://github.com/Basharh1/Bounds_on_Finite_State_Channels/blob/master/Code/Create_Channel.m).  

2.) Add a state evaluation function by following the instructions in [Create_S.m](https://github.com/Basharh1/Bounds_on_Finite_State_Channels/blob/master/Code/Create_S.m).

3.) Open [main_GTable.m](https://github.com/Basharh1/Bounds_on_Finite_State_Channels/blob/master/Code/Main_GTable.m) file. Then:
- Type the cardinalities of the channel state (FSC.s), the channel input (FSC.x), and the channel output (FSC.y).
- Choose the channel model (FSC.channel), the channel state evaluation (FSC.state), and the channel parameter (FSC.Ch_para).
- Type which approach you would like to use for the choice of the Q-graphs (Graph.meth). The proposed approaches are described in the paper.

