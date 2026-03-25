clc;clearvars;close all;
syms Q z l EI
%exact solution using Castigiliano's theorems
r1 = Q/2;
M1 = -r1*z;
M2 = M1+Q*(z-l/2);
U = int(M1^2/2/EI,z,0,l/2) + int(M2^2/2/EI,z,l/2,l)
q = vpa(diff(U,Q))
