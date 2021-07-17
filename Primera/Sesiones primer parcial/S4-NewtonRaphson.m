clc;

function y=f(x)
  y = x.^3 + x-3;
endfunction

function y=f1(x) %Función derivada de la función. No exiten funciones explicitas para dicho cálculo
  y = 3 * x.^2 + 1;
endfunction


disp("Metodo de Newton-Raphson");
[s msg] = fNewtonRaphson(@f, @f1, 1.5, 1e-8); %función, derivada, semilla y tolerancia
%Cuando el argumento de una función es otra función, usamos @

printf("Solución s ~= %.8f %s \n", s, msg); %.8f significa 8 deciamles float
%s es para variable de texto