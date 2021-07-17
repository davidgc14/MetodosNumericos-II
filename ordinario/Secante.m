clc;
clear all;

function y = g(x)
  y = x^3 + x - 3;
endfunction
%

x0 = 1;
x1 = 2;

x2 = x1;
tol = 1e-6;

g0 = g(x0);


do
  g1 = g(x1);
  
  x2 = (x0*g1 - x1*g0)/(g1 - g0);
  
  x0 = x1;
  x1 = x2;
  g0 = g1;
  
  err = abs(x1 - x0);
  
until err < tol;

printf('La solucion es %6.8f', x1);


##########################################################################
##########################################################################
##########################################################################

clc;
clear all;

function y = g(x)
  y = x^3 + x - 3;
endfunction
%

x0 = 1;
x1 = 2;
x2 = x1;
tol = 1e-6;



disp('METODO DE LA SECANTE');
disp(' n    Xn      g(Xn)    err');

formato = '%3d %6.8f %10.2e %10.2e \n';
printf('%3d %6.8f %10.2e \n', 0, x0, g(x0));
printf('%3d %6.8f %10.2e \n', 1, x1, g(x1));


g0 = g(x0);
n = 1;

do
  n++;
  g1 = g(x1);
  
  x2 = (x0*g1 - x1*g0)/(g1 - g0);
  
  x0 = x1;
  x1 = x2;
  g0 = g1;
   
  err = abs(x1 - x0);
  
  printf(formato, n, x1, g(x1), err);
  
until err < tol;

printf('La solucion es %6.8f \n', x1);