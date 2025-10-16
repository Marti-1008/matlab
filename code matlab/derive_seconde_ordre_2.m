function y = fonction_derive_seconde_ordre_1(x)
y = x^3 * exp(-x) + sin(x);
end

a = 0;
b = 100; 
h = 10^-3;
ord = [];
absc = [];

for (x=a:h:b)
    y = (fonction_derive_seconde_ordre_1(x+h)-2*fonction_derive_seconde_ordre_1(x)+fonction_derive_seconde_ordre_1(x-h))/(h^2);
    ord = [ord, y];
    absc = [absc, x];
end


plot (absc, ord)


hold on 

f_prime =@(x) 6*x .* exp(-x) - 3*x.^2 .* exp(-x)-3*x.^2 .*exp(-x) + x.^3 .*exp(-x) -sin (x); % verification à partir de la formule de dérivation
ord2 = f_prime(absc); 
plot (absc, ord2)
