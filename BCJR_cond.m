function Cond = BCJR_cond(Q,J,CARD)
k = 1;
Initial = zeros(CARD.s*CARD.q, CARD.s*CARD.q, CARD.x, CARD.y);
for y = 1: CARD.y
    for q = 1: CARD.q
        for s = 1: CARD.s
            q_new = find(Q(q,:,y));  
            nume1 = Initial; deno1 = Initial; nume2 = Initial; deno2 = Initial;

            nume1(CARD.s*(q-1)+1:CARD.s*(q-1)+CARD.s, CARD.s*(q_new-1)+s, :, y) = 1;
            deno1(CARD.s*(q-1)+1:CARD.s*(q-1)+CARD.s, :, :, y) = 1;            
            nume2(:, CARD.s*(q_new-1)+s, :, :) = 1;
            deno2(:, CARD.s*(q_new-1)+1:CARD.s*(q_new-1)+CARD.s, :, :) = 1;    
            
            if (sum(sum(Q(:,q_new,:))) ~= 1)
                mat1 = J.*nume1; mat2 = J.*deno1; mat3 = J.*nume2; mat4 = J.*deno2;               
                Cond(k) = sum(mat1(:))*sum(mat4(:)) - sum(mat2(:))*sum(mat3(:));
                k = k +1;
            end
        end
    end
end