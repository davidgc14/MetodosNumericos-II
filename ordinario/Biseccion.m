clc;
clear all;

function y = g(x)
  y = x^3 + x - 3;
  endfunction
%

tol = 1e-6;
a = 1;
b = 2;

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
  
until b - a < tol;
%
printf('%6.8f', m);


###############################################################################
#################VERSION IMPRIMIBLE POR PANTALLA###############################
###############################################################################

clc;
clear all;

function y = f(x)
  y = x^3 + x - 3;
endfunction
%

a = 1;
b = 2;
tol = 1e-6;

fa = f(a);
fb = f(b);


disp('METODO BISECCION ACTIVADO');
disp('  n       a         b         m         f(m)      error');

n = 0;
formato = '%3d %6.8f %6.8f %6.8f %10.3e %9.2e \n';


do
  m = (a + b) / 2;
  fm = f(m);
  err = (b - a) / 2;
  
  printf(formato, n, a, b, m, fm, err);
  n++;
  
  if fa*fm < 0
    b = m;
    fb = fm;
  else
    a = m;
    fa = fm;
  endif

until err < tol;
%

printf('Solucion es %6.8f con error de %2.2e \n', m, err);