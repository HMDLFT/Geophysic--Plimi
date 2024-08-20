I=imread('GeoHamed1.jpg');
velp=rgb2gray(I);
figure,imshow((velp));
title('Gray Image')
vel=6000*im2double(velp)
% vel=(vel*400000)
 vel=round(vel,-1)
 save('hamed.mat','vel')
