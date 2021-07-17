clear all; 
clc; 
more off;


function y = f(x)
    y = sqrt(x)+cos(5./(x.^2+0.2))+0.2;
endfunction

a = 0; 
b = 3; 
tol = 1e-3;

%Funcion de Simpson simple
function y = S(a,b)
    m = (a+b)/2; 
    y = (b-a)/6*(f(a)+4*f(m)+f(b));
    global x n; 
    x = [x m]; 
    n++; % amplio la lista
endfunction


%Disponemos la integral como suma finita de Simpson simples
function y = intAdaptSimpson(a,b,e)
    m = (a+b)/2; 
    s2 = S(a,m) + S(m,b);

    if abs(S(a,b) - s2) < 10*e 
        y = s2; 
    else
        y = intAdaptSimpson(a,m,e/2) + intAdaptSimpson(m,b,e/2);
    endif
endfunction

%Simpson compuesta para comparar con la adaptativa
function y = SimpsonCompuesta(a,b,n)
    h = (b-a)/n; % n debe ser par
    xi = linspace(a+h,b-h,n/2); % los impares (x4)
    xp = linspace(a+2*h,b-2*h,n/2-1); % los pares (x2)
    y = h/3*(f(a)+4*sum(f(xi))+2*sum(f(xp))+f(b));
endfunction

%Vamos a graficar las soluciones
global x n=2; % para acceder dentro de la funcion S
q = quad(@f,a,b,[1e-12 0]); % valor real de la integral para el calculo del error

hf = figure(1); % para guardarla en archivo
x = linspace(a,b,200); 

plot(x,f(x),'k'); 
hold on;

x = [a b]; % lista de evaluaciones de f
s = intAdaptSimpson(a,b,tol); %Valor de la integral con el proceso adaptativo

%imprimimos el valor exacto calculado con quad
printf("Exacto %14.10f\n",q);

disp("Formula:      N       aprox        error");
printf("Adaptativa %4d %14.10f %9.2e\n",length(x),s,s-q);

plot(x,-0.8,'+r'); %pintamos las cruces rojas
text(a-0.4,-0.8,["A:" sprintf("%d",n)]);%el texto que aparece en el margen

n = 256; 
s = SimpsonCompuesta(a,b,n);

printf("Compuesta  %4d %14.10f %9.2e\n",n+1,s,s-q);
plot(linspace(a,b,n+1),-0.6,'+b');

text(a-0.4,-0.6,["C:" sprintf("%d",n+1)]);

hold off; 

print (hf, "T2-5-adaptS.png", "-dpng");