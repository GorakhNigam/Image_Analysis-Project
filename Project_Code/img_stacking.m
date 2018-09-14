clear all;
Imatrix = []; 
for i=1:3
    images{i} = imread(sprintf('%04d.tif',i));
    [x,y] = size(images{i});
    if [x,y] == [768,1024]
       Imatrix = cat(3, Imatrix, images{i});
    end
end
figure
imshow(Imatrix)