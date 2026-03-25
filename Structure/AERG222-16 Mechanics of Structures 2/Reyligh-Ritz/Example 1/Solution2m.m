clc;clearvars;close all;
syms q Q l z EI a1 a2 a3

%choose a more refined solution for v
v = a1*sin(pi*z/l)+a2*sin(2*pi*z/l)+a3*sin(3*pi*z/l)
q = subs(v,z,l/2);
%the function satisfies end conditions so it's ok
%then we use the PMPE to impose the equilibrium conditions

M = -EI*diff(diff(v,z),z) %a function for the moment as we do not have it

Ub = int(M^2/2/EI,z,0,l);
U = Ub; %neglecting the effect of the axial and shear forces
Ve = -Q*q
PI = U+Ve
e1 = diff(PI,a1)
e2 = diff(PI,a2)
e3 = diff(PI,a3)
[a1,a2,a3] = solve(e1,e2,e3,a1,a2,a3)
q = vpa(eval(q)) %approximate solution with 0.23% error less than the exact value

