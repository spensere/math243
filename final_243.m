function final_243(h,k); 
    mu = k/(h^2);
    b=1/4;
    % space range -2 to 2, length 4
    m = (4/h)+1
    %time range 2 seconds
    n = (.5/k)+1;
    
    % time by 2D space matrix
    v = zeros(n,m,m);
    % 2D space shape matrix
    s = ones(m+2,m+2);
    s(1,:)=0; s(m+2,:)=0;
    s(:,1)=0; s(:,m+2)=0;
    
    % IC 1-abs(x)
    for i=1:m
        for j=1:m
            t = 1-10*(((i-1)*(h/2)-1)^2+((j-1)*(h/2)-1)^2);
            v(1,i,j)= max(t,0);
        end
    end

    % c is the common coefficient of the FT-CD terms
    c=b*mu;
    disp("2c must be less than 1/2:");
    disp(2*c);
    
    %
    % FT-CD double loop, with periodic BC
    for i=1:n-1
        for j=1:m
            for k=1:m
                l = 0;
                r = 0;
                u = 0;
                d = 0;
                if s(j,k+1)
                    l=v(i,j-1,k);
                end
                if s(j+2,k+1)
                    r=v(i,j+1,k);
                end
                if s(j+1,k)
                    u=v(i,j,k-1);
                end
                if s(j+1,k+2)
                    d=v(i,j,k+1);
                end
                v(i+1,j,k)=(1-4*c)*v(i,j,k)+c*(l+r+u+d);
            end
        end
    end 
    %}
    
    colormap(hot);
    r= 0:.01:1;
    for i=1:10
        contourf( squeeze(v(i,:,:)), 'LineStyle', 'none', r);
    end

    
    

        