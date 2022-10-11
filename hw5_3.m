function m = hw5_3();
   % x = beta
   h=10/n;
   x = -5:.5:5;
   % y = g
   k=10/n;
   y = -5:.5:5;
   [X,Y] = meshgrid(x,y);
   Z = abs( (7+4i*X)*(Y^2) - (8-2i*X)*Y+1 );
   mesh(X,Y,Z);