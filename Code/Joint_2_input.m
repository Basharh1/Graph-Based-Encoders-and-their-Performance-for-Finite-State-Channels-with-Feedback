function  [PX_SQ, pi_SQ] = Joint_2_input(J,CARD)

T_SQX = squeeze(sum(J,4));
pi_SQ = squeeze(sum(sum(T_SQX,3),2));
T_SQX = squeeze(sum(T_SQX,2));
for x=1:CARD.x
    PX_SQ(:,x) = (T_SQX(:,x)./pi_SQ).*(pi_SQ>0);
end