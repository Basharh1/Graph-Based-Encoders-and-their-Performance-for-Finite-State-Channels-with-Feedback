function Conditional = Create_Conditional(CARD,C)

Conditional = zeros(CARD.sq,CARD.sq,CARD.x,CARD.y);
for s=1:CARD.s
    V = s:CARD.s:CARD.sq-CARD.s+s;
    for x=1:CARD.x
        for y=1:CARD.y
            if C(s,x,y)
            Conditional(V,:,x,y) = log(C(s,x,y));
            end
        end
    end
end
