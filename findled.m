function leds = findled(img, flags)
import cv.*;
img = im2double(img);
leds{1} = newRotatedRect();
img_blur = GaussianBlur(img,'KSize',[5,5]);
% figure;
% imshow(img);
% figure;
% imshow(img_blur);
if(strcmp(flags, 'red'))
    img_enemy = img_blur(:,:,1);
    img_sub = img_blur(:,:,2);
else
    img_enemy = img_blur(:,:,3);
    img_sub = img_blur(:,:,1);
end
img_eq = histeq(img_enemy);
img_bin = cv.threshold(img_eq, 0.98, 'MaxValue', 255, 'Method', 'Binary');
% figure;
% imshow(img_bin);
contours = findContours(img_bin,'Mode', 'External', 'Method', 'None');
i_show_con = drawContours(repmat(img_bin,1,1,3), contours, 'Color', [255,0,0], 'Thickness', 2);
% figure;
% imshow(i_show_con);
i_show_rre = repmat(img_bin,1,1,3);
num = 1;
th =2/255;
for i=1:length(contours)
    if length(contours{i}) < 8
        continue;
    end
    rrect = minAreaRect(contours{i});
    rrect = adjustRect(rrect);
    i_show_rre = drawRect(i_show_rre, rrect, [0,255,0], i);
    if (abs(rrect.angle) < 15 || 180 - abs(rrect.angle) < 15) && rrect.size(2) / rrect.size(1) > 1.2
        i_show_rre = drawRect(i_show_rre, rrect, i);
        rect = cv.RotatedRect.boundingRect(rrect);
        rect = getSafeRect(rect, img);
        m = cacMean(img, rect);
        if (strcmp(flags, 'red') && m(1)-m(2) > th) || (strcmp(flags, 'blue') && m(3)-m(1) > th)
            leds{num} = rrect;
            i_show_rre = drawRect(i_show_rre, rrect, [255,0,0], i);
            num = num+1;
        end
    end
end
% save('led.mat','leds');
% figure;
% imshow(i_show_rre );
end