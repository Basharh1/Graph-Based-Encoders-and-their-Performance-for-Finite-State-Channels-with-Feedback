function Q_DUP = MargQ(YQ,CARD)

Q = sum(YQ,2);
Q = repmat(Q,[CARD.y,1]);
Q_DUP = reshape(Q,[1,CARD.y*size(YQ,1)]);