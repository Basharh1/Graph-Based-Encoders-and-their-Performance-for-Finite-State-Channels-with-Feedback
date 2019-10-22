function [YQ,Q_DUP] = Marginals(Joint,CARD)

YQ      = MargYQ(Joint,CARD);
Q_DUP   = MargQ(YQ,CARD);
YQ      = reshape(YQ,[1,CARD.q*CARD.y]);
