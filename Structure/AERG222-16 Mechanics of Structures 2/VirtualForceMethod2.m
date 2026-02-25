clc;clearvars;close all;
syms Q1 l th E A G Aeq I R h t
N = -Q1*cos(th);
S = -Q1*sin(th);
M = Q1*R*cos(th);

Nb = sin(th);
Sb = -cos(th);
Mb = R-R*sin(th);
A = h*t;
Aeq = 5/6*A;
I = t*h^3/12;
nu = 0.3;
G = E/2/(1+nu);
d = int(R*(N*Nb/E/A+M*Mb/E/I+S*Sb/G/Aeq),th,0,pi/2)