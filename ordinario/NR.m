clc;
clear all;

function y = g(x)
  y = x^3 + x - 3;
endfunction


function y = dg(x)
  y = 3*x^2 + 1;
endfunction


x0 = 1.5;
x1 = x0;
tol = 1e-6;

do
  x0 = x1;
  x1 = x0 - g(x0)/dg(x0);
until abs(x0 - x1) < tol;

printf('Solucion es %6.8f', x1);

################################################################
################################################################
################################################################


clc;
clear all;

function y = g(x)
  y = x^3 + x - 3;
endfunction
%
function y = dg(x)
  y = 3*x^2 + 1;
endfunction
%

x0 = 1.5;
x1 = x0;

tol = 1e-6;
n = 0;

formato = '%3d %6.8f %10.2e \n';

disp('METODO NEWTON-RAPHSON');
disp('  n     Xn         err');
printf('%3d %6.8f \n', n, x1);


do
  n++;
  
  x0 = x1;
  x1 = x0 - g(x0)/dg(x0);
  
  err = abs(x0 - x1);
  
  printf(formato, n, x1, err);

until err < tol;

printf('Solucion es %6.8f', x1);