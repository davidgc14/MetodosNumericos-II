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

printf('I = %14.10f\n',intAdaptSimpson(a,b,tol));