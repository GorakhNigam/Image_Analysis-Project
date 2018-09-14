img = imread('2.tif');
out = imgaussfilt(out,3);
[row,col] = size(out);
syms cou countk;
cou = 0;
countk = 0;
for i = 1:row
    for j = 1:col
        if out(i,j) < 80
            cou = cou+1;
        end
        countk = countk + 1;
    end
end
perc = (cou*100)/countk

