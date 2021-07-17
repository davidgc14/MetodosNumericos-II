clear all;
clc;
more off;

pto = 3;

function y = f(x)
    y = x.^3 .* e.^(-x ./ 3) - 0.8 * sin(x);
endfunction

############################
% PRIMER APARTADO
x = linspace(0,100,500);

plot(x, f(x), 'k;f(x);', [0,100], [pto,pto], 'b;Función constante;');

############################
% SEGUNDO APARTADO

% Aplicamos bisección a la función f(x)-3 
% El intervalo de partida ha de tener amplitud potencia de dos para que quede exactamente amplitud 1

function y = g(x)
    y = f(x) - 3;
endfunction

tol = 1;
a = 20;
b = 36;

ga = g(a);
gb = g(b);


do
  m = (a + b) / 2;
  gm = g(m);
  
  if ga*gm < 0
    b = m;
    gb = gm;
  else
    a = m;
    ga = gm;
  endif
  
until b - a <= tol;

printf('Su intervalo de amplitud relativo menor que uno es [%2d, %2d] \n', a, b);


############################
% TERCER APARTADO

% Necesitamos el cálculo de la derivada de la función g(x)
function y = dg(x)
    y = (-1/3) * x.^3 .* e.^(-x ./ 3) + 3 * x.^2 .* e.^(-x ./ 3) - 0.8 * cos(x);
endfunction


x0 = (b + a) / 2;
x1 = x0;
tol = 1e-10;
n = 0;

formato = '%3d %6.8f %10.2e \n';

disp('--------------APARTADO 3----------------');
disp('  n     Xn         err');
printf('%3d %6.8f \n', n, x1);


do
    n++;

    x0 = x1;
    x1 = x0 - g(x0)/dg(x0);

    err = abs(x0 - x1)/abs(x0);
    
    printf(formato, n, x1, err);

until err < tol | n > 20 ;

if err < tol
    printf('La aproximacion calculada es %6.8f con error %10.2e \n', x1, err);
else
    disp('No se puede aproximar por el metodo NR');
endif
