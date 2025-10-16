matrice =  [
    0   -3   22   -7   36    8   47  -12;
   -15   28   -5   44   -9   19   -6   32;
    25   -8   41   -2   30   -7   49   -3;
   -11   35   -6   27   -4   42   -9   18;
    31   -5   48   -12   26   -3   37   -8;
   -16   39   -7   34   -9   20   -6   45;
    23   -4   50   -11   28   -5   40   -2;
   -10   33   -6   29   -3   43   -7   21
];
taille = size(matrice) ;
tailleM = taille(1);
colonne = 1;

for j=1 :(tailleM)
    premiercas = 0;
    l =j;
    
    if (matrice(l,colonne)==0)
        while (matrice(l,colonne)==0)
            l = l+ 1;
        end
        matrice
        t = matrice(j,:);
        matrice(j,:) = matrice(l, :);
        matrice(l, :) = t
    end
    k = j;
    
    colonne_bis = colonne;
    for m=1 :(tailleM-colonne)
        if matrice(k,colonne_bis) ~=  0 && k ~=1
        if premiercas == 0
        valeur = matrice(k,colonne_bis)/matrice(k-1,colonne_bis);
        end
        matrice(k, colonne_bis)=matrice(k, colonne_bis)-valeur*matrice(k-1, colonne_bis);
        colonne_bis = colonne_bis + 1;
        premiercas = premiercas +1;
        else 
            break
        end
        
    end
    premiercas = 0;
    colonne = colonne +1;
    
end
matrice(1,:)