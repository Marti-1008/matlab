function [y] = fonction_derive_premiere_ordre_1(x)
y = x^3 * exp(-x) + sin(x);
end 

h = 10^-3;
a = 0;
b = 100;
absc = [];
ord = [];
for (x=a:h:b)
    y= (fonction_derive_premiere_ordre_1(x+h)-fonction_derive_premiere_ordre_1(x))/h;
    absc = [absc , x];
    ord = [ord, y];

end


plot (absc, ord)


hold on 

f_prime =@(x) 3*x.^2 .* exp(-x) - x.^3 .* exp(-x) + cos(x); % verification à partir de la formule de dérivation
ord2 = f_prime(absc); 
plot (absc, ord2)