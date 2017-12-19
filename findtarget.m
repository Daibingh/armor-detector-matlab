function targets = findtarget(rr)
 targets{1} = newRotatedRect();
num = length(rr);
if num <2
    return;
end
k=1;
for i=1:num-1
    for j=i+1:num
        xAngle = abs(rr{i}.angle - rr{j}.angle);
        if xAngle < 15
           if abs(rr{i}.size(2) / rr{j}.size(2) - 1) < 0.8
              w = sqrt((rr{i}.center(1) - rr{j}.center(1))*(rr{i}.center(1) - rr{j}.center(1)) + (rr{i}.center(2) - rr{j}.center(2))*(rr{i}.center(2) - rr{j}.center(2)));
              h = (rr{i}.size(2) + rr{j}.size(2)) / 2;
              ang = (rr{i}.angle + rr{j}.angle) / 2;
              if w / h > 1.2 && w / h < 5
                center_x = (rr{i}.center(1) + rr{j}.center(1)) / 2;
                center_y = (rr{i}.center(2) + rr{j}.center(2)) / 2;
                target = newRotatedRect();
                target.angle = ang;
                target.size = [w,h];
                target.center = [center_x, center_y];
                targets{k} = target;
                k=k+1;
              end
           end
        end
    end
end
end