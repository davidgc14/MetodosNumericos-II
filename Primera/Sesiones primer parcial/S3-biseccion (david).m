#METODO DE BISECCION#

clc;

function y = f(x)
  #y=x;
  y = x^3 + x - 3; # importante el ; para no ensuciar la ventana de comandos
endfunction

#suponemos que es continua...

a = 1;
b = 2;
eps = 1e-6; #error maximo admisible
fa = f(a);
fb = f(b);
%Aqui deberiamos añadir una linea que verificase que f(a) tiene distintos signo que f(b)
m = (a + b) / 2;
fm = f(m);

#contruccion de la tabla 

disp('METODO DE BISECCION'); #disp incluye salto de linea e imprime en la ventana de comandos 
disp('  n      a          b          m         f(m)      err'); #disp solo imprime texto (version simple de printf 
formato = '%3d %6.8f %6.8f %6.8f %9.2e %9.2e\n'; #3d significa que la n puede llegar a tener 3 digitos
#basicamente reserva 3 casillas para la entrada n
#f significa floating point (punto real)
#el numero antes del punto indica el numero total de cifras (contando el punto)
#el numero despues del punto indica el numero de decimales
#NOTA: si el numero total de cifras es inferior al numero de decimales, se autocorrige
#en este caso %6.8f == %10.8f
#el espacio que separa los comandos % tambien separa las salidas de comandos
#la e sola significa que ponga los exponentes que hagan falta

printf(formato, 0, a, b, m, fm, (b - a)/2);
#(b-a)/2 es la cota del error

#ahora hacemos bucle para completar la tabla

n = 0;
do
  n++;
  m = (a + b) / 2;
  fm = f(m);
  printf(formato, n, a, b, m, fm, (b - a)/2);
  if fm == 0
    disp("Eureka")
    break #creo que es mas correcto con return, o añadiendo la condicion en until
  endif
  if fa * fm < 0
    b = m;
    fb = fm;
  else
    a = m;
    fa = fm;
  endif
until b - a <= eps #aquí deberia ser (b-a)/2, pero como estos valores ya han sido evaluados, son los correctos