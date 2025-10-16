y_prime = @(x,y) cos(x)+log(x)+ exp(x) +y/10; % log(x) = ln(x)
y_prime_prime_x= @(x,y) -sin(x) + 1/x + exp(x) +0;
y_prime_prime_y = @(x,y) 1/10;
y0 = 12;

a = 1; 
b = 10; 
h = 10^-3;
ord = [];
absc = [];
y = y0;
incr =0;
% c'est taylor
for (x=a:h:b)
    y = y + y_prime(x,y).*h+(h^2/2)*(y_prime_prime_x(x,y)+y_prime(x,y)*y_prime_prime_y(x,y));
    absc= [ absc , x];
    ord = [ord, y];
    incr = incr+1;
end



ord1 = [];
absc1 = [];
y = 12;
% c'est euler c'est pour vérifier les résultats
for (x=a:h:b)
    y = y + y_prime(x,y).*h;
    absc1= [ absc1 , x];
    ord1 = [ord1, y];
    incr = incr+1;
end
% c'est rk2
y=12;
ord2 = [];
absc2 = [];
for (x=a:h:b)
    y = y +h*y_prime(x+h/2, y + (h/2)*y_prime(x,y));
    ord2 = [ord2, y];
    absc2 = [ absc2, x];
    incr = incr +1;

end
% rk4
y=12;
ord3 = [];
absc3 = [];
for (x=a:h:b)
    F1 = y_prime(x,y);
    F2 = y_prime(x+h/2, y +(h/2)*F1);
    F3 = y_prime(x+h/2,y +(h/2)*F2 );
    F4 = y_prime(x+h, y +h*F3);
    y = y +(h/6)*(F1+2*F2+2*F3+F4);
    ord3 = [ord3, y];
    absc3 = [absc3, x];
    incr = incr +1;

end



hold on
plot (absc3, ord3, 'm', 'DisplayName','RK4')
plot (absc2, ord2, 'g', 'DisplayName','RK2') % la verte est cachée derière la bleu
plot (absc , ord, 'b', 'DisplayName','Taylor')
plot (absc1, ord1, 'r','DisplayName', 'Euler')
disp("nombre de calcul")
disp (incr)