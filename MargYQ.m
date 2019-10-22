function [YQ,Q_DUP] = MargYQ(Joint,CARD)

J = squeeze(sum(Joint,3));
J = squeeze(sum(J,2));
for q = 1:CARD.q
    YQ(q,:) = sum(J(q*CARD.s - CARD.s + 1:q*CARD.s,:),1);
end

