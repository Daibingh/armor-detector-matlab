function m = cacMean(img, r)
t=size(img);
m= t(1);
n= t(2);
n1 = r(1)+1;
n2 = r(1)+r(3);
m1 = r(2)+1;
m2 = r(2)+r(4);
temp1 = sum(img(m1:m2,n1:n2,:),1); 
temp2 = sum(temp1,2);
s = temp2(:);
m = s/(r(3)*r(4));
end