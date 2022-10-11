function norm = hw5_1(h,k);
    v = hw2(h, k);
    m = (2/h)+1;
    u = zeros(1,m);
    for i=ceil(m/2):m
        u(i)= (i-(m/2))*(2/m);
    end
    %plot(v(size(v,1),:));
    norm = hNorm(u,v,h)
        