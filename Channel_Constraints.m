% This is for erasure channels. You get the channel constraints from the
% X labelled graph and the channel.
function [Aeq,Beq] = Channel_Constraints(Joint,C,CARD)

A(1,:) = zeros(1,CARD.J);
k=1;
for s = 1:CARD.s
    for x = 1:CARD.x
        for y = 1:CARD.y
            for q = 1:CARD.q
                Temp = zeros(size(Joint));
                Temp((q-1)*CARD.s + s,:,x,:) = - C(s,x,y)*(Joint((q-1)*CARD.s + s,:,x,:)>0);
                Temp((q-1)*CARD.s + s,:,x,y) = (Joint((q-1)*CARD.s + s,:,x,y)>0)*(1-C(s,x,y));
                if find(Temp>0)
                    Aeq(k,:) = reshape(Temp, [1,CARD.J]);
                    k=k+1;
                end
            end
        end
    end
end
Aeq = unique(Aeq,'rows');
Beq = zeros(1,size(Aeq,1));
% V_A = sum(Joint(:)>0);
