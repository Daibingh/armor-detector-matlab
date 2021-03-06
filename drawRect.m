function img = drawRect(img, rr, color, i)
import cv.*;
if rr.size(1) == 0
    return;
end
if nargin == 2
    color = [0,0,255];
end
pt = RotatedRect.points(rr);
img = line(img, pt(1,:), pt(2,:), 'Color', color, 'Thickness', 2);
img = line(img, pt(2,:), pt(3,:), 'Color', color, 'Thickness', 2);
img = line(img, pt(3,:), pt(4,:), 'Color', color, 'Thickness', 2);
img = line(img, pt(4,:), pt(1,:), 'Color', color, 'Thickness', 2);
if nargin == 4
   img = insertObjectAnnotation(img,'circle',[rr.center, 1],i, 'Color', color);
end
end