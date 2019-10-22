function J_VAR = Joint_Subs_Stationary(J_VAR_inputs,CARD)

Stationary_sq = stationary(squeeze(sum(sum(J_VAR_inputs,4),3)));

J_stationary = zeros(CARD.sq,CARD.sq,CARD.x,CARD.y);
for q = 1 : CARD.q 
    for s = 1: CARD.s
        J_stationary(CARD.s*(q-1)+s,:,:,:) = Stationary_sq(CARD.s*(q-1)+s);
    end
end
J_VAR = J_VAR_inputs.*J_stationary;