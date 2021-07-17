clear all;
clc;
more off;



% la ecuacion diferencial
function z = f(t,x) 
z = 4*cos(t);
endfunction

a = 0; % Condición inicial (valor de t) y comienzo del intervalo de estudio
b = 4; % Final del intervalo   

mu = 0; % X_0 condición inicial

N = 8; %Cantidad de subintervalos que queremos evaluar (en sus extremos). Numero de nodos = N+1
h = (b-a)/N; % Amplitud del intervalo


tn = []; 
xn = []; 

% Atribuimos las condiciones iniciales t0 y x0
tt = a; 
xx = mu;

% METODO DE EULER
do
    tn = [tn tt]; 
    xn = [xn xx];
    
    xx = xx + h*f(tt,xx); 
    tt = tt + h;

until tt>b

plot(tn, xn, 'k');

#########################################################
#####PARA COMPARAR CON LA FUNCIÓN EXACTA#################
#########################################################

%{
    
    function z = x(t) 
        z = 4*sin(t);
    endfunction

    tn = linspace(a,b,100);
    xn = x(tn);

    hold on; % para dibujar sobre la misma grafica anterior
    plot(tn,xn,'b');
    hold off;
%}