function result = decimal_convert(D,B,Q_A)
% DECIMAL_CONVERT Convert decimal integer to vector of base B coefficients.
% DECIMAL_CONVERT(D,B) returns the representation of D as a vector of coefficients such that:
%    D = xn*B^n + ... + x2*B^2 + x1*B^1 + x0*B^0
%  
% Examples
%    decimal_convert(23,3) returns [2;1;2]
%    polyval([2;1;2],3)    returns 23
%
% See also polyval, dec2base, base2dec, de2bi, bi2de.

n = 1;
while ((D/(B^n)) > 1)
    n = n+1;
end

p = zeros(n+1,1);

residual = D;
for i=size(p,1):-1:1
    p(i) = floor( residual/(B^(i-1)) );
    residual = residual - p(i)*(B^(i-1));
end

if D>B
result = flipdim(p(1:end-1),1);
else
result = flipdim(p(1:end),1);
end
result = [zeros(1,Q_A-length(result)), result'];
