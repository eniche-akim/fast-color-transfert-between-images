function [new_lab]=change_color(S,T)
%transforme les deux images (matrices) en vecteurs
Ls=S(:,:,1); Ls=Ls(:);
as=S(:,:,2); as=as(:); 
bs=S(:,:,3); bs=bs(:); 

% extraction dez vecteur L A et B pour les deux images 
Lt=T(:,:,1); Lt=Lt(:);
at=T(:,:,2); at=at(:);
bt=T(:,:,3); bt=bt(:);

%calcul de la moyenne des deux images pour les trois composantes LAB
mLS=mean(Ls); mLT=mean(Lt);
maS=mean(as); maT=mean(at);
mbS=mean(bs); mbT=mean(bt);



T(:,:,1)=((T(:,:,1)-mLT).*(std(Ls)/std(Lt)))+mLS;
T(:,:,2)=((T(:,:,2)-maT).*(std(as)/std(at)))+maS;
T(:,:,3)=((T(:,:,3)-mbT).*(std(bs)/std(bt)))+mbS;


new_lab=T;

end