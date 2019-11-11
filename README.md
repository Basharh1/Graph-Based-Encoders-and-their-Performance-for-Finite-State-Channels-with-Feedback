# Overview
This repository contains an implementation of a technique to compute upper and lower bounds on the capacity of unifilar finite-state channels with feedback. The theoretical background of the technique is presented in the following paper:

[Graph-Based Encoders and their Performance for Finite-State Channels with Feedback](https://arxiv.org/abs/1907.08063), by Oron sabag, Bashar Huleihel, Haim Permuter.

# Convex optimization tool - CVX
For the implementation of the upper bound, we used CVX with the Sedumi solver. To download the CVX package, please visit  [http://cvxr.com/cvx](http://cvxr.com/cvx/).  

# Plug and play
The following file is the main file:
- [main_GTable.m](https://github.com/Basharh1/Bounds_on_Finite_State_Channels/blob/master/Code/Main_GTable.m) 

The default parameters will evaluate the bounds with respect 

# Choose a FSC from a list 
To evalute the bounds, all you need is to choose in the main file:
1. Cardinalities of the channel state, input and output.
2. Finite-state channel from the pre-defined list and its channel parameter.
3. State evolution from the pre-defined list.
4. Choose the graphs construction to use - if you are unsure, a good start is the default 'GP' with parameter '2'.  

# Create your own FSC
Further, you can add your own finite-state channel model by following the instructions given in the Matlab functions [Create_Channel.m](https://github.com/Basharh1/Bounds_on_Finite_State_Channels/blob/master/Code/Create_Channel.m) and [Create_S.m](https://github.com/Basharh1/Bounds_on_Finite_State_Channels/blob/master/Code/Create_S.m).
