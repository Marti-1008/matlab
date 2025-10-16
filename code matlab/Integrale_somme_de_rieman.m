fonction_sin = @(x) sin(x) + cos(x);


a = 0; 
b = 100;
h = 10^-7;
I = 0;

for (x=a:h:b)
    I = I + h*fonction_sin(x);
end

disp("Voici la valeur de l'intégrale")
disp(I)