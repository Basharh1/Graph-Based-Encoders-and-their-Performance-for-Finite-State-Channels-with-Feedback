% The input is a matrix transition T
function [Af,Bf] = Flow_constraints(T,CARD)

T_size = CARD.sq;
T_SQ = (squeeze(sum(sum(T>0,4),3)))>0;
for i=1:T_size
    Z = zeros(T_size);
    Z(i,:) = -ones(1,T_size);
    Z(:,i) = ones(T_size,1);
    Z(i,i)=0;
    Z = Z.*T_SQ;
    if sum(Z(:,i))
        Af(i,:) = repmat(reshape(Z,[1,T_size*T_size]),[1 CARD.xy]);
    end
end
Bf = zeros(1,size(Af,1));