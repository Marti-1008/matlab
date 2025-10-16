y_prime = @(x) cos(x)+log(x)+ exp(x); % log(x) = ln(x)
y0 = 12;

a = 1; 
b = 10; 
h = 10^-3;
ord = [];
absc = [];
y = y0;

for (x=a:h:b)
    y = y + y_prime(x).*h;
    absc= [ absc , x];
    ord = [ord, y];
end


plot (absc , ord)