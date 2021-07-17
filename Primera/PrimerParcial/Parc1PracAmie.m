clear all;
clc;


function y = f(x)
  y = x.^3 .* exp(-x/3) - 0.8 .* sin(x);
endfunction


%EJERCICIO 1
x = linspace(0,100,1000);
 

figure(1);
plot(x, f(x), 'r', [0 100], [3 3], 'b');


%EJERCICIO 2

%aplicamos metodo de biseccion

a = 20;
b = 30;

fa = f(a) - 3;
fb = f(b) - 3;


do
  m = (a + b) / 2;
  fm = f(m) - 3;
  
  if fa*fm < 0
    b = m;
    fb = fm;
  else
    a = m;
    fa = fm;
  endif
  
until b-a < 1;

printf('[ %1.1f, %1.1f] \n', a, b);
%El resultado seria el intervalo [25,26]

%EJERCICIO 3

x0 = 25.5;
x1 = x0;
tol = 1e-10;

function y = f1(x)
  y = exp(-x/3) * (3 * x^2 - (1/3) * x^3) - 0.8 .* cos(x);
endfunction


do
  x0 = x1;
  x1 = x0 - (f(x0) - 3)/f1(x0);
  printf('%6.8f \n', x1);
until abs(x0 - x1)/abs(x0) < tol;

printf('Solución es %6.8f', x1);
