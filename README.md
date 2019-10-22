# Overview
This repository contains an implementation of a technique to compute upper and lower bounds on the capacity of unifilar finite-state channels (FSCs) with feedback. The theoretical background of the technique is presented in the following paper:

[Graph-Based Encoders and their Performance for Finite-State Channels with Feedback](https://arxiv.org/abs/1907.08063), by Oron sabag, Bashar Huleihel, Haim Permuter.

# Convex optimization tool - CVX
The upper bound is formalized as a standard convex optimization problem. For the implementation, we used a Matlab package called CVX with the Sedumi solver. To learn about what CVX is and how to use it, please visit [here](http://cvxr.com/cvx/)

# Plug and play
The following file is the main file:
- [main_GTable.m](https://github.com/Basharh1/Bounds_on_Finite_State_Channels/blob/master/Code/Main_GTable.m) 

To evalute the bounds, all you need is to choose in the main file:
1. Cardinalities of the channel state, input and output (FSC.y).
2. Finite-state channel from the pre-defined list and its channel parameter.
3. State evolution from the pre-defined list.
4. Choose the graphs construction to use - if you are unsure, a good start is the default 'GP' with parameter '2'.

# Instructions
1.) Add a channel model by following the instructions in [Create_Channel.m](https://github.com/Basharh1/Bounds_on_Finite_State_Channels/blob/master/Code/Create_Channel.m).  

2.) Add a state evaluation function by following the instructions in [Create_S.m](https://github.com/Basharh1/Bounds_on_Finite_State_Channels/blob/master/Code/Create_S.m).

3.) Open [main_GTable.m](https://github.com/Basharh1/Bounds_on_Finite_State_Channels/blob/master/Code/Main_GTable.m) file. Then:


- [Create_Channel.m](https://github.com/Basharh1/Bounds_on_Finite_State_Channels/blob/master/Code/Create_Channel.m) - In this function you can add a channel model: P_{Y|X,S}.  
- [Create_S.m](https://github.com/Basharh1/Bounds_on_Finite_State_Channels/blob/master/Code/Create_S.m) - In this function you can add a state evolution: S^+ = f(S,X,Y).  
