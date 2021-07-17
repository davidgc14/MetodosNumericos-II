clear all;
clc;

A = [1 2 3 4 5;6 7 8 9 10;11 12 13 14 15;16 17 18 19 20];


v = A(3, :) %todo lo que sigue hace lo mismo
%A(3, 1 : end)
%A(3, 1 : 5)

w = A(3, 2) %Esto indica la posición exacta, o tambien A(3, end)

x = rows(A) %esto es simplemente un contador

#######################################################################
#######################################################################

clear all;
clc;

A = [-1 2 -1 ; 2 1 -2 ; 1 3 -3];
b = [1 1 1]'; %se le pone ' para que sea traspuesta

%queremos resolver el sistema Ax = b

x = A\b

% solve(Ax = b) o linearsolve(A,b) no es una opción

%z = fun([1 2],[1 2 3])

#######################################################################
#######################################################################

clear all;
clc;

function y = g(x)
  y = 3*x.^2 - 1;
endfunction
%{
figure(1);
x = 0 : 0.02 : 1;
plot(x, g(x), 'r', [0 1], [0 1], 'b');

figure(2);
plot(0 : 1/100 : 1, g(0 : 1/100 : 1), 'r', [0 1], [0 1], 'b');

figure(3);
clear x;
x = linspace(0, 1, 50);
plot(x, g(x), 'r', [0 1], [0 1], 'b');

x = linspace(0, 1, 50);
figure(4);
plot(x, x, 'or');
%}

#######################################################################
#######################################################################

clear all;
clc;

A = [1 2 3 4 5;6 7 8 9 10;11 12 13 14 15;16 17 18 19 20];

v = A(:,3)' %sin la coma tendríamos un vector columna, el enunciado pide fila
w = A'(3,:)
%tambien es valido transpose(A)(3,:) ó transpose(A(:,3))

x=dot(v,w)



#######################################################################
#######################################################################

clear all;
clc;

linspace(0,30,11)