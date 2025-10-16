% méthode dichotomique dans un premier temps je vais regarder si la fonction est continue et que sa dérivée première est 
% est toujours positive ou négative, puis je dervais regarder que les deux
% bornes soit de signe contraire

function [y] = fonction_dichotomique(x)
y = x.^3+4*x + 4/3;
end


absc = -12:0.001:10;
ord = fonction_dichotomique(absc);
plot (absc , ord)

a = -12;
b = 10;
u1 = (a+b)/2;
incr =0;

while (abs(fonction_dichotomique(u1))> 10^-3)
    if (fonction_dichotomique(u1)>0)
        b = u1; % faire le graphique c'est une bonne idée
    else 
        a = u1;
    end
    u1 = (a+b)/2;
    incr = incr +1;
    disp(incr)
    disp("valeur e u1")
    disp(u1)
end
disp('La valeur de la racine est la suivante : ')
disp (u1)