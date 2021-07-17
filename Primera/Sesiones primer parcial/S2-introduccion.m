##############################################################################
# METODOS NUMERICOS II -- GRADO EN MATEMATICAS -- SESIONES PRACTICAS OCTAVE ##
##############################################################################

### SESION 1: REVISION DE ASPECTOS BASICOS DE OCTAVE.
% en este documento no usaremos acentos debido a las incompatibilidades
% que existen a la hora de mostrar mensajes. Asi pues,
% tratamos tres aspectos basicos que usaremos con frecuencia:
% definicion de funciones, listas, graficas de curvas en el plano.
%
### COMENTARIOS Y ANOTACIONES
% son muy utiles para ayudar a interpretar los codigos.
% a partir del simbolo % o # el resto de una linea 
% se considera comentario y Octave lo ignora
%{
 tambien se puede marcar todo un bloque con varias
 lineas encerrandolos ente simbolos %{ %} o bien #{ #}
 a condicion de que figuren solos en la linea
%}   
%
### AYUDA
% la documentacion se consigue con Mayus+F1
% cuando el cursor está en una palabra
%
### DEFINICION DE FUNCIONES (de tres formas diferentes)
%
clear all; % esta orden limpia cualquier valor de variables que se hayan usado
          % con anterioridad a la ejecucion de este script.
          % Es buena costumbre incluirla al principio
clc; % esta orden limpia la ventana de comandos
%
## forma 1, la mas habitual
% se usa dentro de un programa o bien en un archivo separado
%
function valor=fun1(x) %fun1 es el nombre de la funcion
  % x es la variable de entrada
  % valor es el resultado que devuelve
  % ninguna de estas variables tiene relacion con otras
  % variables con el mismo nombre que pudiera haber fuera
  valor=x.^2+1+cos(pi*x);
  % observese el puntito. Sirve para evaluaciones vectoriales
endfunction
%
% Ahora comprobamos el funcionamiento de fun1.
% Los resultados salen en la ventana de comandos.
printf("Resultados de fun1\n");
fun1(3)
fun1(6)
fun1([-2 2 3]) % observese el funcionamiemto vectorial
%
## forma 2: funcion anonima. Conviene en ciertos casos
%
fun2=@(x)x.^2+1+cos(pi*x); % esto define una funcion de nombre 'fun2' con un argumento
printf("Resultados de fun2\n");
fun2(3)
fun2(6)
fun2([-2 2 3])
%
## forma 3: con la orden inline y cadena de caracteres. Poco habitual
%
fun3=inline('x.^2+1+cos(pi*x)','x');
printf("Resultados de fun3\n");
fun3(3)
fun3(6)
fun3([-2 2 3])
%
### CONSTRUCCION DE GRAFICA
% Vamos a hacer la grafica de fun1 en el intervalo [-1,5] 
% Primero evaluamos la funcion en 50 puntos igualmente espaciados del intervalo.
clear x y;
x=linspace(-1,5,50);
y=fun1(x);
% nota: alternativa no vectorial
% y=zeros(1,50);
% for i=1:50
%   y(i)=fun1(x(i));
% endfor
%
## Ahora la grafica.
%
figure(1); % necesario si voy a hacer varias graficas separadas
plot(x,y,'g',x,y,'--r','linewidth',4);
% pinta una curva verde y encima una roja gruesa discontinua
legend('fun1','location','southeast'); % leyenda opcional
axis([-2 6 -3 30]); % fija las posiciones de los ejes
%
## Otra grafica
% 
figure(2); % para que no borre la anterior
t = 0:0.2:6.3;
plot(t, cos(t), "or;coseno(t);",'markersize',5, t, sin(t), "b;seno(t);");
%
%
### VECTORES, MATRICES (operaciones basicas)
%
%
v=[1 2 3 -5] % es un vector fila;
v'  % es un vector columna (hemos usado la orden equivalente a transponer);
%
A=[1 2; 2 3; 0 -1];
printf("matriz 3x2\n")
disp(A)
%
ones(3) % crea una matriz de orden 3x3 con todos sus elementos 1
eye(4) % crea la matriz identidad de orden 4
b=[1 1 1]';
x=A\b % da una solucion de Ax=b
## BUCLES 
%
% Suma de los cuadrados de los primeros 20 numeros impares.
s=0;
for n=1:20
  m=2*n-1;
  s=s+m^2;
  printf("El entero impar es %i  y la suma acumulada es %.3f\n",m,s)
endfor
printf("La suma total de los cuadrados de los 20 primeros impares es %i\n",s)