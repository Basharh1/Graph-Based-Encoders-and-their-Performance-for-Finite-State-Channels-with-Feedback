function Q_Table = Create_Q_Table(CARD)

Possible_vec = eye(CARD.q);
seq = 0;
for i=1:size(Possible_vec,1)
    seq = [seq, repmat(i,[1 CARD.y])];
end
seq = seq(2:end);
T_Surface = nchoosek([seq],CARD.y);
T_Surface = unique(T_Surface,'rows');
for i = 1:length(T_Surface)
    T_Surface(end+1:end + factorial(CARD.y),:) = perms(T_Surface(i,:));
end
T_Surface = unique(T_Surface,'rows');

Q_Table = zeros(length(T_Surface),CARD.q,CARD.y);
for l = 1:length(T_Surface)
    for y = 1:CARD.y
        Q_Table(l,T_Surface(l,y),y) = 1;
    end
end