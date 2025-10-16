function [y] = fonction_derive_premiere_ordre_2(x)
y = x^3 * exp(-x) + sin(x);
end


a =0;
b =100;
h = 10^-3;
ord = [];
absc = [];
for (x =a:h:b)
    y = (fonction_derive_premiere_ordre_2(x+h)-fonction_derive_premiere_ordre_2(x-h))/(2*h);
    ord = [ord, y];
    absc = [absc , x];
end

plot (absc, ord)








hold on % permet d'afficher les 2 ensebles 
grid on

f_prime =@(x) 3*x.^2 .* exp(-x) - x.^3 .* exp(-x) + cos(x); % verification à partir de la formule de dérivation
ord2 = f_prime(absc); 
plot (absc, ord2)