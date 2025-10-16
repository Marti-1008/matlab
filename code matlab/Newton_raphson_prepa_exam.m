% on va commencer newton raphson 

function [l]=fonction_newton_raphson(x)
l = x.^5 + x.^2+x.^3 + 4*x + pi;
end 
function [l]=fonction_derive_newton_raphson(x)
l = 5*x.^4 + 2*x.^+3*x.^2 + 4 ;
end 
absc = 0:0.001:100;
ord = fonction_newton_raphson(absc);
plot(absc, ord);
a = 0;
b =100;
u1 = (a+b)/2;
incr = 0;

while (abs(fonction_newton_raphson(u1))>10^-5)
    u1 = u1 -(fonction_newton_raphson(u1)/fonction_derive_newton_raphson(u1));

    incr = incr +1;
    disp(incr)


end
disp("la valeur de la racinde est la suivante :")
disp(u1)