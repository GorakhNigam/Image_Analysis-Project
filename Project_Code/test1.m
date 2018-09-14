img = imread('3.tif');
img1 = img(1:690,1:1024);
%img = rgb2gray(double(img));
% filter
sigma = 3;
cutoff = ceil(3*sigma);   
    gau = fspecial('gaussian',2*cutoff+1,sigma);
    out = conv2(img1,gau,'same');
%counting porosity
[row,col] = size(out);
syms cou countk;
cou = 0;
countk = 0;
for i = 1:row
    for j = 1:col
        if out(i,j) < 100
            cou = cou+1;
            im(i,j) = out(i,j);
        end
        countk = countk + 1;
    end
end
imshow(im);
perc = (cou*100)/(row*col)
figure
subplot(1,2,1)

imshow(img1);
subplot(1,2,2)
imshow(out);
% figure
% imhist(img);
% figure
% imhist(out/256);
