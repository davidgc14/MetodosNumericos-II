clear all;
clc;
more off;


function z = f(t,x) % la ecuacion diferencial
    z = 4*cos(t);
endfunction

function z = x(t) % la solucion
    z = 4*sin(t);
endfunction

a = 0;
b = 2*pi;
mu = 0;
N = 6;
h = (b-a)/N;

tn = linspace(a,b,100);
xn = x(tn);

hf = figure(1); % para guardarla en archivo
plot(tn,xn,'k');
hold on; %voy a superponer en la misma grafica

####################################################
%metodo de Euler
tn = [];
xn = [];
tt = a;
xx = mu;

do
    tn = [tn tt];
    xn = [xn xx];

    xx = xx + h*f(tt,xx);
    tt = tt + h;

until tt > b

plot(tn,xn,'b',tn,xn,'ob;Euler;');

###################################################
%metodo del punto medio
tn = [];
xn = [];
tt = a;
xx = mu;

do
    tn = [tn tt];
    xn = [xn xx];

    xx = xx + h*f(tt + h/2, xx + h/2*f(tt,xx));
    tt = tt + h;

until tt > b;

plot(tn,xn,'r',tn,xn,'vr;Pto medio;');

##################################################
%metodo de Heum
tn = [];
xn = [];
tt = a;
xx = mu;

do
    tn = [tn tt];
    xn = [xn xx];

    xx = xx + (h/2)*(f(tt, xx) + f(tt + h, xx + h*f(tt, xx)));
    tt = tt + h;

until tt > b;

plot(tn,xn,'m',tn,xn,'dm;Heun;');

##################################################
%Metodo de Runge-Kutta para m=2 OPTIMO
tn = [];
xn = [];
tt = a;
xx = mu;

do
    tn = [tn tt];
    xn = [xn xx];

    xx = xx + (h/4)*(f(tt, xx) + 3 * f(tt + (2/3)*h, xx + (2/3)*h*f(tt, xx)));
    tt = tt + h;

until tt > b;

plot(tn,xn,'y',tn,xn,'oy;RK optimo;');

##################################################
% Metodo RK Clásico

tn = [];
xn = [];
K = [];

tt = a;
xx = mu;

do
    tn = [tn tt];
    xn = [xn xx];

    K(1) = f(tt, xx);
    K(2) = f(tt + h/2, xx + (h/2)*K(1));
    K(3) = f(tt + h/2, xx + (h/2)*K(2));
    K(4) = f(tt + h, xx + h*K(3));

    xx =xx + (h/6) * (K(1) + 2*K(2) + 2*K(3) + K(4));
    tt = tt + h;

until tt > b;

plot(tn,xn,'g',tn,xn,'dg;RK Clasico;');

##################################################
hold off; %he terminado la grafica


%print (hf, "T3.2.EulerPMH.png", "-dpng");
%close; %cierra la ventana de la figura