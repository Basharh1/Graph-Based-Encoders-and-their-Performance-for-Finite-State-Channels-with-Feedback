function Q = Graph_return(CARD,Ind,Q_Table)

L             =   length(Q_Table);
X             =   decimal_convert(Ind-1,L,CARD.q) + ones(1,CARD.q);
Q             =   zeros(CARD.q,CARD.q,CARD.y);
Q(:,:,:)      =   Q_Table(X,:,:);
