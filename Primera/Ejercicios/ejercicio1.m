clc;
clear all;

function y = f(x)
  y = x.*e.^(-x/3) - 1/2;
endfunction
%
z = linspace(0,10,50);
figure(1);
plot([0 10], [0 0], 'r', z, f(z), 'b');
