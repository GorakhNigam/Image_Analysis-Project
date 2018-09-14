Indication = 'Name the image file with Numbers e.g. 1.tif, 2.tif, et'
prompt1 = 'Enter 2 for 2D porosity and 3 for 3D porosity';
num = input(prompt1);
prompt2 = 'Enter the threshold value';
threshold = input(prompt2);
if num == 3
    prompt1 = 'Enter The number of images';
    n = input(prompt1);
    for i=1:n
        images{i} = imread(sprintf('%01d.tif',i));
        images{i} = images{i}(1:690,1:1023);
    end
    
 filtered = [];
 Prompt3 = 'Enter 1 for Mean, 2 for Median, 3 for Gauss, 4 for Wiener Filters for 3D porosity ';
 nfilt = input(Prompt3);
 if nfilt == 3
    for i=1:n    
        out = imgaussfilt(images{i},3);
        filtered = cat(3, filtered, out);

    end

 elseif nfilt == 1
    for i = 1:n
        h = fspecial('average',3);
        out = imfilter(images{i},h);
        filtered = cat(3, filtered, out);
    end
 elseif nfilt == 2
    for i = 1:n
        out = medfilt2(imgages{i});
        filtered = cat(3, filtered, out);
    end
 else 
     for i=1:3
     out = wiener2(images{i},[5 5]);
     filtered = cat(3, filtered, out);
     end
 end 
    %%distance caliberation
    %imshow('O_sandstone00.tif');

    %  h = imdistline(gca);
    %  api = iptgetapi(h);

    %20pixels = 1um

   
    % figure
    % subplot(1,2,1)
    % imshow(img);
    % subplot(1,2,2)
    % imshow(out/256);


    [row1,column1,axis] = size(filtered);
    syms porosity count 
    porosity = 0;
    count = 0;
    %stacking and porosity calculation
    for a = 1:row1
        for b = 1:column1
            if filtered(a,b,1) < threshold
                for z = 1:axis 
                    porosity = 0;
                    if filtered(a,b,z) > threshold
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

 final_percent_3D = count*100/(row1*column1*axis)
end
if num == 2
    img = imread('1.tif');
    img = img(1:690,1:1024);
    Prompt3_2D = 'Enter 1 for Mean, 2 for Median, 3 for Gauss, 4 for Wiener Filters for 3D porosity ';
    nfilt_2D = input(Prompt3_2D);
    if nfilt_2D == 1
        h = fspecial('average',3);
        out = imfilter(img,h);
    end
    if nfilt_2D == 2
        out = medfilt2(img);
    end
    if nfilt_2D == 3
        out = imgaussfilt(img,3);
    end
    if nfilt_2D == 4
        out = wiener2(img,[5 5]);
    end
    [row,col] = size(out);
    syms cou countk;
    cou = 0;
    countk = 0;
    for i = 1:row
        for j = 1:col
            if out(i,j) < threshold
                cou = cou+1;
            end
            countk = countk + 1;
        end
    end
    perc_2D = (cou*100)/(row*col)
end