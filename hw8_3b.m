function v = hw8_3b();
    h=.1; k1=.1; k2=1; 
    mu1 = k1/(h^2); mu2=k2/(h^2)
    b=1/4;
    % space range -1 to 1, length 2
    m = (2/h)+1;
    %time range 2 seconds
    n1 = (2/k1)+1;
    n2 = (2/k2)+1;

    
    % time by space matrix
    v1 = zeros(n1,m);
    v2 = zeros(n2,m);

    % IC 1-abs(x)
    for i=1:m
        v1(1,i)= 1-abs((i-1)*h-1);
        v2(1,i)= 1-abs((i-1)*h-1);
    end

    % c is the common coefficient of the FT-CD terms
    c1=b*mu1;
    c2=b*mu2;
    
    %matrix form of scheme
    B1=zeros(m,m);
    B1(1,1)=-1;
    B1(m,m)=-1;
    B2=zeros(m,m);
    B2(1,1)=-1;
    B2(m,m)=-1;
    for i=2:m-1
        B1(i,i)=-2*c1;
        B1(i-1,i)=c1;
        B1(i+1,i)=c1;
        B2(i,i)=-2*c2;
        B2(i-1,i)=c2;
        B2(i+1,i)=c2;
    end
    
    % scheme action
    I=eye(m);
    for i=1:n1-1
        v1(i+1,:)=(I+B1)*v1(i,:)';
    end
    for i=1:n2-1
        v2(i+1,:)=(I+B2)*v2(i,:)';
    end

    plot(v1(n1,:));
    hold on;
    plot(v2(n2,:));
    hold off;
        