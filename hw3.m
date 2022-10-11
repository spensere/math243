% h is the space interval, k the time interval
function u = hw3(h,k,t);
   l=k/h;
   a=1/3;
   % space range
   m = (2/h)+1;
   %time range t seconds
   n = (t/k)+1;
   % time by space matrix
   u = zeros(n,m);
   % IC
   for i=1:m
      u(1,i)= 1-abs((i-1)*h-1);
   end
   
   %% BC is periodic, set during loop
   % BC
   %for j=1:n
    %  u(j,1)=0; 
   %end
   
   %time loop
   for i=1:n-1
       for j=2:m
          u(i+1,j)=(1-a*l)*u(i,j)+a*l*u(i,j-1);  
       end
       u(i+1,1)=u(i+1,m);
   end
end