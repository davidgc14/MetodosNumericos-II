
#ESTE ARCHIVO ES OTRO TIPO DE ARCHIVO

#ATENCI�N: ESTO NO ES UN PROGRAMA, ES UNA FUNCI�N

#UNA FUNCI�N ES UN ARCHIVO QUE EMPIEZA ESTRICTAMENTE POR function

function [x1, msg] = fNewtonRaphson(f, f1, x0, e)
  
  
  %resultados por defecto
  x1 = 0;
  msg =  'ERROR DESCONOCIDO';
  
  
  %COMPROBACION: la tolerancia es correcta
  if e <= 0
    msg = 'ERROR: la tolerancia no es positiva';
    return;
  endif
  
  
  %metodo NR
  n = 0; %iteraciones
  x1 = x0;
  
  do
    n++;
    x0 = x1;
    x1 = x0 - f(x0) / f1(x0);
  until abs(x1 - x0) / abs(x1) <= e;
  
  %salida con exito
  msg = ['En ' int2str(n) ' iteraciones '];
  %int2str transforma un entero en un caracter
  
endfunction

#{
PROPUESTAS:
1. Poner un tope de iteraciones para que 
   no haya bucles infinitos cuando la funci�n no converja
   (por ejemplo, dejar un m�ximo de 25 iteraciones)
2. hacer una funci�n que muestre en pantalla 
   cada iteraci�n.
#}
