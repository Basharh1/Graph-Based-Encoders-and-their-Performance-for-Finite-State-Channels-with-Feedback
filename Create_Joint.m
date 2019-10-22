function J = Create_Joint(S,Q,C,CARD)

J = zeros(CARD.sq,CARD.sq,CARD.x,CARD.y);
for s=1:CARD.s
    for q=1:CARD.q
        for x=1:CARD.x
            for y=1:CARD.y
                I_s = find(S(s,:,x,y)>0);
                I_q = find(Q(q,:,y)>0);
                if length(I_s)*length(I_q)
%                     disp((q-1)*CARD.s + 1 + (s-1));
                    J((q-1)*CARD.s + 1 + (s-1),(I_q-1)*CARD.s + 1 + (I_s-1),x,y) = C(s,x,y);
                    I_s = 0;
                    I_q = 0;
                end
            end
        end
    end
end