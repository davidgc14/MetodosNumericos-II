clear all;
clc;
more off;

%Definición de la función dada
function y = f(x)
    y = sin(x./10) + sqrt(x) + 2;
endfunction


%Ditribuimos los nodos según la formula dada
n = 30;
t = [];

for i = 0 : n
    aux = 50 * sqrt( sin((i * pi) / 80));
    t = [t aux];
endfor



%Definimos ahora las fórmulas de aproximación

%PUNTO MEDIO
function y = PMedio(a,b)
    m = (a + b)/2;
    y = (b-a) * f(m);
endfunction

%RECTÁNGULO DERECHA
function y = RDerecha(a,b)
    y = (b-a) * f(b);
endfunction

%TRAPECIO
function y = Trapecio(a,b)
    y = (f(a) + f(b)) * (b-a)/2;
endfunction

%SIMPSON
function y = Simpson(a,b)
    m = (a + b)/2;
    y = ((b-a)/6) * (f(a) + 4*f(m) + f(b));
endfunction


%CALCULO DE PESOS
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


####################################################################
%PRIMER APARTADO: Calcular la integral de la función f(x) en [t_0, t_n]

%Disponemos cada uno de los intervalos en un elemento de nuestro vector F
F = [];
total = 0;
%Podemos usar cualquiera de las funciones (la que nos pidan)
for k = 1 : n
    for i = 1 : k
        aux = Trapecio(t(i), t(i+1));
        total = total + aux;
    endfor
    F(k) = total;
    total = 0;
endfor
F = [0 F];

#########################################################
% APARTADO 2: vamos a calcular las derivadas aproximadas a f

%Ahora basándonos en los valores de la integral, vamos a calcular los puntos de f DERIVADA
d = [];

%El primer y último nodo los calculamos aparte a partir de la formula de diferencia prograsiva y regresiva
d(1) = (F(2) - F(1)) / (t(2) - t(1));
d(n+1) = (F(n+1) - F(n)) / (t(n+1) - t(n));

for i = 2 : n
    d(i) = [F(i-1) F(i) F(i+1)] * pesosderiv(1, t(i), [t(i-1) t(i) t(i+1)]);
endfor

##################################################################
% APARTADO 3: graficar la comparación

% Mostramos comparativa entre la aproximación de la derivada y la función original. 
% Se puede apreciar el error acumulado de integrar y derivar

figure(1);
plot(t, d, 'r', t, f(t), 'b');


##################################################################
% APARTADO 4: mostrar por pantalla el nodo 15

printf('t(15)= %14.10f \n d(15)= %14.10f \n f_15= %14.10f \n', t(14), d(14), f(t(14)));

