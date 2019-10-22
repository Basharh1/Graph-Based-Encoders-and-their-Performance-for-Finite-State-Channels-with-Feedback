# Overview
This repository contains an implementation of a technique to compute upper and lower bounds on the capacity of unifilar finite-state channels (FSCs) with feedback. The theoretical details of the technique are presented in the following paper:

[Graph-Based Encoders and their Performance for Finite-State Channels with Feedback](https://arxiv.org/abs/1907.08063), introduced by Oron sabag, Bashar Huleihel, Haim Permuter.

# Main files
The following Matlab files, found in the home directory, are the most relevant for this project:  
main_GTable.m  -  The main interface where you choose a FSC model and run the simulation to obtain upper and lower bounds.  
Create_Channel.m - Here you can add your own channel model: P_{Y|X,S}.  
Create_S.m contain the - Here you can add your own state evaluation function: S^+ = f(S,X,Y).  

# Instructions
Under the file file "main_GTable.m" we choose the FSC model.
1.) Create a channel model in the file "Create_Channel.m" as described in the file.
2.) Create a state evaluation function in the file "Create_S.m" as described in the file.
3.) Open mainGTable.m file. Write the channel string in FSC.channel and the state string in FSC.state.
4.) Choose graph method as described in the paper.
5.) Choose size of graphs to run over
[main_GTable.m](https://github.com/Basharh1/Bounds_on_Finite_State_Channels/blob/master/Main_GTable.m)
