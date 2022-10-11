function norm = hw6_3b(k);
   h=.1; 
   l=k/h;
   a=1/3;
   % space range
   m = (2/h)+1;
   %time range
   n = (36/k)+1;
   % time by space matrix
   v = zeros(n,m);
   u = zeros(1,m);
   % IC
   % will also make analytic solution at t=36, which
   % is identical to IC
   for i=1:m
      v(1,i)= 1-abs((i-1)*h-1);
      u(i)= 1-abs((i-1)*h-1);
   end
   % BC
   for j=1:n
      v(j,1)=0; 
   end
   % c is the common coefficient of the FT-CD terms
   c=(a*l)/2;
   % i is time, j is space
   
    %init leapfrog with FD-CD
    for j=2:m-1
        v(2,j)=v(1,j)-c*(v(1,j+1)-v(1,j-1));
    end
    v(2,m) = v(2,m-1);
    %init done
    
    % d is common coefficeint of CT-CD terms
    d=a*l;
    % leapfrog double loop
    for i=2:n-1
       % Periodic BC, space index one gets set first,
       % final space index copies it
       v(i+1,1)=v(i-1,1)-d*(v(i,2)-v(i,m-1));
       v(i+1,m)=v(i+1,1);
       for j=2:m-1
          v(i+1,j)=v(i-1,j)-d*(v(i,j+1)-v(i,j-1));
       end
    end
    
   % analytic solution at t=36, which should match IC 
   %u = zeros(1,m);
   %for i=ceil(m/2):m
%    u(i)= (i-(m/2))*(2/m);
   %end
   plot(v(size(v,1),:));
   hold on;
   plot(u);
   hold off;
   
   norm = hNorm(u,v,h)
        