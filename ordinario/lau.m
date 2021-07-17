clc;
clear all;
more off;

##PRIMER EJERCICIO##

function y = g(x)
    y = (5/9)*x + 35 ./ (9 * x.^2) - 49 ./ (9 * x.^5);
endfunction

x0 = 3;

% APARTADO a)
% Debemos comparar la función g(x) con la función f(x)=x, para comprobar si hay puntos fijos

function y = c(x)
    y = x;
endfunction

% Representamos gráficamente para ver que entre ambas funciones hay un único punto de corte
% (Y por tanto un único punto fijo en dicho intervalo)

a = 1.5;
b = 3;

% Hacemos una lista con los puntos donde evaluar las funciones
x = linspace(a, b, 50);

% mostramos la gráfica
figure(1);
plot(x, g(x), 'b;g(x);', x, c(x), 'k');




% APARTADO b)

disp('El metodo de iteracion funcional para la funcion g(x) permite aproximar el punto fijo');
disp('COmo la derivada de g es menor igual que 1 en valor absoluto, el metodo es ocnvergente, de orden 2');



% APARTADO c)

disp('Hemos visto que la raíz es unica en el apartado anterior');
s = g(7 ^ (1/3));


% APARTADO d)

% Varaible auxiliar 
x1 = x0;

% Mostramos por pantalla las 10 primeras iteraciones
disp('');
disp('Metodo iteracion funcional');
printf('%2d   %18.16f \n', 0, x1);

for i = 1 : 10

    x0 = x1;
    x1 = g(x0);

    printf('%2d   %18.16f \n', i, x1);
endfor

printf('s = %16.14f \n', s);

disp('Vemos que efectivamente el metodo es convergente');



## SEGUNDO EJERCICIO ##

function y = f(x)
    y = x .* exp(x);
endfunction

function y = TrCompuesta(a,b,N)
    % amplitud
    h = (b - a) / N;

    % nodos de evaluacion
    t = linspace(a+h, b-h, N-3);

    y = (h/2)*(f(a) + 2 * sum(f(t)) + f(b));

endfunction


a = 0;
b = 1;
N = 100;

Valor = TrCompuesta(a, b, N);

ValorReal = quad(@f, a, b);

err = abs(Valor - ValorReal);

printf('Aproximacion con valor %14.10f y error %9.2e\n', Valor, err);

