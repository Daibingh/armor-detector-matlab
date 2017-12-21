clc
clear all
close all
% videoFReader = vision.VideoFileReader('D:\我的文档\Visual Studio 2013\Projects\装甲视频\RedCar.avi');
list = getFileList('红典型图片');
videoPlayer = vision.VideoPlayer;
for i=1:length(list)
    frame = imread(['红典型图片/',list{i}]);
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
% img = cv.imread('红 装甲图片近.png');
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
