
close all
%charger les images
source='images_done/source.jpg';
target='images_done/target.jpg';

S=imread(source);
T=imread(target);
figure
subplot(1,2,1)
imshow(S);
title('source image');
subplot(1,2,2)
imshow(T);
title('target image');
pause(5)
close all;
%% RGB --> XYZ

%conversion d'image source de l'espace couleur RGB vers XYZ
[XYZ_s]=RGB_TO_XYZ(S);

%conversion d'image target de couleur l'espace  RGB vers XYZ
[XYZ_t]=RGB_TO_XYZ(T);

%conversion d'image source de l'espace couleur XYZ vers L*A*B
[lab_s]=XYZ_TO_LAB(XYZ_s);

%conversion d'image target de l'espace couleur XYZ vers L*A*B
[lab_t]=XYZ_TO_LAB(XYZ_t);


%% plot figures in L*A*B space

%affichage de l'image source dans l'espace L*A*B
figure
subplot(1,2,1)
imagesc(lab_s);
title('source image in lab color space');
subplot(1,2,2)
imagesc(lab_t);
title('target image in lab color space');
disp('le espace de coleur lab permet de voir la concentration des couleurs de  l image d une maniere tres claire');
disp('ce qui qide aide aussi sur le choit de l image source et target')
pause(10);
close all;
%% transfert de couleur en utilisant la methode de la moyenne et la variance

[new_lab]=change_color(lab_s,lab_t);

%%%%%%    l'operation inverse de L*A*B vers XYZ  %%%%%%%

%%  L*A*B --> XYZ
%conversion d'image modifier de l'espace de couleur L*A*B vers XYZ
[xyz]=LAB_TO_XYZ(new_lab);

%% XYZ --> RGB
%conversion d'image modifier de l'espace de couleur XYZ vers RGB
[RGB]=XYZ_TO_RGB(xyz);


%affichage des trois images source et target avant et apres  
RGB=uint8(RGB);
figure
imshow(RGB);
title('target image after color transfer from source image');
pause(5);
close all

figure 
subplot(2,2,1)
imshow(S);
title('source image');
subplot(2,2,2)
imshow(T)
title('original target image');
subplot(2,2,3)
imshow(RGB);
title('target after allping color transfer algorithm');

%{ 
new_lab=new_lab*255;
new_lab(:,:,1)=new_lab(:,:,1)*255/100;
new_lab(:,:,2)=new_lab(:,:,2)+127;
new_lab(:,:,3)=new_lab(:,:,3)+127;
figure
imshow(new_lab);
 figure 
 imshow(rgb2lab(T))
%}