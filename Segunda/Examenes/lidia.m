clear all; clc; more off; % preparacion
disp("");
disp("--PRUEBA 2--");
disp("");

%Definición de la función dada
function y = f(x) %x'(t)
  y = cos(0.03*x)+log(x+3)+3;
endfunction

function z=RKclasico(t,x,h)%Runge-Kutta clásico
  K1=f(t,x); 
  K2=f(t+h/2,x+h/2*K1);
  K3=f(t+h/2,x+h/2*K2);
  K4=f(t+h, x+h*K3);
  z=x + h/6 *(K1+2*K2+2*K3+K4);
endfunction

disp("Apartado a-)");
n=30;
t(1)=0; %t0
x(1)=1; %x0
disp(" n       hn      tn         xn  ");
disp("---    ------   ----      --------");
printf("%2d    %4.4f  %10.4f  %10.4f\n", 0,0,t(1),x(1));
for i=1:n
  t(i+1)=50*sqrt(sin(i*pi/80));
  h(i)=t(i+1)-t(i);
  x(i+1)=RKclasico(t(i),x(i),h(i));
  printf("%2d    %4.4f  %10.4f   %10.4f\n", i, h(i),t(i+1), x(i+1));
endfor

disp("");
disp("Apartado b)");
disp(" ");

d(1)=(x(2)-x(1))/h(1); %x'(t0) %Formula progresiva para el extremo

for i=2:n %Construimos las formulas de tipo interpolatorio
  k = 1;
  nodos = [t(i-1) t(i) t(i+1)];
  j = length(nodos)-1;
%preparacion de la matriz de Vandermonde
  M = ones(j+1,j+1); %ya va la primera fila de 1 para evitar un posible 0^0
  for z=1:j %restante matriz de Vandermonde (potencias 1 a n)
  M(z+1,:) = nodos.^z;
  endfor
%terminos independientes
  b = zeros(j+1,1);
  b(k+1,1) = factorial(k); %para evitar un posible 0^0
  for z=k+1:j %OJO sólo hasta n
  b(z+1,1) = factorial(z)/factorial(z-k)*t(i)^(z-k);
  endfor
alpha= (M\b); %pesos
xn=[x(i-1) x(i) x(i+1)];
d(i)= xn*alpha;  %Aproximación de la derivada
endfor

d(n+1)=(x(n+1)-x(n))/h(n); %formula regresiva para el extremo

disp("Apartado c)");
figure(1);
plot(t,f(t),'b;(t,f(t,x);',t,d,'r;(t,d);');

disp("Apartado d)");
printf("En el nodo central t15=%10.4f\n", t(16));
printf("la derivada vale x'(t15)=f(t15,x15)=%10.6f\n",f(t(16),x(16)));
printf("y su aproximación d15=%10.6f\n", d(16));