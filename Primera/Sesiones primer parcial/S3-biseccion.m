#####################################################
#### script para ilustrar el metodo de biseccion ####
#####################################################
clc;
function y = f(x)
  y = x^3+x-3;
endfunction
a = 1;
b = 2;
eps = 1e-6;
fa = f(a);
fb = f(b);
disp('METODO DE BISECCION');
disp(' n      a          b          m         f(m)     err');
n=0;
do
  m=(a+b)/2; fm = f(m);
  printf('%3d %10.8f %10.8f %10.8f %9.2e %9.2e\n',n,a,b,m,fm,(b-a)/2);
  if fa*fm < 0
    b=m; fb=fm;
  else
    a=m; fa=fm;
  endif
  n++;
until b-a <= eps
