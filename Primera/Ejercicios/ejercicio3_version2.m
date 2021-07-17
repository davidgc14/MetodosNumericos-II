clear all;
more off;
clc;

function y = f(x)
  y = - x.^3 * 1/9 - 1;
endfunction
%

function y = A(x0, x1, x2)
  y = x0 - (x1 - x0)^2 / (x2 - 2*x1 + x0);
endfunction
%

x0 = -1.5;
tol = 1e=7;

do
  for n = 1:3
    f0 = f(x0);
    
    v[n-1] = f0;
    x0 = f0;
  endfor
  
  
until 
