fonction_f = @(x) exp(x) -1;
fonction_g = @(x) -x.^2+1;

fonction_rassemblee = @(x) exp(x)-1 +x.^2-1;
fonction_rassemblee_derivee = @(x) exp(x)+2*x;
absc= -1.5:0.01:1;
ord1 = fonction_f(absc);
ord2 = fonction_g(absc);
hold on
grid on
plot(absc, ord1,'b')
plot(absc, ord2,'r')
ord3 = fonction_rassemblee(absc);
plot (absc, ord3)
u1 = -2;
while  abs(fonction_rassemblee(u1))>10^-4
    u1 = u1 - fonction_rassemblee(u1)/fonction_rassemblee_derivee(u1);
end

u2 = 1;
while abs(fonction_rassemblee(u2))>10^-4
    u2 = u2 - fonction_rassemblee(u2)/fonction_rassemblee_derivee(u2);
end



a = u1;
b = u2;
n = 10^5;
h = (b-a)/(2*n);


x =a;

disp(x)
I = 0;
for o=1:n
    I = I + (fonction_g(x)+ 4*fonction_g(x+h)+ fonction_g(x+2*h))-(fonction_f(x)+ 4*fonction_f(x+h)+ fonction_f(x+2*h));
    x = x +2*h;
end

I = I*(h/3);
disp(["la réponse est de :", I])




