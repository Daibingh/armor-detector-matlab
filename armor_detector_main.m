clc
clear all
close all
% videoFReader = vision.VideoFileReader('D:\�ҵ��ĵ�\Visual Studio 2013\Projects\װ����Ƶ\RedCar.avi');
list = getFileList('�����ͼƬ');
videoPlayer = vision.VideoPlayer;
for i=1:length(list)
    frame = imread(['�����ͼƬ/',list{i}]);
    leds = findled(frame, 'red');
    targets = findtarget(leds);
    for j=1:length(targets)
        frame = drawRect(frame, targets{j});
    end    
    step(videoPlayer, frame);
%     pause(50/1000);
end
release(videoPlayer);
% release(videoFReader);

% tic
% img = cv.imread('�� װ��ͼƬ��.png');
% leds = findled(img, 'red');
% targets = findtarget(leds);
% for i=1:length(targets)
%     img = drawRect(img, targets{i});
% end
% figure;
% imshow(img);
% toc


% load cellsequence
% implay(cellsequence,10);

% fileFolder = fullfile(matlabroot,'toolbox','images','imdata');
% dirOutput = dir(fullfile(fileFolder,'AT3_1m4_*.tif'));
% fileNames = {dirOutput.name}';
% montage(fileNames, 'Size', [2 5]);
