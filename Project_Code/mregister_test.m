fixed = imread('0001.tif');
moving = imread('0002.tif');
imshowpair(fixed, moving,'Scaling','joint')
[optimizer, metric] = imregconfig('monomodal')
%optimizer.InitialRadius = 0.009;
%optimizer.Epsilon = 1.5e-4;
%optimizer.GrowthFactor = 1.01;
%optimizer.MaximumIterations = 300;
movingRegistered = imregister(moving, fixed, 'affine', optimizer, metric);
figure
imshowpair(fixed, movingRegistered,'Scaling','joint')