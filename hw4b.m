% h is the space interval, k the time interval
function u = hw4b(h,k,t);
   l=k/h;
   a=1/3;
   % space range
   m = (2/h)+1;
   %time range t seconds
   n = (t/k)+1;
   % time by space matrix
   u = ones(n,m);
   % IC
   for j=1:m
      u(1,j)= 1-abs((j-1)*h-1);
   end
   disp(u(1,:))
   %% BC is periodic, set during loop
   % BC
   %for j=:1:n
    %  u(j,1)=0; 
   %end
   
   % c is the common coefficient of the terms
   c=(a*l)/2
   % i is time, j is space
   for i=1:n-1
       u(i+1,1)=u(i,1)-c*(u(i,2)-u(i,m));
       %u(i+1,1)=u(i+1,m);
       for j=2:m-1
          u(i+1,j)=u(i,j)-c*(u(i,j+1)-u(i,j-1));
       end
       u(i+1,m)=u(i+1,1);
   end
end
