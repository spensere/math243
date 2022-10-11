% h is the space interval, k the time interval
function u = hw2(h,k);
   l=k/h;
   a=1/3;
   % space range
   m = (2/h)+1;
   %time range
   n = (3/k)+1;
   % time by space matrix
   u = zeros(n,m);
   % IC
   for i=1:m
      u(1,i)= 1-abs((i-1)*h-1);
   end
   % BC
   for j=1:n
      u(j,1)=0; 
   end
   %u(1)=1;
   %for t=2:n
    %  u(t)=(1+3*k)*u(t-1);
   %end
   %time loop
   for i=1:n
       for j=2:m
          u(i+1,j)=(1-a*l)*u(i,j)+a*l*u(i,j-1);  
       end
   end
end