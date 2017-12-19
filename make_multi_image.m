clc, clear all
list = getFileList('ºìµäĞÍÍ¼Æ¬');
for i=1:length(list)
    multi_img(:,:,:,i) = imread(['ºìµäĞÍÍ¼Æ¬/',list{i}]);
end
save('multi_img.mat','multi_img');