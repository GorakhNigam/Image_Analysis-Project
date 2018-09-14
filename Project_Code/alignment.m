img1 = 255-mean(imread('01_wing.png'),3); 
 img2 = 255-mean(imread('02_wing.png'),3); 
 c = normxcorr2(img2,img1); 
 [y x] = find(c==max(c(:))); 
 y = y-size(img2,1); 
 x = x-size(img2,2); 
 TFORM = maketform('affine',[1 0 x;0 1 y; 0 0 1]'); 
 NEWimg2 = imtransform(img2,TFORM,'xdata',[1 size(img1,2)],'ydata',[1 size(img1,1)]);