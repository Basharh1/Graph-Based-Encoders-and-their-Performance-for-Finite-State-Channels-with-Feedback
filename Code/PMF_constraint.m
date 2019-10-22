function [Ap,Bp] = PMF_constraint(CARD)

Ap = ones(1,CARD.J);              
Bp = 1;