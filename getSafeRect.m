function r = getSafeRect(r, img)
t=size(img);
m= t(1);
n= t(2);
if r(1)<0
    r(1) = 0;
end
if r(2)<0
    r(2) = 0;
end
w = n-r(1);
if w < r(3)
    r(3) = w;
end
h = m-r(2);
if h < r(4)
    r(4) = h;
end
end