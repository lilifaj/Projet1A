function c=mod2(a,b)

% le modulo redefini pour matlab...
% renvoie des valeurs dans 1..b plutot 
% que 0..b-1

c = mod(a,b);
if c==0 
   c=b;
end