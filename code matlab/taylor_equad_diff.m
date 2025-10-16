y_prime = @(x) cos(x)+log(x)+ exp(x); % log(x) = ln(x)
y_prime_prime = @(x) -sin(x)+ 1/x + exp(x);
y0 = 12;

a = 1; 
b = 10; 
h = 10^-3;
ord = [];
absc = [];
ord1 = [];
absc1 = [];
y = y0;

for (x=a:h:b)
    y = y + h.*y_prime(x) + (h^2/2)*(y_prime_prime(x));
    ord = [ord, y];
    absc =[absc, x];
end 
y = 12;
for (x=a:h:b)
    y = y + y_prime(x).*h;
    absc1= [ absc1 , x];
    ord1 = [ord1, y];
end
hold on
plot(absc, ord, 'g')
plot(absc1, ord1, 'b')

    
