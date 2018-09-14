img = imread('1.tif');
img = img(1:690,1:1024);
out = imgaussfilt(img,3);
count = zeros(690,1023);
for i = 1:690
    for j = 1:1023
        if (out(i,j)< 120)
        count(i,j) = 1;
        end
    end
end

imshow(count);
