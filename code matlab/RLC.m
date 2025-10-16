
h = 10^-6;
a = h;
b = 0.001 - h;

q0 = 10^-4;
w0 = 1/(sqrt(10^-9));
Q = 0.2* sqrt(10^3);
w =  w0 * sqrt(1-(1/(2*Q))^2);

t = a:h:b;
y = @(t) q0 * exp(-w0*t/(2*Q)).*(cos(w*t)+ 1/(2*Q*sqrt(1-(1/(2*Q)^2)))*sin(w*t));


yprime = @(t) (y(t + h) - y(t-h))/(2*h);
i = @(t) (-(q0 * w0))/(sqrt(1-(1/(2*Q)^2))) * exp(-w0*t/(2*Q)) .* sin(w*t);

figure(1)
hold on

plot(t, yprime(t));% Tracé des points et de la courbe
plot(t,i(t));


xlabel('t');
ylabel('y');

ecart = mean(abs(i(t)-yprime(t)))