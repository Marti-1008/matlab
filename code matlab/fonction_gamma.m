fonction_gama = @(x,t) t^(x-1).*exp(-t);

a = 0;
b =30; 
h= 0.1;
n = (b-a)/(2*h);
I = 0;
tableau_I = 0;
for (x=1:1:6)
    borne_inf = 0;
    for (l=1:n)
        I=I+ fonction_gama(x, borne_inf)+4*fonction_gama(x, borne_inf+h)+fonction_gama(x, borne_inf+2*h);
        borne_inf = borne_inf+2*h;
    end
    
    
    
end
I=I*(h/3);
Somme_factorial = sum(arrayfun(@factorial, 0:5));
%somme_gamma = sum(tableau_I(2:6));
disp(mean(abs(I-Somme_factorial)))