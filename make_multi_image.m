clc, clear all
list = getFileList('�����ͼƬ');
for i=1:length(list)
    multi_img(:,:,:,i) = imread(['�����ͼƬ/',list{i}]);
end
save('multi_img.mat','multi_img');