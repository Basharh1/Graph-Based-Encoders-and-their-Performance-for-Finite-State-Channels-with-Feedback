function [Ch_Mat,S_Mat,CARD] = FSC_Model(FSC)

CARD.s  = FSC.s;
CARD.x  = FSC.x;
CARD.y  = FSC.y;
CARD.xy = CARD.x*CARD.y;

Ch_Mat  = Create_Channel(CARD,FSC);
S_Mat   = Create_S(CARD,FSC);
