%% Leer la imagen
clc
clear all
close all

I = imread('Nibs de Cacao.jpg');
imshow(I);

%% Solucion

Im = I;

rmat=Im(:,:,1);
gmat=Im(:,:,2);
bmat=Im(:,:,3);

subplot(2,2,1); imshow(rmat);
title('Red Plane');
subplot(2,2,2); imshow(gmat);
title('Green Plane');
subplot(2,2,3); imshow(bmat);
title('Blue Plane');
subplot(2,2,4); imshow(I);
title('Original Image');

%% 
levelr = 0.22;
levelg = 0.18;
levelb = 0.12;
i1=im2bw(rmat,levelr);
i2=im2bw(gmat,levelg);
i3=im2bw(bmat,levelb);
Isum=(i1&i2&i3);

%Plot the data
subplot(2,2,1); imshow(i1);
title('Red Plane');
subplot(2,2,2); imshow(i2);
title('Green Plane');
subplot(2,2,3); imshow(i3);
title('Blue Plane');
subplot(2,2,4); imshow(Isum);
title('Sum of all the planes');

%% Complement Image and Fill in holes
Icomp = imcomplement(Isum);
Ifilled= imfill(Icomp,'holes');
figure, imshow(Ifilled);

%%
se = strel('square',3);
Iopenned=imopen(Ifilled,se);

