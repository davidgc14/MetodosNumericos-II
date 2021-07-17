clear all;
clc;
more off;

%Definición de la función dada
function y = f(x)
    y = sin(0.03 * x) + sqrt(x) + 2;
endfunction

%Ditribuimos los nodos según la formula dada
n = 30;
tn = [];
h = [];

for i = 0 : n
    aux = 50 * sqrt( sin((i * pi) / 80));
    tn = [tn aux];
    if i != 0
        h(i) = tn(i + 1) - tn(i);
    endif
endfor


a = 0;
mu = 1;

% APARTADO 1: Vamos a aproximar al solucion

xn = [];
tt = a;
xx = mu;

%Añadimos el primer valor al vector 
xn = [xn xx];


for i = 1:(length(tn) - 1)

    xx = xx + (h(i)/4)*(f(tn(i), xx) + 3 * f(tn(i) + (2/3)*h(i), xx + (2/3)*h(i)*f(tn(i), xx)));
    xn = [xn xx];
endfor

figure(1);
plot(tn, xn, 'k', tn, xn, 'ok');
%hold on;

#########################################################
% APARTADO 2: vamos a calcular las derivadas aproximadas a f


%Como nos pide interpolación clásica, imponemos exactitud. Así obtenemos los pesos

%Definimos la función que nos devuelva los pesos
% k=orden de la derivada, a=valor a evaluar en la derivada, nodos=vector de nodos

function alpha = pesosderiv(k, a, nodos) 
    n = length(nodos) - 1;

    % Inicializamos la matriz, para tener la primera fila con 1 (Vandermonde)
    M = ones(n + 1, n + 1); 

    %Calculamos ahora el resto de términos de la matriz
    for i = 1 : n 
        M(i + 1, :) = nodos.^i;
    endfor

    % Calculamos ahora los terminos independientes
    b = zeros(n + 1, 1);

    %para evitar un posible 0^0 definimos este termino como sigue
    b(k + 1, 1) = factorial(k); 
    
    % Y ahora calculamos el resto de valores
    for i = k+1 : n
        b(i + 1, 1) = factorial(i) * a^(i-k) / factorial(i-k);
    endfor

    % Devolvemos el vector de soluciones del sistema
    alpha = M\b;
endfunction


% Ahora definimos vector de derivadas y el de nodos
d = [];

%Introducimos el primer y ultimo término al vector (progresiva y regresiva)
d(1) = (xn(2) - xn(1)) / (tn(2) - tn(1));
d(n+1) = (xn(n+1) - xn(n)) / (tn(n+1) - tn(n));

%Ahora realizamos la función que devuelva las derivadas
for i = 2 : n
    d(i) = [xn(i-1) xn(i) xn(i+1)] * pesosderiv(1, tn(i), [tn(i-1) tn(i) tn(i+1)]);
endfor



##################################################################
% APARTADO 3: graficar la comparación

% Mostramos comparativa entre la aproximación de la derivada y la función original. 
% Se puede apreciar el error acumulado de integrar y derivar

figure(2);
plot(tn, d, 'r', tn, f(tn), 'b');

##################################################################
% APARTADO 4: mostrar por pantalla el nodo 15

printf('t(15)= %14.10f \n d(15)= %14.10f \n f_15= %14.10f \n', tn(14), d(14), f(tn(14)));


