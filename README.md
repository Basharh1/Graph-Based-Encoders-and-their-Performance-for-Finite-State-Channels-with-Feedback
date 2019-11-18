# Overview
This repository contains an implementation of a technique to compute upper and lower bounds on the capacity of unifilar finite-state channels with feedback. The theoretical background of the technique is presented in the following paper:

[Graph-Based Encoders and their Performance for Finite-State Channels with Feedback](https://arxiv.org/abs/1907.08063).

# Step 1 - install CVX
For the implementation of the upper bound, we used CVX with the Sedumi solver. You should download the CVX package from  [http://cvxr.com/cvx](http://cvxr.com/cvx/).  

# Step 2.a - Plug and play
The following file is the main file:
- [main_GTable.m](https://github.com/Basharh1/Bounds_on_Finite_State_Channels/blob/master/Code/Main_GTable.m) 

The default parameters will evaluate the bounds for the Ising channel (with a channel parameter equals to 0.5):  
- FSC.channel  = 'Ising'  
- FSC.Ch_para  = 0.5  
- FSC.state    = 'S=X'  


# Step 2.b - Choose a FSC from a list 
To change the default parameters from the previous item, you need to choose in the main file:
1. Cardinalities of the channel state, input and output.
2. Finite-state channel from the pre-defined list and its channel parameter.
3. State evolution from the pre-defined list.
4. Choose the graphs construction to use - if you are unsure, a good start is the default 'GP' with parameter '2'.  

# Creating your own FSC
You can add your own finite-state channel. There are two files to be edited:  
1. [Create_Channel.m](https://github.com/Basharh1/Bounds_on_Finite_State_Channels/blob/master/Code/Create_Channel.m), where you add the channel transition P_{Y|X,S}.
2. [Create_S.m](https://github.com/Basharh1/Bounds_on_Finite_State_Channels/blob/master/Code/Create_S.m), where you add the state evolution P_{S^+|X,Y,S}.



