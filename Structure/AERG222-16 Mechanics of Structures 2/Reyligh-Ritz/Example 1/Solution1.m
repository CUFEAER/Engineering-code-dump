clc;clearvars;close all;
syms q Q l z EI a1 a2 a3

%choose a solution for v or q
v = a1*sin(pi*z/l)
q = subs(v,z,l/2);
%the function satisfies end conditions so it's ok
%then we use the PMPE to impose the equilibrium conditions

M = -EI*diff(diff(v,z),z) %a function for the moment as we do not have it

Ub = int(M^2/2/EI,z,0,l);
U = Ub; %neglecting the effect of the axial and shear forces
Ve = -Q*q
PI = U+Ve
e = diff(PI,a1)
a1 = solve(e,a1)
q = vpa(eval(q)) %approximate solution with 1.44% error less than the exact value
