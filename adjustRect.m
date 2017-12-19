function rr = adjustRect(rr)
if rr.size(1) > rr.size(2)
    t = rr.size(1);
    rr.size(1) = rr.size(2);
    rr.size(2) = t;
    rr.angle = rr.angle + 90;
end
end