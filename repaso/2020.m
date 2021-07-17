clear all;
clc;
more off;

%Definición de la función dada
function y = f(x)
    y = sin(x./10) + sqrt(x) + 2;
endfunction

n = 30;
t = [];

for i = 0 : n
    aux = 50 * sqrt( sin((i * pi) / 80));
    t = [t aux];
endfor