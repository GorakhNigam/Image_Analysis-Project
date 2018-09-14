%     img = imread(sprintf('%01d.tif',i));
img = imread('1.tif');
%img1 = double(rgb2gray(img)); 

%sigma = 3;
%cutoff = ceil(3*sigma);
%gau = fspecial('gaussian',2*cutoff+1,sigma);
%out = conv2(img,gau,'same');

    K = filter2(fspecial('average',3),img)/255;

%Kmedian = medfilt2(img);
% for i=1:3
%     K = wiener2(img{i},[5 5]);
% end

% %%distance caliberation
% h = imdistline(gca);
% api = iptgetapi(h);
% %dist = getDistance();
% %totalDist = dist*20;
% % Convert XData and YData to meters using conversion factor.
% 
% fcn = makeConstrainToRectFcn('imline',...
%                               get(gca,'XLim'),get(gca,'YLim'));
% api.setDragConstraintFcn(fcn);   
% meters_per_pixel  = 1;
% XDataInMeters = getDistance(h)*meters_per_pixel 
% %YDataInMeters = getDistance(h)*meters_per_pixel

[row,col] = size(K);
syms cou countk;
cou = 0;
countk = 0;
for i = 1:row
    for j = 1:col
        if K(i,j) < 123
            cou = cou+1;
        end
        countk = countk + 1;
    end
end
perc = (cou*100)/countk
% figure
% subplot(1,2,1)
% imshow(img);
% subplot(1,2,2)
% %imshow(out/256);
% %imshow(mean);
% imshow(K);
% 
% %figure
% %clf;
% %subplot(2,1,1);
% %imagesc(img);
% axis('equal','tight');
% title('FESEM');

