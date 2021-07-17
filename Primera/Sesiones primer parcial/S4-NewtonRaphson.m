clc;

function y=f(x)
  y = x.^3 + x-3;
endfunction

function y=f1(x) %Funci�n derivada de la funci�n. No exiten funciones explicitas para dicho c�lculo
  y = 3 * x.^2 + 1;
endfunction


disp("Metodo de Newton-Raphson");
[s msg] = fNewtonRaphson(@f, @f1, 1.5, 1e-8); %funci�n, derivada, semilla y tolerancia
%Cuando el argumento de una funci�n es otra funci�n, usamos @

printf("Soluci�n s ~= %.8f %s \n", s, msg); %.8f significa 8 deciamles float
%s es para variable de texto