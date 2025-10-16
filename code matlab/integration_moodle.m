fonction_len = @(x) 1/log(x);
a = 2;
b =100;
h =10^-4;
I1 = 0;
% somme de rieman
 for (x=a:h:b)
    I1 = I1 + h*fonction_len(x);
 end
 round(I1);


 % simpson
 n = (b-a)/(2*h);
 borne_inf = a;
 I2=0;
 for(x=1:n)
    I2 = I2 + fonction_len(borne_inf)+4*fonction_len(borne_inf+h)+fonction_len(borne_inf+2*h);
    borne_inf = borne_inf+2*h;
 end 
 I2 = I2*(h/3);
 round(I2);

 % méthode des trapèzes

 I3=0;
 for (x=a:h:b)
    I3 = I3 + fonction_len(x)+fonction_len(x+h);
 end
 I3 = I3/2;
 round(I3);


 disp(I1+I2+I3)

