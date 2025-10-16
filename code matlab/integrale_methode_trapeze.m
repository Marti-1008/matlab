fonction_sin = @(x) sin(x) + cos(x);


a = 0; 
b = 100;
h = 10^-3;
I = 0;

for(x=a:h:b)
    I  = I + fonction_sin(x+h) + fonction_sin(x);
end


I = I*(h/2); 

disp(" La valeur de l'intégrale :")
disp(I)