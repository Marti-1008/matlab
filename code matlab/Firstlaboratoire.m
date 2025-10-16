%% première partie 
f1 = @(x) x.^2;
f2 = @(x) 2*x;
resultat = 0;
for k=-10:1:10
    if k < 0
        resultat = resultat + f1(k);
    else 
        resultat = resultat + f2(k);
    end
        
end

disp (resultat)
%% deuxième partie petit jeux des batonnets
disp ('voici le jeux des batonnets')
nombre_de_batonnet = 21;
joueur = "s";
while (joueur ~='1' && joueur~='2')
            joueur = input ('contre qui voulez vous jouez la machine (1) ou un autre joueur (2)','S');
            if (isempty(joueur)==1)
                disp ("vous êtes un emmerdeur d'avoir mis un caractère vide")
                joueur = '0'
            end
end
tour_joueur1 = 0;
tour_joueur2 = 0;
while (nombre_de_batonnet > 0)
    if joueur == "2"
        disp("c'est autour du joueur 1 de jouer")
        disp(nombre_de_batonnet)
        while (tour_joueur1 ~='1' && tour_joueur1~='2' &&  tour_joueur1 ~='3' &&  tour_joueur1~='4' &&  tour_joueur1~='5')
            tour_joueur1 = input ("combien voulez enlever de batonnets entre 1 et 5",'S');
            if (isempty(tour_joueur1)==1)
                disp ("vous êtes un emmerdeur d'avoir mis un caractère vide")
                tour_joueur1='0'
            end
           
            tour_joueur2 = 0;
            
        end
        tour_joueur1=str2num(tour_joueur1)
        nombre_de_batonnet=nombre_de_batonnet-tour_joueur1
        if (nombre_de_batonnet<=0)
            disp("Perdu !!!")
            break
        end
        disp("c'est autour du joueur 2 de jouer")
        disp(nombre_de_batonnet)
        while (tour_joueur2 ~='1' &&  tour_joueur2~='2' &&  tour_joueur2 ~='3' &&  tour_joueur2~='4' &&  tour_joueur2~='5')
            tour_joueur2 = input ("combien voulez enlever de batonnets entre 1 et 5",'S');
            
            tour_joueur1 = 0;
        end
        tour_joueur2=str2num(tour_joueur2);
        nombre_de_batonnet=nombre_de_batonnet-tour_joueur2;
        if (nombre_de_batonnet<=0)
            disp("Perdu !!!")
            break
        end
    elseif joueur == "1"
        disp("Vous jouez contre la machine vous allez ")
        if nombre_de_batonnet<5
            enlever = nombre_de_batonnet-1;
        else
            enlever = mod(nombre_de_batonnet,6)-1
            if enlever < 0
                enlever = 1;
            end
            
        end
        nombre_de_batonnet= nombre_de_batonnet-enlever;
        disp("la machine a enlever : ")
        disp (enlever)
        disp("c'est autour du joueur 1 de jouer")
        disp(nombre_de_batonnet)
        
        while (tour_joueur1 ~='1' && tour_joueur1~='2' &&  tour_joueur1 ~='3' &&  tour_joueur1~='4' &&  tour_joueur1~='5')
            tour_joueur1 = input ("combien voulez enlever de batonnets entre 1 et 5",'S');
            if (isempty(tour_joueur1)==1)
                disp ("vous êtes un emmerdeur d'avoir mis un caractère vide")
                
            end
        end
        tour_joueur1=str2num(tour_joueur1);
        nombre_de_batonnet=nombre_de_batonnet-tour_joueur1;
        tour_joueur1='0';
        if (nombre_de_batonnet<=0)
            disp("Perdu !!!")
            break
        end
    end
end
%% troisième partie méthode de Newton Raphson
fonction_sin = @(x) sin(x);
fonction_prime = @(x) cos(x);
absi = 1:0.001:4;
ord = fonction_sin(absi);
u1 = 3;
precision = 10^-3;

while  (fonction_sin(u1)>precision || fonction_sin(u1)<-precision)
    point_racine =- fonction_sin(u1)/fonction_prime(u1)+u1;
    u1 = point_racine;

end
fonction_tangente =@(x) cos (u1)*(x-u1)+ sin(u1);
plot (absi, fonction_tangente(absi),absi, ord);
grid on
disp(["la valeur de la racine vaut ", num2str(u1)])
disp(['La valeur de pi est : ', num2str(pi)]);
disp(pi-u1)
%% quatrième partie déterminer les racines
valeur = input("donnez la valeur dont vous voulez connaître : ");
valeur_exp = input("donnez la valeur de l'exposant ");

precision = 10^-4;
fonction1= @(x) x.^(valeur_exp)-valeur;
fonction_prime1 = @(x) (x.^((valeur_exp)-1))*valeur_exp;

if valeur >= 0
    u = valeur +1;
else 
    if mod(valeur_exp,2)==1
        u = valeur -1;
    else 
        u = valeur + i;
    end
end



while fonction1(u)>precision || fonction1(u)<-precision
        
    point_racine =- fonction1(u)/fonction_prime1(u)+u;
    u = point_racine;
    
    
end
disp (point_racine)
%% Intégration simpson 
borne_inf = 2;


% précision = (borne_sup -borne_inf)/2h
precision = 10^-4;
fonction_li = @(x) 1/log(x);
integrale = 0;
for borne_sup_incr=2:1:100
    
    disp (borne_sup_incr)
    calcul=0;
     borne_inf=2;
     n = (borne_sup_incr-borne_inf)/(2*precision);
    for k=1:n
        calcul =calcul+(fonction_li(borne_inf)+4*fonction_li(borne_inf+precision)+fonction_li(borne_inf+2*precision))*(precision/3);
        borne_inf = borne_inf + 2*precision;
    end
     integrale = integrale + round(calcul);
   
   
   
end
disp ("l'intégrale vaut")
disp (integrale)

%% calcul de pi
a =10^10000;
b=10^10000+1;
h = 10^-5;
fonction_cercle = @(x) (1/(1+x^2));
n = (b-a)/(2*h);
disp(n)
integrale= 0;
for l=1:n
    disp(l)
    integrale = integrale+(fonction_cercle(a)+4*fonction_cercle(a+h)+fonction_cercle(a+2*h))*(h/3);
    a = a + 2*h;
end
integrale= integrale*2;
disp (integrale)

%% exercice recpatilatif
q0 = 10^-4;
L = 10^-3;
R = 5;
C = 10^-6;
w0 = 1/sqrt(L*C);
Q = (1/R)*sqrt(L/C);
w = w0 * sqrt(1-(1/(2*Q)^2));
fonction_elec =@(t) q0*exp(-1*t*w0/(2*Q)).*(cos(w*t)+(1/(2*Q*sqrt(1-(1/(2*Q)^2))).*sin(w*t)));
dt = 10^-6;
fonction_courant =@(t) (fonction_elec(t+dt) - fonction_elec(t-dt))/(2*dt);
fonction_courant_exact =@(t) -(q0*w0)/(sqrt(1-(1/(2*Q)^2)))* exp (-(w0.*t)/(2*Q)).* sin(w.*t);
absi = 0:10^-6:0.001;
ord1 = fonction_courant_exact(absi);
ord2 = fonction_courant(absi);
ord3 = fonction_elec(absi);
hold on
plot(absi,ord3)
plot (absi, ord1);
plot(absi,ord2);

reponse = mean(abs(fonction_courant(absi)-fonction_courant_exact(absi)));
disp(reponse)

%% seconde partie ex récap

f_gamma = @(t,x) t^(x-1) * exp(-t);
a = 0;
b = 30;
h = 0.1;
nombre_boucle = (b-a)/(2*h);
integrale_gamma = 0;
x = a;

vecteur=[];
vecteur = zeros(6,1);
for k=1:0.1:6
    for n=1:nombre_boucle
        integrale_gamma= integrale_gamma + (h/3)*(f_gamma(x,k)+4*f_gamma(x+h,k)+f_gamma(x+2*h,k));
        x = x +2*h;
    end
    if mod(k,1)==0
       reponses = abs(integrale_gamma-factorial(k-1));
       vecteur(k)=reponses;

        
    end
integrale_gamma=0;
x = a;
end

reponse = mean(vecteur);
disp(reponse)


%% troisième ex récap
f_gamma = @(t,x) t^(x-1) * exp(-t);
f_gamma_prime = @(t,x) log(t)*t^(x-1) * exp(-t);
a = 0.1;
b = 30;
h = 0.1;
h1 = 0.01;
u = 1.01;
nombre_boucle = (b-a)/(2*h);

integrale_gamma = 0;
x = a;
for n=1:nombre_boucle
    integrale_gamma= integrale_gamma + (h/3)*(f_gamma(x,u)+4*f_gamma(x+h,u)+f_gamma(x+2*h,u))-(sqrt(pi)/2);
    x = x +2*h;
end
disp(integrale_gamma)
while (abs(integrale_gamma)>10^-3)
integrale_gamma=0;
integrale_gamma_prime = 0;
    for k=1:0.1:u
        for n=1:nombre_boucle
            integrale_gamma= integrale_gamma + (h/3)*(f_gamma(x,k)+4*f_gamma(x+h,k)+f_gamma(x+2*h,k))-(sqrt(pi)/2);
            integrale_gamma_prime= integrale_gamma_prime + (h/3)*(f_gamma_prime(x,k)+4*f_gamma_prime(x+h,k)+f_gamma_prime(x+2*h,k));
            x = x +2*h;
        end
    x = a;
    
    end
disp(integrale_gamma)
u = u -(integrale_gamma-(sqrt(pi)/2)/integrale_gamma_prime); % ça ok
end
disp (u)
% pas bon du tout 

%% RK4

a = 1;
b = 3;
y = 1;
h = 10^-2;
yprime = @(x,y) -2*x*y^2;
nombre_boucle = (b-a)/h;
x = a;
ord = [y];
absc=[x];
for l=1:nombre_boucle
    k0 = yprime(x,y);
    k1 = yprime(x+h/2,y+(h/2)*k0);
    k2 = yprime(x+(h/2),y+(h/2)*k1);
    k3 = yprime(x+h,y+h*k2);
    y=y+(h/6)*(k0+2*k1+2*k2+k3);
    x=x+h;
    absc=[absc x];
    ord=[ord y];
end
solu = mean(ord)
%% mal de tête sur 10 = HN
a = 1;
e = 0.0167;
T = sqrt(a^3);
GM = 4*pi^2;
H = sqrt((1-e^2)*a*GM);

function[yp]=fonct(t,y)

yp=0*y;
yp(1)=y(2);
yp(2)=(-4*pi^2/y(1)^2)+y(1)*y(4)^2;
yp(3)=y(4);
yp(4)=(-2*y(2)*y(4))/y(1);
end
y  = [a*(1-e) 0 0 H/(a*(1-e))^2];
t = 0;
N = 50;
step = 100;
h = T/100;
Ntotal = step*N;
abs = [t];
ord1=[y(1)];
ord2 = [y(3)];
r = [y(1)];
phi = [y(3)];
t = 0;
for k = 1:Ntotal
     K1 = fonct(t,y);
     K2 = fonct(t+h/2,y+(h/2)*K1);
     K3 = fonct(t+h/2, y+(h/2)*K2);
     K4 = fonct(t+h, y+h/2*K3);
     y = y +(h/6)*(K1+2*K2+2*K3+K4);
     t = t + h;
     abs = [abs t];
     ord1 = [ord1 y(1)];
     ord2 = [ord2 y(3)];
     r = [r y(1)];
     phi =  [phi y(3)];
end
x = r.*cos(phi);
Y = r.*sin(phi);
plot(x,Y)
%% dernier ex
function[yp]=RLfonc(t,y)
    yp = 0*y;
    L = 10^-3;
    R = 5;
    C = 10^-6;
    yp(1) = y(2);
    yp(2) = (R*L)*y(2)-1/(L*C)*y(1);
end
y = [10^-4 0];
t = 0;
a = 0;
absc = [t];
ord1 = [y(1)];
ord2 = [y(2)];
h = 10^-5;
b = 0.001;
n = (b-a)/h;
for k =1:n
    K1 = RLfonc(t,y);
    K2 =RLfonc(t+h/2,y+(h/2)*K1);
    K3= RLfonc(t+h/2,y+(h/2)*K2);
    K4 = RLfonc(t+h,y+h*K3);
    y = y +(h/6)*(K1+2*K2+2*K3+K4);
    t = t + h ; 
    ord1 = [ord1 y(1)];
    ord2 = [ord2 y(2)];
    absc = [absc t];
end
plot(absc, ord1)


%% QR


A =  [
    1   -3   22   -7   36    8   47  -12;
   -15   28   -5   44   -9   19   -6   32;
    25   -8   41   -2   30   -7   49   -3;
   -11   35   -6   27   -4   42   -9   18;
    31   -5   48   -12   26   -3   37   -8;
   -16   39   -7   34   -9   20   -6   45;
    23   -4   50   -11   28   -5   40   -2;
   -10   33   -6   29   -3   43   -7   21
];
a = 0;
taille = size(A);
Q = zeros(taille);
taille2 = taille(1);
for k=1:taille2
    if k==1
        Q(:,1)=A(:,1)/norm(A(:,1));
    else 
        for t=1:(k-1)
            u_prime = dot(A(:,k),Q(:,t))*Q(:,t)+u_prime;
        end
        u = (A(:,k)-u_prime);
        u_prime =0;
        u = u/norm(u);
        Q(:,k) = u;
        u=0;
    end
end

u_prime2 = 0;
R = zeros(taille);
for k=1:taille2
    for i=1:k
        if i==k
            if i==1
                u1 = norm(A(:,k));
                R(i,k) = u1;
                u1=0;
            else
                for p=1:(i-1)
                    u_prime2 = dot(A(:,k),Q(:,p))*Q(:,p)+u_prime2;
                end
                u1 = norm(A(:,k)-u_prime2);
                u_prime2 = 0;
                R(i,k)=u1;
                
            end
        else
            R(i,k) = dot(A(:,k),Q(:,i));
        end
    end
end

Solution = Q*R;
difference =A-Solution


%% descente du gradient


fonction_pour_G = @(x) (x-3)^3+3*(x-3)^2;
h = 0.001;
x = 1.1;
dereive_G =  @(x) (fonction_pour_G(x+h)-fonction_pour_G(x))/h;
borne_a = 1;

while fonction_pour_G(x)>=10^-6
     x = x -0.01*dereive_G(x);
end
disp(x)

%% descente_gradient_2

fonction_pour_G_bis = @(x,y) x^2-x*y+2*x-y+1;
h = 0.01;
H = [h 0; 0 h];
x = 1;
y = 1;
coordonne = [x,y];
fonction_derivee_G = @(y,x,i,j) (fonction_pour_G_bis(x+H(i,j),y+H(i,j))-fonction_pour_G_bis(x,y))/2;
while (fonction_pour_G_bis(coordonne(1),coordonne(2)))^2>=10^-6
     for t=1:2
         if t==1
             i=1;
             j=0;
         else
             j=1;
             i=0;
         end
        coordonne(t)= coordonne(t)-0.01*fonction_derivee_G(coordonne(1), coordonne(2),i,j);
     end
end
disp(coordonne)
%%