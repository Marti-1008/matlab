fonction = @(x) (1./(4.*x+2));
quotient = @(x) (4.*x+2);
function y1 = derive1(x)
    fonction = @(x) (1./(4.*x+2));
    h = 10^-4;
    y1 = (fonction(x+h) -fonction(x-h))./(2*h);
end
function y2 = derive2(x)
    fonction = @(x) (1./(4.*x+2));
    h = 10^-4;
    y2 = (fonction(x+h) -2.*fonction(x)+fonction(x-h))./(h^2);
end
h = 10^-4;
absc=0:h:10;
ord1=derive2(absc) -4.*derive1(absc) + 3.*fonction(absc);
ord2 =32./(quotient(absc).^3) + 16./(quotient(absc).^2) + 3./(quotient(absc));
hold on 
plot(absc, ord1, 'r')
plot(absc,ord2,'b')
disp(mean(abs(ord1-ord2)))
x = 0;
y = 0.5;
y_prime = -1;
y_prime = @(y) -4*y^2;

for(absc=0:h:10)
    

end

%y_prime_prime 