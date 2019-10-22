function Q_Mat = Create_G_Markov(CARD)
Q_Mat = zeros(CARD.q,CARD.q,CARD.y);
k=round(log(CARD.q)/log(CARD.y));
for q = 1:CARD.q
    for y = 1:CARD.y
        if k==1
            new_q = y;
        else
            Q_dec = decimal_convert(q-1,CARD.y,k);
            Q_dec(1:end-1) = Q_dec(2:end);
            Q_dec(end)=y-1;
            new_q = polyval(Q_dec,CARD.y)+1;
        end
        Q_Mat(q,new_q,y) = 1;
    end
end