I = imread('1.tif');
level = graythresh(I)
threshold = level*(254)+1
[row,col] = size(I);
    syms cou countk;
    cou = 0;
    countk = 0;
    for i = 1:row
        for j = 1:col
            if I(i,j) < threshold
                cou = cou+1;
            end
            countk = countk + 1;
        end
    end
    perc_2D = (cou*100)/(row*col)