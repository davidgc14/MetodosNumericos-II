clc;
clear all;
more off;


function y = f(x)
    y = [x(1)^2 + x(1) * x(2) - 10; 
        3*x(1) * x(2)^2 + x(2) - 57];
endfunction

function y = f1(x) % el jacobiano
    y = [2 * x(1) + x(2), x(1); 
        3 * x(2)^2, 6 * x(1) * x(2) + 1];
endfunction


x0 = [1.5; 3.5];
tol = 1e-6;


disp('METODO DE NEWTON-RAPHSON PARA SISTEMAS');
disp( '  n       x         y       dif.abs');

printf('%3d %6.8f %6.8f\n', 0, x0);

n = 0;
x1 = x0;

do
    n++;
    x0 = x1;

    x1 = x0 - f1(x0) \ f(x0);

    printf('%3d %6.8f %6.8f %9.2e\n', n, x1, norm(x1-x0,Inf));

until abs(x1-x0) <= tol
