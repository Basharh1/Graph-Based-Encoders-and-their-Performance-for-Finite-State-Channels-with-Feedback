function J = Joint_Subs(x,T)

I = find(T>0);
Temp(I)=x;
Temp(end+1:numel(T)) = zeros(1,numel(T)-I(end));
J = reshape(Temp,size(T));