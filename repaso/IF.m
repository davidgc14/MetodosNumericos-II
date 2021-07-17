clear all;
clc;
more off;

function y = f(x)
    y = x.^3 + 9*x.^2 - 6*exp(cos(pi * x));
endfunction

function y = g(x)
    y = 6*exp(cos(pi * x)) ./ (x.^2 + 9*x);
endfunction

figure(1);
x = linspace(0, 1, 50);
plot(x, g(x), 'b;g(x);', x, f(x), 'r;f(x);', [0 1], [0 1], 'k');
