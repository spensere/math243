function norm = hw5_2c();
   h=.01; k=.01; l=k/h;
   a=1/3;
   % space range
   m = (2/h)+1;
   %time range
   n = (3/k)+1;
   % 2 time by space matrices for different inits
   v = zeros(n,m);
   w = zeros(n,m);
   % IC
   for i=1:m
      v(1,i)= 1-abs((i-1)*h-1);
      w(1,i)= v(1,i);
   end
   % BC
   for j=1:n
      v(j,1)=0;
      w(j,1)=0;
   end
   % c is the common coefficient of the FT-CD terms
   c=(a*l)/2;
   % i is time, j is space
   
    %init conditions of problem
    for j=2:m
        v(2,j)=v(1,j);
        w(2,j)=0;
    end
    %init done
    
    % d is common coefficient of CT-CD terms
    d=a*l;
    % leapfrog double loop
    for i=2:n-1
       for j=2:m-1
          v(i+1,j)=v(i-1,j)-d*(v(i,j+1)-v(i,j-1));
          w(i+1,j)=w(i-1,j)-d*(w(i,j+1)-w(i,j-1));
       end
       v(i+1,m)=v(i+1,m-1);
       w(i+1,m)=w(i+1,m-1);
    end
    
    
   u = zeros(1,m);
   for i=ceil(m/2):m
        u(i)= (i-(m/2))*(2/m);
   end
   plot(v(size(v,1),:));
   hold on;
   plot(w(size(w,1),:));
   hold off;
   norm1 = hNorm(u,v,h);
   norm2 = hNorm(u,w,h);
   fprintf( "h-norm with v^2=v^1 is %.5f\n", norm1 );
   fprintf( "h-norm with v^2=0 is %.5f\n", norm2 );
   
   
        