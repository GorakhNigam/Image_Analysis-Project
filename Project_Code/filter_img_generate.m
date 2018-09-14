img = imread('1.tif');
img = img(1:690,1:1024);
% img1 = wiener2(img,[5 5]);
% figure
% subplot(1,2,1)
% imhist(img);
% % axis('equal','tight');
% title('Histogram for Original image');
% subplot(1,2,2)
% imhist(img1);
% title('Histogram for Wiener Filtered Image')
imhist(img);