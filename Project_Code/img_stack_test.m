for i=1 : 3
    % {} = cell array
  images{i} = imread(sprintf('%04d.tif',i));
  I{i} = (images{i});
end
myImage = cat(3,I{1:3});
image=myImage(:,:,:);
imagesc(image);
%vector=reshape(image',numel(image),1);
%X=ifft(image);
%imagesc(X);