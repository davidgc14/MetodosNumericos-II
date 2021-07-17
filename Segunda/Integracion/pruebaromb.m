clear all;

function y = f(x) 
  y = 1 ./ (x.^2 + 1); 
endfunction

a = -5; 
b = 5; 
tol = 1e-4;

N = 1; 
n = 1; 
h = b - a; %amplitud del intervalo

R(1,1) = h/2 * (f(a) + f(b)); %fórmula del trapecio, en realidad es la R(0,0)
eval = 2;

printf("%d %10.8f\n", 0, R(1,1));

do %bucle para contstruir la primera columna

  %Primer bloque:  (ver pagina 30 tema 2)
  x = linspace(a + h/2, b - h/2, n);
  R(N+1,1) = 1/2 * (R(N,1) + h * sum(f(x)));

  N++;
  n = 2*n;
  h = h/2;
  
  printf("%d %10.8f \n", N-1, R(N,1));

until N == 10;