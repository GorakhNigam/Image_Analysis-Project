moving = imread('0001.tif');
fixed = imread('0002.tif');
%Define sets of control points for both images.

movingPoints = [118 42;99 87];
fixedPoints = [190 114;171 165];
%Display the images, and display the control points in white.

figure; imshow(fixed)
hold on
plot(fixedPoints(:,1),fixedPoints(:,2),'xw') 
title('fixed')
figure; imshow(moving)
hold on
plot(movingPoints(:,1),movingPoints(:,2),'xw') 
title('moving')

%Observe the slight errors in the position of the moving points.
%Adjust the moving control points using cross correlation.

movingPointsAdjusted = cpcorr(movingPoints,fixedPoints,...
                              moving(:,:,1),fixed(:,:,1))
plot(movingPointsAdjusted(:,1),movingPointsAdjusted(:,2),'xy')      
