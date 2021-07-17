##########################################
### Ejercicios practicos de ecuaciones ###
##########################################
clear all; %borrado general
clc; %limpieza de pantalla
more off; %sin interrupciones en pantalla
disp("EJERCICIOS PRACTICOS -- ECUACIONES");
disp(""); %linea en blanco de separacion
%
% Ejercicio 3
%
disp("Ejercicio 3.-");
function y=g1(x)
  y=-x.^3/9-1;
endfunction
function y=g3(x)
  y = x.^3+10*x+9;
endfunction
%
x0 = -1.5; x1 = g1(x0); x2 = g1(x1);
a0 = x0 - (x1-x0)^2/(x2-2*x1+x0);
s0 = a0;
disp('3.a) ACELERACIONES DE AITKEN Y STEFFENSEN');
disp('         g1              Aitken          Steffensen');
formato = '%18.14f';
printf([formato '\n'],x0);
printf([formato '\n'],x1);
printf([formato formato formato '\n'],x2,a0,s0);
for n = 1:3
  for j = 1:2
  x0 = x1; x1 = x2; x2 = g1(x1);
  a0 = x0 - (x1-x0)^2/(x2-2*x1+x0);
  printf([formato formato '\n'],x2,a0);
  endfor
  x0 = x1; x1 = x2; x2 = g1(x1);
  a0 = x0 - (x1-x0)^2/(x2-2*x1+x0);
  s1 = g1(s0); s2 = g1(s1);
  s0 = s0 - (s1-s0)^2/(s2-2*s1+s0);
  printf([formato formato formato '\n'],x2,a0,s0);
endfor
disp("------------------------------------------------------");
disp("Aitken va mas rapido, y parece que Steffensen aun mas.");
%
x0 = -1.5; n=0;
x1 = x0;
disp('');
disp('3.b) ACELERACION DE STEFFENSEN PARA g3');
disp(' n     Steffensen');
formato = '%18.14f';
do
  n++; x0 = x1;
  s1 = g3(x0); s2 = g3(s1);
  x1 = x0 - (s1-x0)^2/(s2-2*s1+x0);
  printf('%2d %18.14f\n',n,x1);
until abs(x1-x0) < 1e-8
disp("---------------------------");
disp("Steffensen consigue recuperar la convergencia.");
disp("==== FIN DEL EJERCICIO ====");