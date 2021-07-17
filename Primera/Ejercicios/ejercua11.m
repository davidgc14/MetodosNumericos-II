clc;
clear all;
more off; %sin interrupciones en pantalla

disp("EJERCICIOS PRÁCTICOS -- ECUACIONES");
disp("");

disp("Ejercicio 11.-");

function y = f(x)
  y = [sin(x(1)*x(2))/2 - x(2)/(4*pi) - x(1)/2; 
      (1 - 1/(4*pi)) * (exp(2*x(1)) - e) + e/pi * x(2) - 2*e*x(1)]; %hemos expresado esto en forma de matriz columna
endfunction

%matriz jacobiana
function M = J(x)
  M = [cos(x(1)*x(2))*x(2)/2 - 1/2, cos(x(1)*x(2))*x(1)/2 - 1/(4*pi);
       (1 - 1/(4*pi))*exp(2*x(1))*2 - 2*e, e/pi];
endfunction

tol = 10^(-8);
semillas = [linspace(-2, 2, 5); 
            linspace(-2, 2, 5)]';
            
figure(1);
clf;
hold on;

for s = 1:rows(semillas)
  x0 = semillas(s,:)';
  printf("Desde [%5.2f, %5.2f] ", x0');
  x1 = x0;
  n = 0;
  do
    n++;
    x0 = x1;
    x1 = x0 - J(x0)\f(x0); %\ significa resolver un sistema lineal Jx=f
    % plot([x0(1), x1(1)], [x0(2), x0(2)], 'b');
  until norm(x1 - x0,1)/norm(x1, 1) < tol;
  %norm es funcion norma, primera componente el vector y segundo componenete la norma(1,2,inf)
  
  printf(" en %2d iteraciones se obtuvo [%18.14f, %18.14f]\n", n, x1);
  plot([x1(1) semillas(s,1)], [x1(2) semillas(s,2)], 'b');
  plot(x1(1), x1(2), '*r');
  plot(semillas(s,1), semillas(s,2), '^b');
endfor

hold off;
disp("=====FIN DEL EJERCICIO=====");


