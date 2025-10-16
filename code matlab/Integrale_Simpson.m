fonction_sin = @(x) sin(x) + cos(x);


a = 0; 
b = 100;
h = 10^-6;
I = 0;
x1 = a;
n = (b-a)/(2*h);
for (x=1:n)
    I = I +fonction_sin(x1)+ 4*fonction_sin(x1+h) + fonction_sin(x1+2*h);
    x1 = x1+2*h;
end

I = I*(h/3);

disp("Voici la valeur de l'intégrale : ")
disp(I)