function v = hw7_4c();
    h=.1; k=.01; mu = k/(h^2);
    b=1/4;
    % space range -1 to 1, length 2
    m = (2/h)+1;
    %time range 2 seconds
    n = (2/k)+1;
    % time by space matrix
    v = zeros(n,m);
    % IC 1-abs(x)
    for i=1:m
        x = (i-1)*h-1;
        v(1,i)= 1-abs(x)+cos(3*pi*x);
    end

    % c is the common coefficient of the FT-CD terms
    c=b*mu;
    
    % FT-CD double loop, with periodic BC
    for i=1:n-1
        v(i+1,m)=(1-2*c)*v(i,m)+c*(v(i,2)+v(i,m-1));
        v(i+1,1)=v(i+1,m);
        for j=2:m-1
            v(i+1,j)=(1-2*c)*v(i,j)+c*(v(i,j+1)+v(i,j-1));
        end
        % satisfying  periodic BC
    end
    
    u = zeros(1,m);
    for i=ceil(m/2):m
        u(i)= (i-(m/2))*(2/m);
    end
    t=(n-1)/2;
    plot(v(n,:));
    hold on;
    plot(v(t,:));
    hold off;
    v;
        