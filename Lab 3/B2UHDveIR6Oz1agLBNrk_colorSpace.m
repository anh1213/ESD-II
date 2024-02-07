I = imread('sailboat.jpg');
subplot(2,1,1)
imshow(I)
I(:,:,2) = 0;
I(:,:,3) = 0;

red = I(:,:,1);
green = I(:,:,2);
blue = I(:,:,3);

indices = find(red < 200);
red(indices) = 0;

image = I;
image(:,:,1) = red;
image(:,:,2) = 0;
image(:,:,3) = 0;

subplot(2,1,2)
imshow(image)
