y_prime = @(x,y) cos(x)+log(x)+ exp(x) +y/10; % log(x) = ln(x)
y_prime_prime_x= @(x,y) sin(x) + 1/x + exp(x) +0;
y_prime_prime_y = @(x,y) 1/10;
y0 = 12;

a = 1; 
b = 10; 
h = 10^-3;
ord = [];
absc = [];
y = y0;
% c'est taylor
for (x=a:h:b)
    y = y + y_prime(x,y).*h+(h^2/2)*(y_prime_prime_x(x,y)+y_prime(x,y)*y_prime_prime_y(x,y));
    absc= [ absc , x];
    ord = [ord, y];
end



ord1 = [];
absc1 = [];
y = 12;
% c'est euler c'est pour vérifier les résultats
for (x=a:h:b)
    y = y + y_prime(x,y).*h;
    absc1= [ absc1 , x];
    ord1 = [ord1, y];
end

hold on
plot (absc , ord, 'b')
plot (absc1, ord1, 'r')