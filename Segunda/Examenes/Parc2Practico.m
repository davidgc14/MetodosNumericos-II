clear all; 
clc; 
more off;


function y = f(t) 
  y = 3 .* cos(t ./ 2) + log(t + 3) +1; 
endfunction

a = 0;
b = 10;

#######################################################################
% PRIMER APARTADO

function y = F(t)
    y = 6 * sin(t ./ 2) + (t + 3) .* log(t + 3);
endfunction

figure(1);
puntos = linspace(a,b,100);
plot(puntos, F(puntos), 'k; F(t);');

% Vamos a superponer gráficas
hold on;


#######################################################################
% SEGUNDO APARTADO

%definimos el vector de nodos y lo inicializamos
tn = [];

%primer nodo nulo
tn = [0 tn];

% resto de nodos
for i = 1 : 29
    aux = 10 / (1 + exp(15 - i));
    tn = [tn aux];
endfor

% añadimos el ultimo valor
tn = [tn 10];

 % almacenamos el número de nodos
 n = length(tn);

 % Definimos el metodo del trapecio
 function y = Trapecio(a,b)
    y = (f(a) + f(b)) * (b-a)/2;
endfunction

% Y definimos la función integral
% para ello almacenamos dichos valores en un vector
Fn = [];
total = 0;

for k = 1 : n - 1
    for i = 1 : k
        aux = Trapecio(tn(i), tn(i+1));
        total = total + aux;
    endfor
    Fn(k) = 3*log(3) + total;
    total = 0;
endfor

%queda aqui guardado el valor de las integrales evaluadas de t0 a ti
Fn = [0 Fn];



#######################################################################
% TERCER APARTADO

% teniamos la gráfica esperando, luego podemos superponer
plot(tn, Fn, 'r;Trapecio;');

% la extraña distribución de los nodos, acumulados al principio y al final de nuestro intervalo, 
% se debe a la propia definición de distribución de nodos


#######################################################################
% CUARTO APARTADO

% definimos las condiciones iniciales
t0 = tn(1);
x0 = 3 * log(3);

%definimos el vector donde guardaremos los resultados de las iteraciones
xn = [];

%le añadimos la condicion inicial
xn = [x0 xn];

%esta va ser nuestra variable auxiliar
xx = x0;

% n-1 iteraciones para que t(30) nos proporcione x(31)
for i = 1 : n - 1

    %definimos la longitud del intervalo
    h = tn(i+1) - tn(i);

    % Calculamos cada uno de los coeficientes
    K(1) = f(tn(i), xx);
    K(2) = f(tn(i) + h/2, xx + (h/2)*K(1));
    K(3) = f(tn(i) + h/2, xx + (h/2)*K(2));
    K(4) = f(tn(i) + h, xx + h*K(3));

    %calculamos la iteración actual
    xx =xx + (h/6) * (K(1) + 2*K(2) + 2*K(3) + K(4));
   
    %añadimos en cada iteración el resultado obtenido en la anterior
    xn = [xn xx];
endfor

%Ya tenemos almacenadas nuestras iteraciones en el vector xn

#######################################################################
% QUINTO APARTADO

%Como la gráfica sigue esperando, podemos superponer la función
plot(tn, xn, 'b;RK4;');
printf('Podemos observar en la grafica mostrada que el metodo RK4 se aproxima bastante mejor que la formula del trapecio\n');
printf('Esto se debe a su diferencia de orden de exactitud: 4 (RK4) frente a 1 (Trapecio)\n');