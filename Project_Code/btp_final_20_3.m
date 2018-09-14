prompt = 'Enter the number of images';
n = input(prompt);
for i=1:n
    images{i} = imread(sprintf('%01d.tif',i));
    images{i} = images{i}(1:690,1:1024);
end
filtered = [];
% sigma = 3;
% cutoff = ceil(3*sigma);
for i=1:n    
     filtered = imgaussfilt(images{i},3);
%     gau = fspecial('gaussian',2*cutoff+1,sigma);
%     out = conv2(images{i},gau,'same');
%     filtered = cat(3, filtered, out);
end

%%distance caliberation
%imshow('O_sandstone00.tif');

%  h = imdistline(gca);
%  api = iptgetapi(h);

%20pixels = 1um

%counting porosity
% [row,col] = size(out);
% syms cou countk;
% cou = 0;
% countk = 0;
% for i = 1:row
%     for j = 1:col
%         if out(i,j) < 123
%             cou = cou+1;
%         end
%         countk = countk + 1;
%     end
% end
% perc = (cou*100)/countk
% figure
% subplot(1,2,1)
% imshow(img);
% subplot(1,2,2)
% imshow(out/256);

% Imatrix = []; 
% for i=1:3
%    % images{i} = imread(sprintf('%04d.tif',i));
%    % [x,y,z] = size(filtered{i});
%     %if [x,y] == [768,1024]
%        Imatrix = cat(3, Imatrix, filtered{i});
%    % end
% end

[row1,column1,axis] = size(filtered);
syms porosity count 
porosity = 0;
count = 0;
%stacking and porosity calculation
for a = 1:row1
    for b = 1:column1
        if filtered(a,b,1) > 75
            for z = 1:axis 
                porosity = 0;
                if filtered(a,b,z) < 75
                    break;                   
                else
                    porosity = 1;
                end
            end
        end  
          if porosity == 1
              count = count +1;  
          end
      end
end 

final_percent = count*100/(row1*column1*axis)
