function J_VAR = Joint_Subs_inputs(mat_var,J_NonVar,CARD)

J_inputs = zeros(CARD.sq,CARD.sq,CARD.x,CARD.y);
for sq = 1 : CARD.sq
    for x = 1: CARD.x
        J_inputs(sq,:,x,:) = mat_var(sq,x);
    end
end
J_VAR = J_NonVar.*J_inputs;